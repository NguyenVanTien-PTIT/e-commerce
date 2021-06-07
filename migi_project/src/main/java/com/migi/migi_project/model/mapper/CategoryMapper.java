package com.migi.migi_project.model.mapper;

import com.migi.migi_project.entity.Category;
import com.migi.migi_project.model.dto.CategoryDTO;

public class CategoryMapper {
    public static CategoryDTO toCategoryDTO(Category category){
        return new CategoryDTO(category.getId(), category.getName());
    }
}
