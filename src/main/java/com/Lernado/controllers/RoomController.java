package com.Lernado.controllers;

import com.Lernado.beans.RoomCourseBean;
import com.Lernado.managers.RoomRepository;
import com.Lernado.model.Room;
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

    @RequestMapping("/")
    public String roomsPage() {return "roomsPage";}

    @RequestMapping("/create")
    public String createRoom(RoomCourseBean rcBean){
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
