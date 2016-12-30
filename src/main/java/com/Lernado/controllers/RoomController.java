package com.Lernado.controllers;

import com.Lernado.beans.RoomCourseBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {

    @RequestMapping("/")
    public String roomsPage() {return "roomsPage";}

    @RequestMapping("/create")
    public String createRoom(RoomCourseBean rcBean){
        return "roomsPage";
    }
}
