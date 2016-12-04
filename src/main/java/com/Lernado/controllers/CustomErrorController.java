package com.Lernado.controllers;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleNotFound(HttpServletResponse res, Model model) {
        if(res.getStatus()==400)
            return "loginPage";
        model.addAttribute("errorStatus", res.getStatus());
        return "errorPage";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
