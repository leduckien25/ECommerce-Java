package ecommerce.service.impl;

import ecommerce.model.CartItem;
import ecommerce.service.CartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    private static final String CART_SESSION_KEY = "cart";

    private final HttpSession session;

    public CartServiceImpl(HttpSession session) {
        this.session = session;
    }

    @Override
    public List<CartItem> getCartItems() {
        List<CartItem> cart = (List<CartItem>) session.getAttribute(CART_SESSION_KEY);
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute(CART_SESSION_KEY, cart);
        }
        return cart;
    }

    @Override
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

    @Override
    public void removeItem(Long productId) {
        List<CartItem> cart = getCartItems();
        cart.removeIf(cartItem -> cartItem.getProductId().equals(productId));
        session.setAttribute(CART_SESSION_KEY, cart);
    }

    @Override
    public void clearCart() {
        session.removeAttribute(CART_SESSION_KEY);
    }

    @Override
    public double getTotal() {
        return getCartItems().stream().mapToDouble(CartItem::getTotal).sum();
    }
}
