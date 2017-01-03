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
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idroom;
    private String title;
    private String description;
    private boolean isPrivate;
    @Column(length = 1_000_000)
    private byte[] photoBinary;
    @ManyToOne
    @JoinColumn(name = "AdminId", referencedColumnName = "idadmin", nullable = false)
    private Admin admin;
    @ManyToMany(mappedBy = "rooms")
    private List<User> users;
    @ManyToMany
    @JoinTable(name = "room_has_material", joinColumns =
    @JoinColumn(name = "room_idroom", referencedColumnName = "idroom", nullable = false), inverseJoinColumns =
    @JoinColumn(name = "material_idmaterial", referencedColumnName = "idmaterial", nullable = false))
    private List<Material> materials;
}
