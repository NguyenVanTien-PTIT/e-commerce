package com.migi.migi_project.controller.admin;

import com.migi.migi_project.service.admin.ManageOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class ManageOrderController {
    @Autowired
    private ManageOrderService manageOrderService;

    @GetMapping(value = "/admin/order")
    public ResponseEntity<?> getOrderByStatus(@RequestParam(value = "status") Integer status,
                                              @RequestParam(value = "page") Integer page,
                                              @RequestParam(value = "limit") Integer limit){
        Pageable pageable = PageRequest.of(page-1, limit);
        return ResponseEntity.ok(manageOrderService.findOrderByStatus(status, pageable));
    }

    @GetMapping(value = "/admin/order-count")
    public ResponseEntity<?> countOrderByStatus(@RequestParam(value = "status") Integer status){
        return ResponseEntity.ok(manageOrderService.countOdersByStatus(status));
    }

    @PutMapping(value = "/admin/order-confirm/{id}")
    public ResponseEntity<?> confirmOrder(@PathVariable(value = "id") Integer id){
        return ResponseEntity.ok(manageOrderService.confirmOrder(id));
    }
}
