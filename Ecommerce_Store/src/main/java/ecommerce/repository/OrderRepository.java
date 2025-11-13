package ecommerce.repository;

import ecommerce.entity.Order;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    @Query(value = "SELECT * FROM `order` LIMIT :limit OFFSET :offset", nativeQuery = true)
    List<Order> findAll(@Param("limit") int limit, @Param("offset") int offset);

    @Query(value = "SELECT * FROM `order` WHERE phone_number = :phoneNumber", nativeQuery = true)
    List<Order> findOrdersByPhoneNumber(@Param("phoneNumber") String phoneNumber);

}
