package com.migi.migi_project.repository.user;

import com.migi.migi_project.entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Orders, Integer> {
    @Query(value = "SELECT o.* FROM orders as o WHERE id_user = ?1 AND status = 0", nativeQuery = true)
    Optional<Orders> findByIdUser(Integer idUser);

    @Query(value = "SELECT o.* FROM orders as o WHERE status = ?1", nativeQuery = true)
    Optional<Orders> findByStatus(Integer status);

    @Query(value = "SELECT o.* FROM orders as o WHERE status = ?1 AND id_user=?2", nativeQuery = true)
    Optional<Orders> findByStatusAndIdUser(Integer status, Integer idUser);
}
