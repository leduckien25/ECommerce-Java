package ecommerce.service;

import ecommerce.model.CartItem;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartService {

    private static String CART_SESSION_KEY = "cart";

    private final HttpSession session;

    public CartService(HttpSession session) {
        this.session = session;
    }

    public List<CartItem> getCartItems() {
        List<CartItem> cart = (List<CartItem>) session.getAttribute(CART_SESSION_KEY);
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute(CART_SESSION_KEY, cart);
        }
        return cart;
    }

    public void addItem(CartItem item) {
        List<CartItem> cart = getCartItems();
        boolean found = false;
        for (CartItem cartItem : cart) {
            if (cartItem.getProductId().equals(item.getProductId())) {
                cartItem.setQuantity(cartItem.getQuantity() + item.getQuantity());
                found = true;
                break;
            }
        }
        if (!found) {
            cart.add(item);
        }
        session.setAttribute(CART_SESSION_KEY, cart);
    }

    public void removeItem(Long productId) {
        List<CartItem> cart = getCartItems();
        cart.removeIf(cartItem -> cartItem.getProductId().equals(productId));
        session.setAttribute(CART_SESSION_KEY, cart);
    }

    public void clearCart() {
        session.removeAttribute(CART_SESSION_KEY);
    }

    public double getTotal() {
        return getCartItems().stream().mapToDouble(CartItem::getTotal).sum();
    }
}
