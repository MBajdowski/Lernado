package com.Lernado.initializers;


import com.Lernado.managers.AdminRepository;
import com.Lernado.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.stream.Stream;

@Service
public class AdminInitializer {

    @Autowired
    public AdminInitializer(AdminRepository adminRepository) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        Stream.of(Admin.builder().email("admin@lernado.pl")
                        .firstName("Admin")
                        .password(encoder.encode("admin"))
                        .build()
        ).forEach(user -> adminRepository.save(user));
    }
}
