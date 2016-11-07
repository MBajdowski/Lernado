package com.Lernado.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

    @RequestMapping("/")
    public String index(){ return "loginPage"; }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loggingPage(){
        return "loginPage";
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
