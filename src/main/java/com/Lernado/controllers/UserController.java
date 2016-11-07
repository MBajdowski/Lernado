package com.Lernado.controllers;

import com.Lernado.managers.UserRepository;
import com.Lernado.model.User;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createUser( @NonNull User  user){
        User savedUser = userRepository.save(user);
        return "homePage";
    }
}
