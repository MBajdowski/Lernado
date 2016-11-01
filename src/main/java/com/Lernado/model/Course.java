package com.Lernado.model;

import lombok.*;

import javax.persistence.*;
import java.util.Collection;

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
    private Byte validated;
    private Byte highlighted;
    private byte[] photoBinary;
    private Byte isPrivate;

}
