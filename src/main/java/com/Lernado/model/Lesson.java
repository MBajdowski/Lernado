package com.Lernado.model;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Lesson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idlesson;
    @NonNull
    private String title;
    private Integer number;
    @OneToMany(mappedBy = "lessonByLessonIdlesson")
    private List<Material> materialsByIdlesson;
    @ManyToOne
    @JoinColumn(name = "course_idcourse", referencedColumnName = "idcourse")
    private Course courseByCourseIdcourse;

}
