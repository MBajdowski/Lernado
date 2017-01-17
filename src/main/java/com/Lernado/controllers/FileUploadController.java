package com.Lernado.controllers;

import com.Lernado.beans.MaterialBean;
import com.Lernado.storage.StorageFileNotFoundException;
import com.Lernado.storage.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class FileUploadController {

    private final StorageService storageService;

    @Autowired
    private CourseController courseController;

    @Autowired
    private RoomController roomController;

    @Autowired
    public FileUploadController(StorageService storageService) {
        this.storageService = storageService;
    }

    @GetMapping("/listUploadedFiles")
    public String listUploadedFiles(Model model) throws IOException {

        model.addAttribute("files", storageService
                .loadAll()
                .map(path ->
                        MvcUriComponentsBuilder
                                .fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
                                .build().toString())
                .collect(Collectors.toList()));

        return "uploadForm";
    }

    public String getFile(String filename) throws IOException {
//        return storageService.loadOne(filename).map(path ->
//                MvcUriComponentsBuilder
//                        .fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
//                        .build().toString())
//                .collect(Collectors.toList()).get(0).toString();


        List<Object> files = storageService
                .loadAll()
                .map(path ->
                        MvcUriComponentsBuilder
                                .fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
                                .build().toString())
                .collect(Collectors.toList());
        for(Object object : files){
            if(object.toString().contains(filename)){
                return object.toString();
            }
        }
        return "localhost:8080";
    }

    @GetMapping("/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity
                .ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+file.getFilename()+"\"")
                .body(file);
    }

    @RequestMapping("{type}/upload")
    public String handleFileUpload(@PathVariable("type") String type,MaterialBean mBean, MultipartFile file,
                                   Model model, HttpServletResponse res) throws IOException {
        storageService.store(file);
        if(type.equals("courses")) {
            return courseController.addMaterial(mBean.getIdlesson(), mBean, file.getContentType(), model, res, getFile(file.getOriginalFilename()));
        } else {
            return roomController.addMaterial(mBean, file.getContentType(), model, getFile(file.getOriginalFilename()), mBean.getIdlesson());
        }
    }

    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity handleStorageFileNotFound(StorageFileNotFoundException exc) {
        return ResponseEntity.notFound().build();
    }

}