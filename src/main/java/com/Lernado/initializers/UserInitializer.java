package com.Lernado.initializers;

import com.Lernado.managers.UserRepository;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.stream.Stream;

@Service
public class UserInitializer {


    @Autowired
    public UserInitializer(UserRepository userRepository) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        Stream.of(User.builder().email("mbaj@lernado.pl")
                        .name("Maciej")
                        .password(encoder.encode("mbaj"))
                        .build(),
                User.builder().email("jste@lernado.pl")
                        .name("Joanna")
                        .password(encoder.encode("jste"))
                        .build()
        ).forEach(user -> userRepository.save(user));
    }
}
