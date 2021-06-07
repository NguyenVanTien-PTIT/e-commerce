package com.migi.migi_project.model.mapper;

import com.migi.migi_project.entity.OrderProduct;
import com.migi.migi_project.model.dto.OrderProductDTO;

public class OrderProductMapper {
    public static OrderProductDTO toOrderProductDTO(OrderProduct orderProduct){
        OrderProductDTO orderProductDTO = new OrderProductDTO();
        orderProductDTO.setId(orderProduct.getId());
        orderProductDTO.setQuantity(orderProduct.getQuantity());
        orderProductDTO.setPrice(orderProduct.getPrice());
        return orderProductDTO;
    }

    public static OrderProduct toOrderProduct(OrderProductDTO orderProductDTO){
        OrderProduct orderProduct = new OrderProduct();
        orderProduct.setId(orderProductDTO.getId());
        orderProduct.setQuantity(orderProductDTO.getQuantity());
        orderProduct.setPrice(orderProductDTO.getPrice());
        return orderProduct;
    }
}
