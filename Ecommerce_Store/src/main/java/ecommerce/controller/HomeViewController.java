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
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeViewController {
	static final int sizeOfProductPage = 12;

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@GetMapping("/")
	public String homeIndex(Model model, HttpSession session) {
		session.removeAttribute("checkoutItem");

		List<Category> allCategory = categoryService.findAll();

		List<Product> latestEightActiveProducts = productService.findAll().stream()
				.sorted((p1, p2) -> p2.getId().compareTo(p1.getId()))
				.limit(8).toList();

		model.addAttribute("allCategory", allCategory);
		model.addAttribute("latestEightActiveProducts", latestEightActiveProducts);
		return "index.html";
	}

	@GetMapping("/products")
	public String product(Model model,
			@RequestParam(name = "category", defaultValue = "") String category,
			@RequestParam(name = "search", defaultValue = "") String keyword,
			HttpSession session,
			@RequestParam(name = "p", defaultValue = "1") int p) {
		session.removeAttribute("checkoutItem");
		List<Category> allCategory = categoryService.findAll();
		model.addAttribute("allCategory", allCategory);

		List<Product> allProducts;
		int offset = (p - 1) * sizeOfProductPage;
		int totalPages;

		if (!keyword.equals("")) {
			allProducts = productService.findAllProductsByKeyword(keyword, offset, sizeOfProductPage);
			totalPages = ((productService.findAllProductsByKeyword(keyword).size() - 1) / sizeOfProductPage) + 1;
		} else {
			if (category.isEmpty()) {
				allProducts = productService.findAll(offset, sizeOfProductPage);
				totalPages = ((productService.findAll().size() - 1) / sizeOfProductPage) + 1;

			} else if (category.equals("Other")) {
				allProducts = productService.findAllWithoutCategory(offset, sizeOfProductPage);
				totalPages = ((productService.findAllWithoutCategory().size() - 1) / sizeOfProductPage) + 1;
			} else {
				var currentCategory = categoryService.findByName(category).get();

				allProducts = productService.findAllProductsByCategoryId(currentCategory.getId(), offset,
						sizeOfProductPage);
				totalPages = ((productService.findAllProductsByCategoryId(currentCategory.getId()).size() - 1)
						/ sizeOfProductPage) + 1;
			}
		}

		model.addAttribute("currentPage", p);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("allProducts", allProducts);
		model.addAttribute("currentCategory", category);
		return "product";
	}

	@GetMapping("/product/{id}")
	public String viewProduct(@PathVariable long id, Model model, HttpSession session) {
		session.removeAttribute("checkoutItem");

		List<Category> allCategory = categoryService.findAll();

		Product productById = productService.getProductById(id);

		model.addAttribute("allCategory", allCategory);
		model.addAttribute("product", productById);
		return "details";
	}
}
