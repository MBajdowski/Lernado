package com.Lernado.controllers;

import com.Lernado.beans.RoomCourseBean;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;


@Controller
public class MainController {

    @Autowired
    private CourseController courseController;
    @Autowired
    private RoomController roomController;
    @Autowired
    private UserController userController;

    @RequestMapping("/")
    public String index() {return "loginPage"; }

    @RequestMapping("/createPage")
    public String create() {return "createPage";}

    @RequestMapping("/coursePage")
    public String coursePage() {
        return "coursePage";
    }

    @RequestMapping("/home")
    public String home(Model model) throws IOException {
        userController.getUserCoursesAndRooms(model);
        return "homePage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loggingPage(@RequestParam("error") String error, Model model){

        if(error.compareTo("")==0){
            model.addAttribute("wrongCredentials", true);
        }
        return "loginPage";
    }

    @RequestMapping("/signUp")
    public String signUp(Model model) {
        model.addAttribute("previousUser", new User());
        return "signUpPage";
    }

    @RequestMapping("/createCourseRoom")
    public String redirectCourseRoom(RoomCourseBean rcBean, MultipartFile photo, Model model) throws IOException {
        if (photo!=null && photo.getSize()!=0)
            rcBean.setPhotoBinary(photo.getBytes());

        if (rcBean.getType()==null || rcBean.getType().equals("room"))
            return roomController.createRoom(rcBean);
        return courseController.createCourse(rcBean, model);
    }
}
