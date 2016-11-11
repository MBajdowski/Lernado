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
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int iduser;
    @NonNull
    @Column(unique=true)
    private String email;
    @NonNull
    private String password;
    @NonNull
    private String name;
    private String surname;
    private String nickName;
    private String interest;
    private String description;
    private Integer phoneNumber;
    private byte[] photoBinary;
    @OneToMany(mappedBy = "userByUserIduser")
    private List<Course> coursesByIduser;
    @ManyToMany
    @JoinTable(name = "user_attends_course",joinColumns =
    @JoinColumn(name = "user_iduser", referencedColumnName = "iduser"), inverseJoinColumns =
    @JoinColumn(name = "course_idcourse", referencedColumnName = "idcourse"))
    private List<Course> attendedCourses;
    @ManyToMany
    @JoinTable(name = "user_wishlist_course",joinColumns =
    @JoinColumn(name = "user_iduser", referencedColumnName = "iduser"), inverseJoinColumns =
    @JoinColumn(name = "course_idcourse", referencedColumnName = "idcourse"))
    private List<Course> wishedCourses;
    @ManyToMany
    @JoinTable(name = "user_has_room",joinColumns =
    @JoinColumn(name = "user_iduser", referencedColumnName = "iduser"),inverseJoinColumns =
    @JoinColumn(name = "room_idroom", referencedColumnName = "idroom"))
    private List<Room> joinedRooms;

}
