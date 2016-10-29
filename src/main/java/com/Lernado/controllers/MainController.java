package com.Lernado.controllers;

import com.Lernado.managers.OfferRepository;
import com.Lernado.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
public class MainController {

    @Autowired
    private OfferRepository offerRepository;

    @RequestMapping("/")
    public String index(Model model){
        List<Offer> list = offerRepository.findAll();

        model.addAttribute("offerList", list);
        return "simple";
    }
}