package com.migi.migi_project.service.admin;

import com.migi.migi_project.model.dto.CategoryDTO;
import com.migi.migi_project.model.dto.ProductDTO;
import com.migi.migi_project.model.response.PageableModel;
import com.migi.migi_project.model.response.ResponseNormal;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ManagerProductService {
    List<ProductDTO> findAll(Pageable pageable);
    PageableModel<ProductDTO> findByCategory(Integer id, Pageable pageable);
    List<CategoryDTO> findAllCategory(Pageable pageable);
    Long countProducts();
    Long countCategories();
    ResponseNormal addProduct(ProductDTO productDTO) ;
    ResponseNormal updateProduct(ProductDTO productDTO) ;
    ResponseNormal deleteProduct(Integer id) ;
    ResponseNormal addCategory(CategoryDTO categoryDTO) ;
    ResponseNormal updateCategory(CategoryDTO categoryDTO) ;
    ResponseNormal deleteCategory(Integer id) ;
}
