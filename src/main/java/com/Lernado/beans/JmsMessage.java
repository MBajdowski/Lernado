package com.Lernado.beans;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class JmsMessage {

    private String author;
    private int iduser;
    private String message;
}
