package com.Lernado.controllers;

import com.Lernado.managers.UserRepository;
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

    @RequestMapping("/")
    public String index(Model model){
        List<User> list = userRepository.findAll();

        model.addAttribute("userList", list);
        return "simple";
    }
}
