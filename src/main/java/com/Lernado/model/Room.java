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
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idroom;
    @NonNull
    private String title;
    private String description;
    private Boolean isPrivate;
    private byte[] photoBinary;
    @OneToMany(mappedBy = "roomByRoomIdroom")
    private List<Material> materialsByIdroom;
    @ManyToMany(mappedBy = "joinedRooms")
    private List<User> joinedUsers;

}
