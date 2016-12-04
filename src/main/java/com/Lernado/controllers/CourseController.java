package com.Lernado.controllers;

import com.Lernado.managers.CourseRepository;
import com.Lernado.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    private String showCoursePage(@PathVariable("id") int courseId, Model model){

        Course currentCourse = courseRepository.getOne(courseId);
        model.addAttribute("currentCourse", currentCourse);
        model.addAttribute("currentTeacher",currentCourse.getCreator());
        return "enrollCoursePage";
    }
}
