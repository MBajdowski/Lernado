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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

@Service
@DependsOn({"userInitializer"})
public class CourseInitializer {

    @Autowired
    public CourseInitializer(CourseRepository courseRepository, UserRepository userRepository, AdminRepository adminRepository) throws IOException{

        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("static/images/courseDefault.jpg").getFile());
        byte[] photoBinary = Files.readAllBytes(Paths.get(file.toURI()));

        List<Course> courses = new ArrayList<>();
        for(int i=0;i<100;i++){
            courses.add(Course.builder().title("Course"+i)
                    .creator(userRepository.getByIduser(1))
                    .admin(adminRepository.getOne(1))
                    .description("Loop description"+i)
                    .category("Programming")
                    .level("Medium")
                    .validated(true)
                    .photoBinary(photoBinary)
                    .price((double)i)
                    .build());
        }
        Stream.of(courses).forEach(x -> courseRepository.save(x));
        Stream.of(Course.builder().title("The basics of C#")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("Here you will learn only the basics of C#")
                        .category("Programming")
                        .level("Easy")
                        .photoBinary(photoBinary)
                        .price(45.0)
                        .highlighted(true)
                        .validated(true)
                        .build(),
                Course.builder().title("Digital Signal Processing")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("How to design different filters")
                        .category("Telecommunication")
                        .level("Medium")
                        .photoBinary(photoBinary)
                        .price(78.0)
                        .highlighted(true)
                        .validated(true)
                        .build(),
                Course.builder().title("Advance database normalization")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .description("You will learn advance ways of DB normalization")
                        .category("Data Bases")
                        .level("Hard")
                        .photoBinary(photoBinary)
                        .price(120.0)
                        .highlighted(true)
                        .validated(true)
                        .build(),
                Course.builder().title("Breaking internet connection")
                        .creator(userRepository.getByIduser(2))
                        .admin(adminRepository.getOne(1))
                        .description("I will teach you, how, only by own presence, break internet connections")
                        .category("Telecommunication")
                        .level("Medium")
                        .photoBinary(photoBinary)
                        .price(120.0)
                        .highlighted(true)
                        .validated(true)
                        .build(),
                Course.builder().title("Decoupage")
                        .creator(userRepository.getByIduser(2))
                        .admin(adminRepository.getOne(1))
                        .description("How to make simple decoupage decoration")
                        .category("Design")
                        .level("Easy")
                        .photoBinary(photoBinary)
                        .price(3.99)
                        .highlighted(true)
                        .validated(true)
                        .build()
        ).forEach(course -> courseRepository.save(course));
    }
}
