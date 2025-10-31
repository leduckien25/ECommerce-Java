package ecommerce.service;

import ecommerce.entity.Order;
import java.util.List;

public interface OrderService {
    Order saveOrder(Order order);

    List<Order> getAllOrders();

    Order getOrderById(Long id);

    void deleteOrder(Long id);
}
