package com.Lernado.model;

import lombok.*;

import javax.persistence.*;
import java.util.Arrays;
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
    private String title;
    private String duration;
    private String syllabus;
    private Double price;
    private String description;
    private String category;
    private String level;
    private Byte validated;
    private Byte highlighted;
    @Column(length = 10_000_000)
    private byte[] photoBinary;
    private Byte isPrivate;
    @ManyToOne
    @JoinColumn(name = "CreatorId", referencedColumnName = "iduser", nullable = false)
    private User creator;
    @ManyToOne
    @JoinColumn(name = "AdminId", referencedColumnName = "idadmin", nullable = false)
    private Admin admin;
    @OneToMany(mappedBy = "course")
    private List<Lesson> lessons;
    @ManyToMany(mappedBy = "attends")
    private List<User> isAttendedBy;
    @ManyToMany(mappedBy = "wishes")
    private List<User> isWishedBy;

}
