package com.Lernado.initializers;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
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

        List<User> users = new ArrayList<>();
        for(int i=0;i<20;i++){
            users.add(User.builder().email("email@lernado.pl"+i)
                    .firstName("firstName"+i)
                    .lastName("lastName"+i)
                    .admin(adminRepository.getOne(1))
                    .description("I am super teacher, but I am learning all the time!")
                    .phoneNumber(123123123)
                    .password(encoder.encode("password"+i))
                    .admin(adminRepository.getOne(1))
                    .photoBinary(photoBinary)
                    .build());
        }

        users.add(User.builder().email("mbaj@lernado.pl")
                .firstName("Maciej")
                .lastName("Bajdowski")
                .description("I am super teacher, but I am learning all the time!")
                .phoneNumber(123123123)
                .password(encoder.encode("mbaj"))
                .admin(adminRepository.getOne(1))
                .photoBinary(photoBinary)
                .build());
        users.add(User.builder().email("jste@lernado.pl")
                .firstName("Joanna")
                .lastName("Stępińsa")
                .description("I am super student and I am learning all the time!")
                .phoneNumber(456456456)
                .password(encoder.encode("jste"))
                .admin(adminRepository.getOne(1))
                .nickName("jste")
                .photoBinary(photoBinary)
                .build());

        Stream.of(users).forEach(user -> userRepository.save(user));
    }
}
