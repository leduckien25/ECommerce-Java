package ecommerce.controller;

import ecommerce.entity.Category;
import ecommerce.entity.Order;
import ecommerce.entity.OrderDetail;
import ecommerce.entity.Product;
import ecommerce.model.CartItem;
import ecommerce.service.CartService;
import ecommerce.service.CategoryService;
import ecommerce.service.OrderService;
import ecommerce.service.ProductService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CartViewController {
    @Autowired
    CartService cartService;

    @Autowired
    OrderService orderService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @PostMapping("/cart/action")
    public String handleCartAction(
            @RequestParam("productId") Long productId,
            @RequestParam("quantity") int quantity,
            @RequestParam("action") String action,
            HttpSession session) {

        Product currentProduct = productService.getProductById(productId);

        CartItem item = new CartItem();
        item.setProductId(productId);
        item.setProductName(currentProduct.getProductName());
        item.setQuantity(quantity);
        item.setProductPrice(currentProduct.getProductPrice());
        item.setPrice(currentProduct.getProductPrice() * quantity);
        item.setImageUrl(currentProduct.getProductImage());

        if ("add-to-cart".equals(action)) {
            cartService.addItem(item);
            return "redirect:/cart";
        } else if ("buy-now".equals(action)) {
            session.setAttribute("checkoutItem", item);
            return "redirect:/checkout";
        }

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String showCart(Model model) {
        List<Category> allCategory = categoryService.findAll();
        model.addAttribute("allCategory", allCategory);

        model.addAttribute("cart", cartService.getCartItems());
        model.addAttribute("total", cartService.getTotal());
        return "cart";
    }

    @GetMapping("/checkout")
    public String showCheckout(Model model, HttpSession session) {
        List<Category> allCategory = categoryService.findAll();
        model.addAttribute("allCategory", allCategory);

        CartItem checkoutItem = (CartItem) session.getAttribute("checkoutItem");

        if (checkoutItem != null) {
            model.addAttribute("cart", List.of(checkoutItem));
            model.addAttribute("total", checkoutItem.getTotal());
        } else {
            model.addAttribute("cart", cartService.getCartItems());
            model.addAttribute("total", cartService.getTotal());
        }

        return "checkout";
    }

    @PostMapping("/checkout")
    public String processCheckout(HttpSession session,
            @RequestParam String shippingAddress,
            @RequestParam String paymentMethod,
            @RequestParam String customerName,
            @RequestParam String phoneNumber,
            Model model) {

        CartItem checkoutItem = (CartItem) session.getAttribute("checkoutItem");

        List<CartItem> cartItems;

        if (checkoutItem != null) {
            cartItems = List.of(checkoutItem);
        } else {
            cartItems = cartService.getCartItems();
        }

        if (cartItems.isEmpty()) {
            return "redirect:/cart";
        }

        Order order = new Order();
        order.setShippingAddress(shippingAddress);
        order.setPaymentMethod(paymentMethod);
        order.setTotalAmount(cartService.getTotal());
        order.setCustomerName(customerName);
        order.setPhoneNumber(phoneNumber);

        List<OrderDetail> orderDetails = cartItems.stream().map(item -> {
            OrderDetail detail = new OrderDetail();
            detail.setProductId(item.getProductId());
            detail.setProductName(item.getProductName());
            detail.setQuantity(item.getQuantity());
            detail.setPrice(item.getPrice());
            detail.setTotal(item.getTotal());
            detail.setOrder(order);
            return detail;
        }).toList();

        order.setOrderDetails(orderDetails);

        orderService.saveOrder(order);

        if (checkoutItem == null) {
            cartService.clearCart();
        } else {
            session.removeAttribute("checkoutItem");
        }

        model.addAttribute("phoneNumber", phoneNumber);
        model.addAttribute("customerName", customerName);
        model.addAttribute("shippingAddress", shippingAddress);
        return "order-success";
    }
}
