package com.Lernado.controllers;

import com.Lernado.beans.RoomCourseBean;
import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.RoomRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Course;
import com.Lernado.model.Room;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Base64;

@Controller
@RequestMapping("/room")
public class RoomController {

    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private UserController userController;


    @RequestMapping("/")
    public String roomsPage() {return "roomsPage";}

    @RequestMapping("/create")
    public String createRoom(RoomCourseBean rcBean){
        User user = userRepository.getOne(rcBean.getCreatorId());

        Room room = Room.builder().admin(adminRepository.getOne(1))
                .title(rcBean.getTitle())
                .description(rcBean.getDescription())
                .photoBinary(rcBean.getPhotoBinary())
                .build();

        user.getRooms().add(roomRepository.save(room));
        userController.setAuthUser(userRepository.save(user));

        return "roomsPage";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    private String showCoursePage(@PathVariable("id") int roomId, Model model){

        Room currentRoom = roomRepository.getOne(roomId);
        String base64 =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentRoom.getPhotoBinary());
        model.addAttribute("currentCourse", currentRoom);

        return "roomsPage";
    }
}
