package com.Lernado.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class MainController {

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
    public String search() {
        return "searchPage";
    }

    @RequestMapping("/signUp")
    public String signUp() { return "signUpPage";}

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

}
