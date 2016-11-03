package com.Lernado.controllers;

import com.Lernado.managers.CourseRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Course;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    @RequestMapping("/")
    public String index(Model model){
        List<User> listU = userRepository.findAll();
        List<Course> listC = courseRepository.findAll();

        for(User u : listU){
            u.setAttendedCourses(listC);
            userRepository.save(u);
        }
        List<User> list = userRepository.findAll();

        model.addAttribute("userList", list);
        return "simple";
    }
}
