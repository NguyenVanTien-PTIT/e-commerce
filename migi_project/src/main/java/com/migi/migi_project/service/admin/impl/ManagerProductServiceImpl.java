package com.migi.migi_project.service.admin.impl;

import com.migi.migi_project.entity.Category;
import com.migi.migi_project.entity.Product;
import com.migi.migi_project.model.dto.CategoryDTO;
import com.migi.migi_project.model.dto.ProductDTO;
import com.migi.migi_project.model.mapper.CategoryMapper;
import com.migi.migi_project.model.mapper.ProductMapper;
import com.migi.migi_project.model.response.PageableModel;
import com.migi.migi_project.model.response.ResponseNormal;
import com.migi.migi_project.repository.user.CategoryRepository;
import com.migi.migi_project.repository.user.ProductRepository;
import com.migi.migi_project.service.admin.ManagerProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ManagerProductServiceImpl implements ManagerProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<ProductDTO> findAll(Pageable pageable) {
        List<Product> productList = productRepository.findAll(pageable).getContent();
        List<ProductDTO> productDTOList = new ArrayList<>();
        for(Product p : productList ){
            productDTOList.add(ProductMapper.toProductDTO(p));
        }
        return productDTOList;
    }

    @Override
    public PageableModel<ProductDTO> findByCategory(Integer id, Pageable pageable) {
        List<Product> productList = productRepository.findByCategory(id, pageable);
        List<ProductDTO> productDTOList = new ArrayList<>();
        for(Product p : productList ){
            productDTOList.add(ProductMapper.toProductDTO(p));
        }
        PageableModel<ProductDTO> response = new PageableModel<>();
        response.setList(productDTOList);
        response.setTotal(productRepository.countProductByCategory(id));
        return response;
    }

    @Override
    public List<CategoryDTO> findAllCategory(Pageable pageable) {
        List<Category> categories = categoryRepository.findAll(pageable).getContent();
        List<CategoryDTO> categoryDTOList = new ArrayList<>();
        for(Category category : categories ){
            categoryDTOList.add(CategoryMapper.toCategoryDTO(category));
        }
        return categoryDTOList;
    }

    @Override
    public Long countProducts() {
        return productRepository.count();
    }

    @Override
    public Long countCategories() {
        return categoryRepository.count();
    }

    @Override
    public ResponseNormal addProduct(ProductDTO productDTO) {
        Category category = categoryRepository.findById(productDTO.getCategoryId()).get();
        Product product = ProductMapper.toProduct(productDTO);
        product.setCategoryByIdCategory(category);
        product.setCreateDate(Timestamp.valueOf(LocalDateTime.now()));
        productRepository.save(product);
        ResponseNormal response = new ResponseNormal("Thêm mới thành công", HttpStatus.OK);
        return response;
    }

    @Override
    public ResponseNormal updateProduct(ProductDTO productDTO) {
        Category category = categoryRepository.findById(productDTO.getCategoryId()).get();
        Product product = ProductMapper.toProduct(productDTO);
        product.setCategoryByIdCategory(category);
        productRepository.save(product);
        ResponseNormal response = new ResponseNormal("Sửa thành công", HttpStatus.OK);
        return response;
    }

    @Override
    public ResponseNormal deleteProduct(Integer id) {
        productRepository.deleteById(id);
        return new ResponseNormal("Xóa thành công", HttpStatus.OK);
    }

    @Override
    public ResponseNormal addCategory(CategoryDTO categoryDTO) {
        //Check trùng tên
        List<Category> categoryList = categoryRepository.findAll();
        long result = categoryList.stream()
                                .filter(c -> categoryDTO.getName().trim().equalsIgnoreCase(c.getName()))
                                .count();
        if(result > 0){
            return new ResponseNormal("Tên danh mục đã tồn tại, không được thêm!", HttpStatus.BAD_REQUEST);
        }
        categoryRepository.save(CategoryMapper.toCategory(categoryDTO));
        return new ResponseNormal("Thêm mới thành công", HttpStatus.OK);
    }

    @Override
    public ResponseNormal updateCategory(CategoryDTO categoryDTO) {
        //Check trùng tên
        List<Category> categoryList = categoryRepository.findAll();
        long result = categoryList.stream()
                .filter(c -> categoryDTO.getName().trim().equalsIgnoreCase(c.getName()))
                .count();
        if(result > 0){
            return new ResponseNormal("Tên danh mục đã tồn tại, không được sửa!", HttpStatus.BAD_REQUEST);
        }
        categoryRepository.save(CategoryMapper.toCategory(categoryDTO));
        return new ResponseNormal("Sửa thành công", HttpStatus.OK);
    }

    @Override
    public ResponseNormal deleteCategory(Integer id) {
        List<Product> productList = productRepository.findProductByCategory(id);
        if(productList.size()>0){
            return new ResponseNormal("Còn sản phẩm thuộc danh mục này, không thể xóa!", HttpStatus.BAD_REQUEST);
        }
        categoryRepository.deleteById(id);
        return new ResponseNormal("Xóa thành công!", HttpStatus.OK);
    }
}
