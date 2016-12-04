package com.Lernado.controllers;

import com.Lernado.managers.CourseRepository;
import com.Lernado.model.Course;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


@Controller
public class MainController {

    @Autowired
    private CourseRepository courseRepository;


    @RequestMapping("/")
    public String index() {return "loginPage"; }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loggingPage(@RequestParam("error") String error, Model model){

        if(error.compareTo("")==0){
            model.addAttribute("wrongCredentials", true);
        }
        return "loginPage";
    }

    @RequestMapping("/homePage")
    public String home() {
        return "homePage";
    }

    @RequestMapping("/errorPage")
    public String error() {
        return "errorPage";
    }

    @RequestMapping("/search")
    public String search(Model model) {

        model.addAttribute("courseList", courseRepository.findAll());
        return "searchPage";
    }

    @RequestMapping("/signUp")
    public String signUp(Model model) {
        model.addAttribute("previousUser", new User());
        return "signUpPage";
    }

    @RequestMapping("/createPage")
    public String create() {
        return "createPage";
    }

    @RequestMapping("/profilePage")
    public String profilePage() {
        return "profilePage";
    }

    @RequestMapping("/coursePage")
    public String coursePage() {
        return "coursePage";
    }

    @RequestMapping("/enrollCoursePage")
    public String enrollCoursePage() {return "enrollCoursePage";}

    @RequestMapping("/wishlistPage")
    public String wishlistPage() {return "wishlistPage";}

    @RequestMapping("/roomsPage")
    public String roomsPage() {return "roomsPage";}

    @RequestMapping(value="/file", method = RequestMethod.POST)
    public String uploadFile(Model model, MultipartFile file){
        try {
            byte[] photoBinary = file.getBytes();
            String base64 = "data:image/jpg;base64,"+Base64.getEncoder().encodeToString(photoBinary);
            model.addAttribute("filePath", base64);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "homePage";
    }

}
