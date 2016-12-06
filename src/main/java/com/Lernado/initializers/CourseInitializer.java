package com.Lernado.initializers;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.CourseRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

@Service
@DependsOn({"userInitializer"})
public class CourseInitializer {

    @Autowired
    public CourseInitializer(CourseRepository courseRepository, UserRepository userRepository, AdminRepository adminRepository) throws IOException, URISyntaxException {

        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("static/images/defaultProfile.jpg").getFile());

        Stream.of(Course.builder().title("Title1")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description1")
                        .category("Programming")
                        .level("Medium")
                        .price(100.0)
                        .build(),
                Course.builder().title("Title2")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description2")
                        .photoBinary(Files.readAllBytes(Paths.get(file.toURI())))
                        .price(100.0)
                        .build(),
                Course.builder().title("Title3")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description3")
                        .price(100.0)
                        .build(),
                Course.builder().title("Title4")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description4")
                        .price(100.0)
                        .build(),
                Course.builder().title("Title5")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description5")
                        .price(100.0)
                        .build()
        ).forEach(course -> courseRepository.save(course));
    }
}
