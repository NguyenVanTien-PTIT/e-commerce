package com.migi.migi_project.model.dto;

import com.migi.migi_project.entity.Category;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private int id;
    private int categoryId;
    private String name;
    private String description;
    private Double price;
    private String image;
    private Timestamp createDate;
}
