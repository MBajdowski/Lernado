package com.Lernado.initializers;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Admin;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;

@Service
@DependsOn({"adminInitializer"})
public class UserInitializer {


    @Autowired
    public UserInitializer(UserRepository userRepository, AdminRepository adminRepository) throws IOException {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("static/images/defaultProfile.jpg").getFile());
        byte[] photoBinary = Files.readAllBytes(Paths.get(file.toURI()));

        Stream.of(User.builder().email("mbaj@lernado.pl")
                        .firstName("Maciej")
                        .lastName("Bajdowski")
                        .description("I am super teacher, but I am learning all the time!")
                        .phoneNumber(123123123)
                        .password(encoder.encode("mbaj"))
                        .admin(adminRepository.getOne(1))
                        .photoBinary(photoBinary)
                        .build(),
                User.builder().email("jste@lernado.pl")
                        .firstName("Joanna")
                        .lastName("Stępińśka")
                        .description("I am super student and I am learning all the time!")
                        .phoneNumber(456456456)
                        .password(encoder.encode("jste"))
                        .admin(adminRepository.getOne(1))
                        .nickName("jste")
                        .photoBinary(photoBinary)
                        .build()
        ).forEach(user -> userRepository.save(user));
    }
}
