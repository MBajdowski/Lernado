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
    @NonNull
    private String type;
    private String description;
    @NonNull
    private String path;

}
