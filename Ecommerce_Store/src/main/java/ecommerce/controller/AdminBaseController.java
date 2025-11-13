package ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

import ecommerce.service.CategoryService;
import ecommerce.service.ProductService;
import ecommerce.service.OrderService;

public abstract class AdminBaseController {

    @Autowired
    protected CategoryService categoryService;
    @Autowired
    protected ProductService productService;
    @Autowired
    protected OrderService orderService;

    protected int sizeOfAdminPage = 12;

    protected void addCommonData(Model model) {
        model.addAttribute("allCategory", categoryService.findAll());
    }

    protected boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedUser") != null;
    }

    protected String redirectIfNotLogged(HttpSession session) {
        return isLoggedIn(session) ? null : "redirect:/login";
    }
}
