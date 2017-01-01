package com.Lernado.controllers;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Course;
import com.Lernado.model.Room;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AdminRepository adminRepository;

    @RequestMapping("/profile")
    public String profilePage(Model model) {
        User existingUser = getCurrentUser();
        getUserCoursesAndRooms(model);
        String base64 =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(existingUser.getPhotoBinary());
        model.addAttribute("currentPhoto", base64);
        return "profilePage";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createUser(@NonNull User user, Model model){
        try {
            ClassLoader classLoader = getClass().getClassLoader();
            File file = new File(classLoader.getResource("static/images/defaultProfile.jpg").getFile());
            byte[] photoBinary = Files.readAllBytes(Paths.get(file.toURI()));

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            user.setPassword(encoder.encode(user.getPassword()));
            user.setAdmin(adminRepository.getOne(1));
            user.setPhotoBinary(photoBinary);
            user.setPhoneNumber(0);
            User savedUser = userRepository.save(user);

            setAuthUser(savedUser);
        }catch (Exception e){
            model.addAttribute("emailInUse", true);
            model.addAttribute("previousUser", user);
            return "signUpPage";
        }
        return "homePage";
    }
    @RequestMapping("/edit")
    public String editProfile(User user, MultipartFile photo, Model model){
        try {

            User existingUser = getCurrentUser();

            existingUser.setFirstName(user.getFirstName());
            existingUser.setLastName(user.getLastName());
            existingUser.setEmail(user.getEmail());
            existingUser.setDescription(user.getDescription());
            existingUser.setPhoneNumber(user.getPhoneNumber());
            existingUser.setNickName(user.getNickName());
            existingUser.setPhotoBinary(photo.getBytes());
            User savedUser = userRepository.save(existingUser);

            setAuthUser(savedUser);

            String base64 =
                    "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(savedUser.getPhotoBinary());
            model.addAttribute("currentPhoto", base64);
        }catch (Exception e) {
        }
        return "profilePage";
    }

    public void getUserCoursesAndRooms(Model model) {
        User user = getCurrentUser();
        List<Course> courses = user.getAttends();
        List<Course> createdCourses = user. getCreatedCourses();
        for(int i=0; i< createdCourses.size(); i++){
            courses.add(createdCourses.get(i));
        }

        List<Room> rooms = user.getRooms();
        model.addAttribute("courses", courses);
        model.addAttribute("rooms", rooms);
    }

    public User getCurrentUser(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CurrentUser currentUser = (CurrentUser)authentication.getPrincipal();
        return userRepository.getByIduser(currentUser.getId());
    }

    public void setAuthUser(User user){
        UserDetails userDetails = new CurrentUser(user.getEmail(), user.getPassword(),
                user.getFirstName(), user.getLastName(), user.getNickName(),
                user.getDescription(), user.getPhoneNumber(), user.getIduser());
        Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
    }
}
