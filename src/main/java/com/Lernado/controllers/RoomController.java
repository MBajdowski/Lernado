package com.Lernado.controllers;

import com.Lernado.beans.MaterialBean;
import com.Lernado.beans.RoomCourseBean;
import com.Lernado.beans.StatisticBean;
import com.Lernado.managers.*;
import com.Lernado.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
    @Autowired
    private MaterialRepository materialRepository;
    @Autowired
    private CourseRepository courseRepository;


    @RequestMapping("/myRooms")
    public String roomsPage(Model model) {
        User user = userController.getCurrentUser();
        model.addAttribute("rooms", user.getRooms());
        return "myRoomsPage";
    }

    @RequestMapping("/create")
    public String createRoom(RoomCourseBean rcBean, Model model){
        User user = userRepository.getOne(rcBean.getCreatorId());

        Room room = Room.builder().admin(adminRepository.getOne(1))
                .title(rcBean.getTitle())
                .description(rcBean.getDescription())
                .photoBinary(rcBean.getPhotoBinary())
                .isPrivate(rcBean.getIsPrivate())
                .materials(new ArrayList<>())
                .build();

        user.getRooms().add(roomRepository.save(room));
        userController.setAuthUser(userRepository.save(user));

        return showRoomPage(room.getIdroom(), model);
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
        User currentUser = userController.getCurrentUser();
        model.addAttribute("userMaterials", currentUser.getMaterials());
        model.addAttribute("materials", materials);
        model.addAttribute("inRoom", false);
        if(currentUser.getRooms().contains(currentRoom)){
            model.addAttribute("inRoom", true);
            model.addAttribute("statistics", StatisticBean.builder()
                    .nrOfEnrolled(currentRoom.getUsers()==null?0:currentRoom.getUsers().size())
                    .nrOfMessages(currentRoom.getMaterials()==null?0:currentRoom.getMaterials().size())
                    .popularAmongEnrolled(courseRepository.getPopularCategoryInRoom(currentRoom.getIdroom()))
                    .build());
        }


        return "roomsPage";
    }

    public List<AbstractMap.SimpleEntry> searchRooms(String phrase) {
        List<AbstractMap.SimpleEntry> roomsMap = new ArrayList<>();
        List<Room> rooms;
        if(StringUtils.isEmpty(phrase)){
            rooms = roomRepository.findByIsPrivateFalse();
        } else {
            rooms = roomRepository.findByTitleContainingAndIsPrivateFalse(phrase);
        }
        for(Room room : rooms){
            String base64 = "data:image/jpg;base64,"+ Base64.getEncoder().encodeToString(room.getPhotoBinary());
            roomsMap.add(new AbstractMap.SimpleEntry(room, base64));
        }
        return roomsMap;
    }

    @RequestMapping("/addMaterial")
    public String addMaterial(MaterialBean mBean, String type, Model model, String path, String title, int roomId) throws IOException {
        User currentUser = userController.getCurrentUser();

        Material newMaterial = Material.builder().title(title)
                .description(mBean.getDescription())
                .path(path)
                .type(type)
                .creator(currentUser)
                .build();
        newMaterial = materialRepository.save(newMaterial);

        Room currentRoom = roomRepository.getOne(roomId);
        currentRoom.getMaterials().add(newMaterial);

        roomRepository.save(currentRoom);
        currentUser.getMaterials().add(newMaterial);
        userController.setAuthUser(userRepository.save(currentUser));

        return showRoomPage(roomId, model);
    }

    @RequestMapping("{idroom}/{idmaterial}/addExistingMaterial")
    public String addExistingMaterial(@PathVariable("idroom") int roomId,@PathVariable("idmaterial") int materialId,
                                      Model model, HttpServletResponse res) throws IOException{
        User currentUser = userController.getCurrentUser();
        Room currentRoom = roomRepository.getOne(roomId);

        Material oldMaterial = materialRepository.getOne(materialId);
        Material newMaterial = Material.builder().title(oldMaterial.getTitle())
                .description(null)
                .path(oldMaterial.getPath())
                .type(oldMaterial.getType())
                .creator(currentUser)
                .build();
        newMaterial = materialRepository.save(newMaterial);

        currentRoom.getMaterials().add(newMaterial);
        roomRepository.save(currentRoom);

        List<Material> userMaterials = currentUser.getMaterials();
        model.addAttribute("userMaterials", userMaterials);
        return showRoomPage(currentRoom.getIdroom(), model);
    }

    @RequestMapping("joinRoom")
    public String addUserToRoom(@RequestParam int idRoom, Model model){
        User currentUser = userController.getCurrentUser();
        currentUser.getRooms().add(roomRepository.getOne(idRoom));
        currentUser = userRepository.save(currentUser);
        userController.setAuthUser(currentUser);
        return showRoomPage(idRoom, model);
    }

    @RequestMapping("leaveRoom")
    public String removerUserFromRoom(@RequestParam int idRoom, Model model){
        User currentUser = userController.getCurrentUser();
        currentUser.getRooms().remove(roomRepository.getOne(idRoom));
        currentUser = userRepository.save(currentUser);
        userController.setAuthUser(currentUser);
        return showRoomPage(idRoom, model);
    }

    @RequestMapping("{idroom}/updateDetails")
    public String updatedDetails(@PathVariable int idroom, String title, String description, Model model){
        Room currentRoom = roomRepository.getOne(idroom);
        currentRoom.setTitle(title);
        currentRoom.setDescription(description);
        roomRepository.save(currentRoom);
        return showRoomPage(idroom, model);
    }

    @RequestMapping("{idroom}/updatePhoto")
    public String updatedDetails(@PathVariable int idroom, MultipartFile photoBinary, Model model) throws IOException {
        Room currentRoom = roomRepository.getOne(idroom);
        currentRoom.setPhotoBinary(photoBinary.getBytes());
        roomRepository.save(currentRoom);
        return showRoomPage(idroom, model);
    }

    @RequestMapping("{idroom}/{idmaterial}/removeMaterial")
    public String removeMaterial(@PathVariable("idroom") int roomId,@PathVariable("idmaterial") int materialId, Model model){
        Room currentRoom = roomRepository.getOne(roomId);
        Material material = materialRepository.getOne(materialId);
        User currentUser = userController.getCurrentUser();
        currentRoom.getMaterials().remove(material);
        roomRepository.save(currentRoom);

        model.addAttribute("userMaterials", currentUser.getMaterials());
        return showRoomPage(roomId, model);
    }
}
