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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;

@Service
@DependsOn({"userInitializer"})
public class CourseInitializer {

    @Autowired
    public CourseInitializer(CourseRepository courseRepository, UserRepository userRepository, AdminRepository adminRepository) throws IOException{

        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("static/images/courseDefault.jpg").getFile());
        byte[] photoBinary = Files.readAllBytes(Paths.get(file.toURI()));

        Stream.of(Course.builder().title("Title1")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description1")
                        .category("Programming")
                        .level("Medium")
                        .photoBinary(photoBinary)
                        .price(100.0)
                        .build(),
                Course.builder().title("Title2")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description2")
                        .category("Telecommunication")
                        .level("Hard")
                        .photoBinary(photoBinary)
                        .price(90.0)
                        .build(),
                Course.builder().title("Title3")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description3")
                        .category("Data Bases")
                        .level("Easy")
                        .photoBinary(photoBinary)
                        .price(80.0)
                        .build(),
                Course.builder().title("Title4")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description4")
                        .category("Computer Networks")
                        .level("Medium")
                        .photoBinary(photoBinary)
                        .price(110.0)
                        .highlighted(true)
                        .build(),
                Course.builder().title("Title5")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description5")
                        .category("Design")
                        .level("Easy")
                        .photoBinary(photoBinary)
                        .price(120.0)
                        .highlighted(true)
                        .build(),
                Course.builder().title("Title6")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Description6")
                        .category("Design")
                        .level("Medium")
                        .photoBinary(photoBinary)
                        .price(120.0)
                        .highlighted(true)
                        .build(),
                Course.builder().title("Asia's Course")
                        .creator(userRepository.getByIduser(2))
                        .admin(adminRepository.getOne(1))
                        .description("Description of Asia's Course")
                        .category("Telecommunication")
                        .level("Hard")
                        .photoBinary(photoBinary)
                        .price(99.99)
                        .highlighted(false)
                        .build()
        ).forEach(course -> courseRepository.save(course));
    }
}
