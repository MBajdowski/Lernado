package com.Lernado.controllers;

import com.Lernado.managers.CourseRepository;
import com.Lernado.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;


    @RequestMapping("/wishlist")
    public String wishlistPage() {return "wishlistPage";}

    @RequestMapping("/search")
    public String search(Model model) {
        List<AbstractMap.SimpleEntry> pairs = new ArrayList<>();
        List<Course> courses = courseRepository.findAll();

        for(Course course : courses){
            String base64 = course.getPhotoBinary()==null?
                    "/images/courseDefault.jpg":"data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(course.getPhotoBinary());
            pairs.add(new AbstractMap.SimpleEntry(course, base64));
        }
        model.addAttribute("pairs", pairs);
        return "searchPage";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    private String showCoursePage(@PathVariable("id") int courseId, Model model){

        Course currentCourse = courseRepository.getOne(courseId);
        String base64 = currentCourse.getPhotoBinary()==null?
                "/images/courseDefault.jpg":
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentCourse.getPhotoBinary());
        model.addAttribute("currentPhoto", base64);
        model.addAttribute("currentCourse", currentCourse);
        model.addAttribute("currentTeacher",currentCourse.getCreator());
        return "enrollCoursePage";
    }
}
