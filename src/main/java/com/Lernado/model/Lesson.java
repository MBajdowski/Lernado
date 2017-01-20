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
    private String title;
    private Integer number;
    @ManyToOne
    @JoinColumn(name = "CourseId", referencedColumnName = "idcourse", nullable = false)
    private Course course;
    @ManyToMany
    @JoinTable(name = "lesson_has_material", joinColumns =
    @JoinColumn(name = "lesson_idlesson", referencedColumnName = "idlesson", nullable = false), inverseJoinColumns =
    @JoinColumn(name = "material_idmaterial", referencedColumnName = "idmaterial", nullable = false))
    private List<Material> materials;
}
