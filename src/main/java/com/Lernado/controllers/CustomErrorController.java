package com.Lernado.controllers;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

   @RequestMapping("/error")
   public String handleNotFound(){
       return "errorPage";
   }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
