package com.Lernado.managers;

import com.Lernado.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Integer> {
    List<Course> findByTitleContaining(String title);

    List<Course> findByCategoryLikeAndLevelLikeAndTitleLike(String category, String level, String title);

    List<Course> findByHighlighted(boolean highlighted);
}
