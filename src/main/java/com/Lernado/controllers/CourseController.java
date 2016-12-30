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

    @RequestMapping("/search")
    public String search(Model model) {
        List<AbstractMap.SimpleEntry> pairs = new ArrayList<>();
        List<Course> courses = courseRepository.findAll();

        for(Course course : courses){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(course.getPhotoBinary());
            pairs.add(new AbstractMap.SimpleEntry(course, base64));
        }
        model.addAttribute("pairs", pairs);
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
