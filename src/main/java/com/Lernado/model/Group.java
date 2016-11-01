package com.Lernado.model;

import lombok.*;

import javax.persistence.*;
import java.util.Arrays;

@Entity
@Getter
@Setter
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idgroup;
    @NonNull
    private String title;
    private String description;
    @NonNull
    private Boolean isPrivate;
    private byte[] photoBinary;

}
