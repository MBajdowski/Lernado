package com.Lernado.controllers;

import com.Lernado.beans.RoomCourseBean;
import com.Lernado.managers.AdminRepository;
import com.Lernado.model.Course;
import com.Lernado.model.User;
import com.Lernado.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


@Controller
public class MainController {

    @Autowired
    private CourseController courseController;
    @Autowired
    private RoomController roomController;
    @Autowired
    private UserController userController;
    @Autowired
    private AdminRepository adminRepository;

    @RequestMapping("/")
    public String index() {return "loginPage"; }

    @RequestMapping("/createPage")
    public String create() {return "createPage";}

    @RequestMapping("/coursePage")
    public String coursePage() {
        return "coursePage";
    }

    @RequestMapping("/home")
    public String home(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CurrentUser currentUser = (CurrentUser)authentication.getPrincipal();
        if(currentUser.getEmail().equals(adminRepository.getOne(1).getEmail())){
         return courseController.showAdminPage(model);
        }
        List<Course> popularCourses = courseController.getPopularCourses(currentUser.getId());

        List<AbstractMap.SimpleEntry> popular = new ArrayList<>();
        for(Course course : popularCourses){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(course.getPhotoBinary());
            popular.add(new AbstractMap.SimpleEntry(course, base64));
        }
        model.addAttribute("popular" , popular);
        return "homePage";}

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loggingPage(@RequestParam("error") String error, Model model){

        if(error.compareTo("")==0){
            model.addAttribute("wrongCredentials", true);
        }
        return "loginPage";
    }

    @RequestMapping("/signUp")
    public String signUp(Model model) {
        model.addAttribute("previousUser", new User());
        return "signUpPage";
    }

    @RequestMapping("/createCourseRoom")
    public String redirectCourseRoom(RoomCourseBean rcBean, MultipartFile photo, Model model) throws IOException {
        if (photo!=null && photo.getSize()!=0)
            rcBean.setPhotoBinary(photo.getBytes());

        if (rcBean.getType()==null || rcBean.getType().equals("room"))
            return roomController.createRoom(rcBean, model);
        return courseController.createCourse(rcBean, model);
    }
}
