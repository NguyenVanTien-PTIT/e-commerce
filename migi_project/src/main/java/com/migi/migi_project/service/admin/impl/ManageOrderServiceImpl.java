package com.migi.migi_project.service.admin.impl;

import com.migi.migi_project.entity.Orders;
import com.migi.migi_project.model.dto.OrdersDTO;
import com.migi.migi_project.model.mapper.OrdersMapper;
import com.migi.migi_project.model.response.ResponseNormal;
import com.migi.migi_project.repository.user.OrderRepository;
import com.migi.migi_project.service.admin.ManageOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ManageOrderServiceImpl implements ManageOrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<OrdersDTO> findOrderByStatus(Integer status, Pageable pageable) {
        List<Orders> ordersList = orderRepository.findByStatus(status, pageable);
        List<OrdersDTO> ordersDTOS = new ArrayList<>();
        for(Orders o : ordersList){
            ordersDTOS.add(OrdersMapper.toOrdersDTO(o));
        }
        return ordersDTOS;
    }

    @Override
    public Long countOdersByStatus(Integer status) {
        return orderRepository.countOrdersByStatus(status);
    }

    @Override
    public ResponseNormal confirmOrder(Integer id) {
        Orders order = orderRepository.findById(id).get();
        //Duyệt đơn hàng
        if(order.getStatus() == 1){
            order.setStatus(2);
            orderRepository.save(order);
            return new ResponseNormal("Đã chuyển sang trạng thái giao hàng!", HttpStatus.OK);
        }else if(order.getStatus() == 2){
            order.setStatus(3);
            orderRepository.save(order);
            return new ResponseNormal("Đơn hàng chuyển sang trạng thái đã giao hàng!", HttpStatus.OK);
        }
        else{
            return new ResponseNormal("Đơn hàng đang trong trạng thái đặt hàng, không được duyệt!", HttpStatus.BAD_REQUEST);
        }
    }
}
