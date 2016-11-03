package com.Lernado.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Material {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idmaterial;
    @NonNull
    private String title;
    private String type;
    private String description;
    private String path;
    @ManyToOne
    @JoinColumn(name = "room_idroom", referencedColumnName = "idroom")
    private Room roomByRoomIdroom;
    @ManyToOne
    @JoinColumn(name = "lesson_idlesson", referencedColumnName = "idlesson")
    private Lesson lessonByLessonIdlesson;

}
