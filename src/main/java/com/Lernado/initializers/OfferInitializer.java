package com.Lernado.initializers;


import com.Lernado.managers.OfferRepository;
import com.Lernado.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.stream.Stream;

@Service
public class OfferInitializer {

    @Autowired
    public OfferInitializer(OfferRepository offerRepository) {
        Stream.of(Offer.builder().email("test@test.test")
                        .name("TestName")
                        .text("Simple Offer Text")
                        .build(),
                Offer.builder().email("maciej@bajdowski.pl")
                        .name("Maciej")
                        .text("Sprzedam brata - Tanio!!!")
                        .build()
        ).forEach(offer -> offerRepository.save(offer));
    }
}
