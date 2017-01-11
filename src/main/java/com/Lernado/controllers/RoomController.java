package com.Lernado.controllers;

import com.Lernado.beans.RoomCourseBean;
import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.RoomRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Material;
import com.Lernado.model.Room;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

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


    @RequestMapping("/myRooms")
    public String roomsPage(Model model) {
        User user = userController.getCurrentUser();
        model.addAttribute("rooms", user.getRooms());
        return "myRoomsPage";
    }

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
    private String showRoomPage(@PathVariable("id") int roomId, Model model){
        List<AbstractMap.SimpleEntry> materials = new ArrayList<>();
        Room currentRoom = roomRepository.getOne(roomId);
        String currentRoomPhoto =
                "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(currentRoom.getPhotoBinary());
        model.addAttribute("currentRoomPhoto", currentRoomPhoto);
        model.addAttribute("currentRoom", currentRoom);
        List<Material> roomsMaterials = currentRoom.getMaterials();
        for(int i=0; i< roomsMaterials.size(); i++){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString((roomsMaterials.get(i).getCreator().getPhotoBinary()));
            materials.add(new AbstractMap.SimpleEntry(roomsMaterials.get(i), base64));
        }
        model.addAttribute("materials", materials);
        return "roomsPage";
    }

    public List<AbstractMap.SimpleEntry> searchRooms(String phrase) {
        List<AbstractMap.SimpleEntry> roomsMap = new ArrayList<>();
        List<Room> rooms;
        if(StringUtils.isEmpty(phrase)){
            rooms = roomRepository.findAll();
        } else {
            rooms = roomRepository.findByTitleContaining(phrase);
        }
        for(Room room : rooms){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(room.getPhotoBinary());
            roomsMap.add(new AbstractMap.SimpleEntry(room, base64));
        }
        return roomsMap;
    }
}
