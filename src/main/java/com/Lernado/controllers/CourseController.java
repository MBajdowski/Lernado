package com.Lernado.controllers;

import com.Lernado.beans.JmsMessage;
import com.Lernado.beans.MaterialBean;
import com.Lernado.beans.RoomCourseBean;
import com.Lernado.managers.*;
import com.Lernado.jms.JmsService;
import com.Lernado.model.Course;
import com.Lernado.model.Lesson;
import com.Lernado.model.Material;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private LessonRepository lessonRepository;
    @Autowired
    private MaterialRepository materialRepository;
    @Autowired
    private UserController userController;
    @Autowired
    private RoomController roomController;


    @RequestMapping("/wishlist")
    public String wishlistPage() {return "wishlistPage";}

    @RequestMapping(value="/search", method = RequestMethod.GET)
    public String search(String phrase, Model model) {
        List<AbstractMap.SimpleEntry> pairs = new ArrayList<>();
        List<AbstractMap.SimpleEntry> rooms = roomController.searchRooms(phrase);
        List<AbstractMap.SimpleEntry> highlighted = new ArrayList<>();
        List<Course> courses;
        List<Course> highlightedCourses = courseRepository.findByHighlighted(true);
        if(StringUtils.isEmpty(phrase)){
            courses = courseRepository.findAll();
        } else {
            courses = courseRepository.findByTitleContaining(phrase);
        }
        for(Course course : courses){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(course.getPhotoBinary());
            pairs.add(new AbstractMap.SimpleEntry(course, base64));
        }
        for(Course highlightedCourse : highlightedCourses){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(highlightedCourse.getPhotoBinary());
            highlighted.add(new AbstractMap.SimpleEntry(highlightedCourse, base64));
        }
        model.addAttribute("pairs", pairs);
        model.addAttribute("highlighted", highlighted);
        model.addAttribute("rooms", rooms);
        model.addAttribute("advanceSearch", false);
        return "searchPage";
    }

    @RequestMapping(value="/advanceSearch", method = RequestMethod.GET)
    public String advanceSearch(Model model, String phrase, String category, String level) {
        boolean ifAddRooms = true;
        List<AbstractMap.SimpleEntry> pairs = new ArrayList<>();
        List<AbstractMap.SimpleEntry> highlighted = new ArrayList<>();
        List<AbstractMap.SimpleEntry> rooms = new ArrayList<>();
        List<Course> courses;
        List<Course> highlightedCourses = courseRepository.findByHighlighted(true);
        if(StringUtils.isEmpty(category)|| category.equals("Any")){
            category ="%";
        } else {
            ifAddRooms = false;
        }
        if(StringUtils.isEmpty(level) || level.equals("Any")){
            level = "%";
        } else {
            ifAddRooms = false;
        }
        if(ifAddRooms){
            rooms = roomController.searchRooms(phrase);
        }
        if(StringUtils.isEmpty(phrase)){
            phrase ="%";
        } else {
            phrase = "%" + phrase + "%";
        }
        courses = courseRepository.findByCategoryLikeAndLevelLikeAndTitleLike(category, level, phrase);
        for(Course course : courses){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(course.getPhotoBinary());
            pairs.add(new AbstractMap.SimpleEntry(course, base64));
        }
        for(Course highlightedCourse : highlightedCourses){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(highlightedCourse.getPhotoBinary());
            highlighted.add(new AbstractMap.SimpleEntry(highlightedCourse, base64));
        }
        model.addAttribute("pairs", pairs);
        model.addAttribute("highlighted", highlighted);
        model.addAttribute("advanceSearch", !ifAddRooms);
        if(ifAddRooms){
            model.addAttribute("rooms", rooms);
        }
        return "searchPage";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String showCoursePage(@PathVariable("id") int courseId, Model model){

        Course currentCourse = courseRepository.getOne(courseId);
        User currentUser = userController.getCurrentUser();
        model.addAttribute("currentCourse", currentCourse);
        String base64 =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentCourse.getPhotoBinary());
        model.addAttribute("currentPhoto", base64);
        List<Material> userMaterials = currentUser.getMaterials();
        model.addAttribute("userMaterials", userMaterials);

        if(currentUser.getAttends().contains(currentCourse)||currentUser.getCreatedCourses().contains(currentCourse)){
            return "coursePage";
        }

        String base64Teacher =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentCourse.getCreator().getPhotoBinary());
        model.addAttribute("currentTeacher",currentCourse.getCreator());
        model.addAttribute("currentTeacherPhoto", base64Teacher);
        model.addAttribute("currentLessonId", 0);

        return "enrollCoursePage";
    }

    @RequestMapping("/create")
    public String createCourse(RoomCourseBean rcBean, Model model) throws IOException {
        User user = userRepository.getOne(rcBean.getCreatorId());

        Course course = Course.builder().admin(adminRepository.getOne(1))
                .title(rcBean.getTitle())
                .description(rcBean.getDescription())
                .level(rcBean.getLevel())
                .category(rcBean.getCategory())
                .syllabus(rcBean.getSyllabus())
                .price(rcBean.getPrice())
                .photoBinary(rcBean.getPhotoBinary())
                .creator(user)
                .build();
        courseRepository.save(course);

        return showCoursePage(course.getIdcourse(), model);
    }

    @RequestMapping("{id}/addLesson")
    public String addLesson(@PathVariable("id") int courseId, Model model, HttpServletResponse res) throws IOException {
        User currentUser = userController.getCurrentUser();
        Course currentCourse =  courseRepository.getOne(courseId);
        if(currentUser.getIduser() != currentCourse.getCreator().getIduser())
            res.sendError(401);

        Lesson newLesson = Lesson.builder().title("Example title")
                .course(currentCourse)
                .number(currentCourse.getLessons().size()+1)
                .build();
        lessonRepository.save(newLesson);

        currentCourse.getLessons().add(newLesson);
        courseRepository.save(currentCourse);
        List<Material> userMaterials = currentUser.getMaterials();
        model.addAttribute("userMaterials", userMaterials);
        return showCoursePage(courseId, model);
    }

    @RequestMapping("{id}/enroll")
    public String enrollStudent(@PathVariable("id") int courseId, Model model){
        User currentUser = userController.getCurrentUser();

        currentUser.getAttends().add(courseRepository.getOne(courseId));
        userController.setAuthUser(userRepository.save(currentUser));

        return showCoursePage(courseId, model);
    }

    @RequestMapping(value = "/{id}/chatRoom", method = RequestMethod.GET)
    public String chatRoom(@PathVariable("id") int courseId, Model model){
        Course currentCourse = courseRepository.getOne(courseId);
        User currentUser = userController.getCurrentUser();
        model.addAttribute("currentCourse", currentCourse);
        String base64 =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentCourse.getPhotoBinary());
        model.addAttribute("currentPhoto", base64);

        if(currentUser.getAttends().contains(currentCourse)||currentUser.getCreatedCourses().contains(currentCourse)){
            JmsService jmsService = new JmsService();
            List<JmsMessage> chat = jmsService.receiveAllFrom(String.valueOf(currentCourse.getIdcourse()));
            model.addAttribute("chat", chat);
            model.addAttribute("principalId", currentUser.getIduser());
            return "courseChatPage";
        }

        String base64Teacher =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentCourse.getCreator().getPhotoBinary());
        model.addAttribute("currentTeacher",currentCourse.getCreator());
        model.addAttribute("currentTeacherPhoto", base64Teacher);

        return "enrollCoursePage";
    }

    @RequestMapping(value = "/{id}/chatRoom", method = RequestMethod.POST)
    public String chatRoomMsgPost(@PathVariable("id") int courseId, String message, Model model){
        User currentUser = userController.getCurrentUser();

        JmsService jmsService = new JmsService();
        JmsMessage jmsMessage = JmsMessage.builder()
                    .iduser(currentUser.getIduser())
                    .author(currentUser.getFirstName()+" "+currentUser.getLastName())
                    .message(message)
                    .build();
        jmsService.sendTo(String.valueOf(courseId),jmsMessage);

        return chatRoom(courseId,model);
    }

    @RequestMapping("/addMaterial")
    public String addMaterial(int lessonId, MaterialBean mBean, String type, Model model,
                              HttpServletResponse res, String path) throws IOException {
        User currentUser = userController.getCurrentUser();
        //Course currentCourse =  courseRepository.getOne(courseId);
        Lesson currentLesson = lessonRepository.getOne(lessonId);
        if(currentUser.getIduser() != currentLesson.getCourse().getCreator().getIduser())
            res.sendError(401);

        Material newMaterial = Material.builder().title(mBean.getTitle())
                .description(mBean.getDescription())
                .path(path)
                .type(type)
                .creator(currentUser)
                .build();
        newMaterial = materialRepository.save(newMaterial);

        currentLesson.getMaterials().add(newMaterial);
        lessonRepository.save(currentLesson);
        currentUser.getMaterials().add(newMaterial);
        userController.setAuthUser(userRepository.save(currentUser));

        List<Material> userMaterials = currentUser.getMaterials();
        model.addAttribute("userMaterials", userMaterials);
        return showCoursePage(currentLesson.getCourse().getIdcourse(), model);
    }
    @RequestMapping("{idlesson}/{idmaterial}/removeMaterial")
    public String removeMaterial(@PathVariable("idlesson") int lessonId,@PathVariable("idmaterial") int materialId, Model model){
        Lesson currentLesson = lessonRepository.getOne(lessonId);
        Material material = materialRepository.getOne(materialId);
        User currentUser = userController.getCurrentUser();
        currentLesson.getMaterials().remove(material);
        lessonRepository.save(currentLesson);

        List<Material> userMaterials = currentUser.getMaterials();
        model.addAttribute("userMaterials", userMaterials);
        return showCoursePage(currentLesson.getCourse().getIdcourse(), model);
    }
    @RequestMapping("{idlesson}/{idmaterial}/addExistingMaterial")
    public String addExistingMaterial(@PathVariable("idlesson") int lessonId,@PathVariable("idmaterial") int materialId,
                                      Model model, HttpServletResponse res) throws IOException{
        User currentUser = userController.getCurrentUser();
        Lesson currentLesson = lessonRepository.getOne(lessonId);
        if(currentUser.getIduser() != currentLesson.getCourse().getCreator().getIduser())
            res.sendError(401);

        Material material = materialRepository.getOne(materialId);

        currentLesson.getMaterials().add(material);
        lessonRepository.save(currentLesson);

        List<Material> userMaterials = currentUser.getMaterials();
        model.addAttribute("userMaterials", userMaterials);
        return showCoursePage(currentLesson.getCourse().getIdcourse(), model);
    }
}
