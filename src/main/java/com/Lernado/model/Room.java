package com.Lernado.model;

import lombok.*;

import javax.persistence.*;
import java.util.Arrays;

/**
 * Created by Bajdos on 2016-11-01.
 */
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
    private Byte isPrivate;
    private byte[] photoBinary;


}
