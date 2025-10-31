package ecommerce.service;

import ecommerce.model.CartItem;
import java.util.List;

public interface CartService {
    List<CartItem> getCartItems();

    void addItem(CartItem item);

    void removeItem(Long productId);

    void clearCart();

    double getTotal();
}
