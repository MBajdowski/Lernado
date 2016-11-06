package com.Lernado.controllers;

import com.Lernado.managers.CourseRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Course;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

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
//        return "simple";
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loggingPage(){
        return "login";
    }

    @RequestMapping("/homePage")
    public String home(){
        return "homePage";
    }

    @RequestMapping("/errorPage")
    public String error(){
        return "errorPage";
    }

}
