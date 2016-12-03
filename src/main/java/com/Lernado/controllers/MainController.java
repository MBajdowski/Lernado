package com.Lernado.controllers;

import com.Lernado.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


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

    @RequestMapping(value = "/login")
    public String login() {
//    public String login(@RequestParam String error){
//        System.out.println("Jestem w login get");
//        if(error.compareTo("")==0)
//            return "errorPage";
        return "login";
    }

}
