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
public class Material {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idmaterial;
    private String title;
    private String type;
    private String description;
    private String path;
    @ManyToOne
    @JoinColumn(name = "CreatorId", referencedColumnName = "iduser", nullable = false)
    private User creator;
    @ManyToMany(mappedBy = "materials")
    private List<Room> rooms;
    @ManyToMany(mappedBy = "materials")
    private List<Lesson> lessons;

}
