package com.Lernado.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping("/")
    public String index() {
        return "loginPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loggingPage() {
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
    public String signUp() {
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

    @RequestMapping(value = "/login")
    public String login() {
//    public String login(@RequestParam String error){
//        System.out.println("Jestem w login get");
//        if(error.compareTo("")==0)
//            return "errorPage";
        return "login";
    }

}
