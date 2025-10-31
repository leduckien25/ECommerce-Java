package ecommerce.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import ecommerce.entity.Category;
import ecommerce.entity.Product;
import ecommerce.service.CategoryService;
import ecommerce.service.ProductService;

@Controller
public class HomeViewController {
	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@GetMapping("/")
	public String homeIndex(Model model) {

		List<Category> allCategory = categoryService.findAll();

		List<Product> latestEightActiveProducts = productService.findAll().stream()
				.sorted((p1, p2) -> p2.getId().compareTo(p1.getId()))
				.limit(8).toList();

		model.addAttribute("allCategory", allCategory);
		model.addAttribute("latestEightActiveProducts", latestEightActiveProducts);
		return "index.html";
	}

	@GetMapping("/products")
	public String product(Model model, @RequestParam(name = "category", defaultValue = "") String category) {

		List<Category> allCategory = categoryService.findAll();
		List<Product> allProducts;

		if (category.isEmpty()) {
			allProducts = productService.findAll();
		} else if (category.equals("Other")) {
			allProducts = productService.findAllWithoutCategory();
		} else {
			var optionalCategory = categoryService.findByName(category);
			if (optionalCategory.isPresent()) {
				allProducts = productService.findAllProductsByCategoryId(optionalCategory.get().getId());
			} else {
				allProducts = new ArrayList<>();
			}
		}

		model.addAttribute("allCategory", allCategory);
		model.addAttribute("allProducts", allProducts);
		model.addAttribute("currentCategory", category);
		return "product";
	}

	@GetMapping("/product/{id}")
	public String viewProduct(@PathVariable long id, Model model) {
		List<Category> allCategory = categoryService.findAll();

		Product productById = productService.getProductById(id);

		model.addAttribute("allCategory", allCategory);
		model.addAttribute("product", productById);
		return "details";
	}
}
