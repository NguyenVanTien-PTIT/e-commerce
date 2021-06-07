package com.migi.migi_project.model.mapper;

import com.migi.migi_project.entity.Product;
import com.migi.migi_project.model.dto.ProductDTO;

public class ProductMapper {
    public static ProductDTO toProductDTO(Product product){
        return new ProductDTO(product.getId(),
                product.getName(),product.getDescription(), product.getPrice(),
                product.getImage(), product.getCreateDate());
    }

    public static Product toProduct(ProductDTO productDTO){
        Product product = new Product();
        product.setId(productDTO.getId());
        product.setName(productDTO.getName());
        product.setDescription(productDTO.getDescription());
        product.setPrice(productDTO.getPrice());
        product.setImage(productDTO.getImage());
        product.setCreateDate(productDTO.getCreateDate());
        return product;
    }
}
