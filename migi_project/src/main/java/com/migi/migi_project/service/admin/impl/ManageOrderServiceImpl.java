package com.migi.migi_project.service.admin.impl;

import com.migi.migi_project.entity.OrderProduct;
import com.migi.migi_project.entity.Orders;
import com.migi.migi_project.entity.User;
import com.migi.migi_project.model.dto.OrderProductDTO;
import com.migi.migi_project.model.dto.OrdersDTO;
import com.migi.migi_project.model.dto.Revenue;
import com.migi.migi_project.model.mapper.OrderProductMapper;
import com.migi.migi_project.model.mapper.OrdersMapper;
import com.migi.migi_project.model.response.OrderPage;
import com.migi.migi_project.model.response.ResponseNormal;
import com.migi.migi_project.repository.user.OrderProductRepository;
import com.migi.migi_project.repository.user.OrderRepository;
import com.migi.migi_project.repository.user.UserRepository;
import com.migi.migi_project.service.admin.ManageOrderService;
import com.migi.migi_project.utils.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ManageOrderServiceImpl implements ManageOrderService {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderProductRepository orderProductRepository;
    @Autowired
    private UserRepository userRepository;

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
        //Duy???t ????n h??ng
        if(order.getStatus() == 1){
            order.setStatus(2);
            orderRepository.save(order);
            return new ResponseNormal("???? chuy???n sang tr???ng th??i giao h??ng!", HttpStatus.OK);
        }else if(order.getStatus() == 2){
            order.setStatus(3);
            orderRepository.save(order);
            return new ResponseNormal("????n h??ng chuy???n sang tr???ng th??i ???? giao h??ng!", HttpStatus.OK);
        }
        else{
            return new ResponseNormal("????n h??ng ??ang trong tr???ng th??i ?????t h??ng, kh??ng ???????c duy???t!", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public ResponseNormal updateOrder(OrdersDTO ordersDTO) {
        if(ordersDTO.getStatus() == 0 ){
            List<Orders> ordersList = orderRepository.findOrdersByStatusAndIdUser(0, ordersDTO.getIdUser());
            if(ordersList.size() == 0 ){
                Orders orders = OrdersMapper.toOrders(ordersDTO);
                User user = userRepository.findById(ordersDTO.getIdUser()).get();
                orders.setUserByIdUser(user);
                orderRepository.save(orders);
                return new ResponseNormal("C???p nh???t th??nh c??ng!", HttpStatus.OK);
            } else {
                return new ResponseNormal("Ng?????i d??ng " + ordersDTO.getNameUser() + " ??ang ?????t h??ng, kh??ng th??? c???p nh???t",
                        HttpStatus.BAD_REQUEST);
            }
        } else {
            Orders orders = OrdersMapper.toOrders(ordersDTO);
            User user = userRepository.findById(ordersDTO.getIdUser()).get();
            orders.setUserByIdUser(user);
            orderRepository.save(orders);
            return new ResponseNormal("C???p nh???t th??nh c??ng!", HttpStatus.OK);
        }
    }

    @Override
    public ResponseNormal deleteOrder(Integer id) {
        List<OrderProduct> orderProducts = orderProductRepository.findByIdOrder(id);
        if(orderProducts.size() > 0){
            for(OrderProduct o : orderProducts){
                orderProductRepository.delete(o);
            }
        }
        orderRepository.deleteById(id);
        return new ResponseNormal("X??a th??nh c??ng!", HttpStatus.OK);
    }

    @Override
    public List<Revenue> getRevenue(String year) {
        String sub = year.substring(2, 4);
        List<Object[]> objects = orderRepository.getRevenue(sub);
        List<Revenue> revenues = new ArrayList<>();
        for(Object[] o: objects){
            Revenue revenue = new Revenue();
            revenue.setName("Th??ng "+ DataUtils.safeToString(o[0]));
            revenue.setValue(DataUtils.safeToDouble(o[1]));
            revenues.add(revenue);
        }
        return revenues;
    }

    @Override
    public List<OrderProductDTO> getOrderProductByIdOrder(Integer idOrder) {
        return orderProductRepository.findByIdOrder(idOrder)
                .stream()
                .map(item -> OrderProductMapper.toOrderProductDTO(item))
                .collect(Collectors.toList());
    }

}
