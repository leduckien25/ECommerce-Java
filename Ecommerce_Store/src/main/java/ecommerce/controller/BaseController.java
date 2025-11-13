package ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import ecommerce.service.CategoryService;
import ecommerce.service.ProductService;
import ecommerce.service.OrderService;

public abstract class BaseController {

    @Autowired
    protected CategoryService categoryService;

    @Autowired
    protected ProductService productService;

    @Autowired
    protected OrderService orderService;

    protected void addCommonData(Model model) {
        model.addAttribute("allCategory", categoryService.findAll());
    }
}
