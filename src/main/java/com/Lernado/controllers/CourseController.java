package com.Lernado.controllers;

import com.Lernado.beans.RoomCourseBean;
import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.CourseRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Course;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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


    @RequestMapping("/wishlist")
    public String wishlistPage() {return "wishlistPage";}

    @RequestMapping(value="/search", method = RequestMethod.GET)
    public String search(String phrase, Model model) {
        List<AbstractMap.SimpleEntry> pairs = new ArrayList<>();
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
        return "searchPage";
    }

    @RequestMapping(value="/advanceSearch", method = RequestMethod.GET)
    public String advanceSearch(Model model, String phrase, String category, String level) {
        List<AbstractMap.SimpleEntry> pairs = new ArrayList<>();
        List<AbstractMap.SimpleEntry> highlighted = new ArrayList<>();
        List<Course> courses;
        List<Course> highlightedCourses = courseRepository.findByHighlighted(true);
        if(StringUtils.isEmpty(phrase)){
            phrase ="%";
        } else {
            phrase = "%" + phrase + "%";
        }
        if(StringUtils.isEmpty(category)|| category.equals("Any")){
            category ="%";
        }
        if(StringUtils.isEmpty(level) || level.equals("Any")){
            level = "%";
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
        return "searchPage";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    private String showCoursePage(@PathVariable("id") int courseId, Model model){

        Course currentCourse = courseRepository.getOne(courseId);
        String base64 =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentCourse.getPhotoBinary());
        String base64Teacher =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentCourse.getCreator().getPhotoBinary());
        model.addAttribute("currentPhoto", base64);
        model.addAttribute("currentCourse", currentCourse);
        model.addAttribute("currentTeacher",currentCourse.getCreator());
        model.addAttribute("currentTeacherPhoto", base64Teacher);

        return "enrollCoursePage";
    }

    @RequestMapping("/create")
    public String createCourse(RoomCourseBean rcBean) throws IOException {
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

        return "homePage";
    }
}
