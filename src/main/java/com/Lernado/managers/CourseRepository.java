package com.Lernado.managers;

import com.Lernado.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Integer> {
    List<Course> findByTitleContaining(String title);

    List<Course> findByCategoryLikeAndLevelLikeAndTitleLike(String category, String level, String title);

    List<Course> findByHighlighted(boolean highlighted);

    @Query("SELECT a FROM Course a " +
            "WHERE a.idcourse IN (SELECT at.course_idcourse FROM user_attends_course at" +
            "WHERE at.user_iduser != :userId" +
            "GROUP BY at.course_idcourse"+
            "ORDER BY COUNT(DISTINCT at.user_iduser)) LIMIT 12")
    List<Course> findPopularCourses(@Param("userId")int userId);

    @Query("SELECT a FROM Course a " +
            "WHERE a.idcourse IN (SELECT at.course_idcourse FROM user_attends_course at" +
            "join Course c on at.course_idcourse = c.idcourse" +
            "WHERE at.user_iduser != :userId" +
            "and c.category = :category" +
            "GROUP BY at.course_idcourse"+
            "ORDER BY COUNT(DISTINCT at.user_iduser)) LIMIT 12")
    List<Course> findSugestedCourses(@Param("userId")int userId, @Param("category")int category);

    @Query("SELECT c.category FROM user_attends_course at" +
            "join Course c on at.course_idcourse = c.idcourse" +
            "WHERE at.user_iduser = :userId" +
            "GROUP BY c.category"+
            "ORDER BY COUNT(DISTINCT at.user_iduser) LIMIT 1")
    String findMostFrequentCategory(@Param("userId") int userId);
}
