package com.Lernado.initializers;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.CourseRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

import java.util.stream.Stream;

@Service
@DependsOn({"userInitializer"})
public class CourseInitializer {

    @Autowired
    public CourseInitializer(CourseRepository courseRepository, UserRepository userRepository, AdminRepository adminRepository) {

        Stream.of(Course.builder().title("Title1")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .build(),
                Course.builder().title("Title2")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .build(),
                Course.builder().title("Title3")
                        .creator(userRepository.getByIduser(1))
                        .admin(adminRepository.getOne(1))
                        .build()
        ).forEach(course -> courseRepository.save(course));
    }
}
