package com.Lernado.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {

    @RequestMapping("/")
    public String roomsPage() {return "roomsPage";}
}
