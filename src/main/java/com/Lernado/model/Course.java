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
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idcourse;
    @NonNull
    private String title;
    private String duration;
    private String syllabus;
    private Double price;
    private String description;
    private String category;
    private String level;
    private Boolean validated;
    private Boolean highlighted;
    private byte[] photoBinary;
    private Boolean isPrivate;
    @ManyToOne
    @JoinColumn(name = "user_iduser", referencedColumnName = "iduser")
    private User userByUserIduser;
    @ManyToMany(mappedBy = "attendedCourses")
    private List<User> attendedUsers;
    @ManyToMany(mappedBy = "wishedCourses")
    private List<User> wishedUsers;
    @OneToMany(mappedBy = "courseByCourseIdcourse")
    private List<Lesson> lessons;

}
