package ecommerce.service;

import ecommerce.entity.Order;
import ecommerce.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }

    public List<Order> findAll() {
        return orderRepository.findAll();
    }

    public List<Order> findAll(int offset, int limit) {
        return orderRepository.findAll(limit, offset);
    }

    public Order getOrderById(Long id) {
        Optional<Order> order = orderRepository.findById(id);
        return order.orElse(null);
    }

    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }
}
