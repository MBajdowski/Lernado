package com.Lernado.beans;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Getter
@Setter
@AllArgsConstructor
public class RoomCourseBean {

    private String title;
    private String description;
    private String type;
    private String category;
    private String level;
    private String syllabus;
    private double price;
    private int creatorId;
    private byte[] photoBinary;
    private String isPrivate;

    public RoomCourseBean() throws IOException {
        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("static/images/courseDefault.jpg").getFile());
        byte[] photoBinary = Files.readAllBytes(Paths.get(file.toURI()));

        this.photoBinary = photoBinary;
    }

    public boolean getIsPrivate(){
        return isPrivate.equals("true")? true: false;
    }

}
