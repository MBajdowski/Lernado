package com.Lernado.initializers;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Admin;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.stream.Stream;

@Service
@DependsOn({"adminInitializer"})
public class UserInitializer {


    @Autowired
    public UserInitializer(UserRepository userRepository, AdminRepository adminRepository) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        Stream.of(User.builder().email("mbaj@lernado.pl")
                        .firstName("Maciej")
                        .password(encoder.encode("mbaj"))
                        .admin(adminRepository.getOne(1))
                        .build(),
                User.builder().email("jste@lernado.pl")
                        .firstName("Joanna")
                        .password(encoder.encode("jste"))
                        .admin(adminRepository.getOne(1))
                        .build()
        ).forEach(user -> userRepository.save(user));
    }
}
