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
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idstudent;
    @NonNull
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


}
