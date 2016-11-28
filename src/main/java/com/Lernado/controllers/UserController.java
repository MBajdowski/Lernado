package com.Lernado.controllers;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.User;
import com.Lernado.security.CurrentUser;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AdminRepository adminRepository;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createUser(@NonNull User user, HttpServletResponse r, Model model){
        try {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            user.setPassword(encoder.encode(user.getPassword()));
            user.setAdmin(adminRepository.getOne(1));
            User savedUser = userRepository.save(user);

            UserDetails userDetails = new CurrentUser(savedUser.getEmail(), savedUser.getPassword(), savedUser.getFirstName(), savedUser.getLastName(), savedUser.getIduser());
            Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(auth);
        }catch (Exception e){
            model.addAttribute("emailInUse", true);
            return "signUpPage";
        }
        return "homePage";
    }
}
