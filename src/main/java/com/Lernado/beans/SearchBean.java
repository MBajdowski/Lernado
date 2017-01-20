package com.Lernado.beans;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SearchBean {

    private String phrase;
    private String category;
    private String level;
    private boolean roomChecked;

}
