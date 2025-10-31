package ecommerce.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import ecommerce.entity.Category;
import ecommerce.entity.Product;
import ecommerce.service.CategoryService;
import ecommerce.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminViewController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	ProductService productService;

	@GetMapping({ "", "/" })
	public String adminIndex(Model model) {
		model.addAttribute("allCategory", categoryService.findAll());

		return "admin/dashboard";
	}

	@GetMapping("/add-category")
	public String addCategory(Model model) {
		model.addAttribute("allCategory", categoryService.findAll());

		return "admin/category/category-add-form";
	}

	@PostMapping("/save-category")
	public String saveCategory(@ModelAttribute Category category) {

		Category saveCategory = categoryService.saveCategory(category);

		return "redirect:/admin/category";
	}

	@GetMapping("/category")
	public String category(Model model) {
		model.addAttribute("allCategory", categoryService.findAll());
		model.addAttribute("allCategoryList", categoryService.findAll());

		return "/admin/category/category-home";
	}

	@GetMapping("/edit-category/{id}")
	public String editCategoryForm(@PathVariable("id") long id, Model model) {
		model.addAttribute("allCategory", categoryService.findAll());

		Optional<Category> categoryObj = categoryService.findById(id);
		if (categoryObj.isPresent()) {
			Category category = categoryObj.get();
			model.addAttribute("category", category);
			return "/admin/category/category-edit-form";

		} else {
			return "redirect:/admin/category";
		}
	}

	@PostMapping("/update-category")
	public String udateCategory(@ModelAttribute Category category) {
		Category updateCategory = categoryService.saveCategory(category);

		return "redirect:/admin/category";
	}

	@GetMapping("/delete-category/{id}")
	public String deleteCategory(@PathVariable("id") long id, Model model) {
		model.addAttribute("allCategory", categoryService.findAll());

		Boolean deleteCategory = categoryService.deleteCategory(id);

		return "redirect:/admin/category";
	}

	@GetMapping("/add-product")
	public String addProduct(Model model) {
		model.addAttribute("allCategory", categoryService.findAll());

		return "/admin/product/add-product";
	}

	@PostMapping("/save-product")
	public String saveProduct(@ModelAttribute Product product, @RequestParam("categoryId") Long categoryId,
			@RequestParam("file") MultipartFile file)
			throws IOException {
		String imageName = file != null ? file.getOriginalFilename() : "default.png";

		product.setProductImage(imageName);

		if (categoryId != -1) {
			product.setCategory(categoryService.findById(categoryId).get());
		}

		Product saveProduct = productService.saveProduct(product);

		if (!ObjectUtils.isEmpty(saveProduct)) {
			File savefile = new ClassPathResource("static/img").getFile();
			Path path = Paths
					.get(savefile.getAbsolutePath() + File.separator + "product_image" + File.separator + imageName);
			System.out.println("File save Path :" + path);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
		}

		return "redirect:/admin/product";
	}

	@GetMapping("/product")
	public String productList(Model model) {
		model.addAttribute("productList", productService.findAll());
		model.addAttribute("allCategory", categoryService.findAll());

		return "/admin/product/product-home";
	}

	@GetMapping("/delete-product/{id}")
	public String deleteProduct(@PathVariable("id") long id, HttpSession session) {
		Boolean deleteProduct = productService.deleteProduct(id);

		if (deleteProduct) {
			session.setAttribute("successMsg", "Product Deleted Successfully.");
		} else {
			session.setAttribute("errorMsg", "Something Wrong on server while deleting Product");
		}
		return "redirect:/admin/product";

	}

	@GetMapping("/edit-product/{id}")
	public String editProduct(@PathVariable long id, Model model) {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		model.addAttribute("allCategoryList", categoryService.findAll());
		return "/admin/product/edit-product";
	}

	@PostMapping("/update-product")
	public String updateProduct(@ModelAttribute Product product,
			@RequestParam("categoryId") Long categoryId, @RequestParam("file") MultipartFile file) {

		if (categoryId != -1) {
			var category = categoryService.findById(categoryId);
			if (category != null) {
				product.setCategory(category.get());
			}
		}
		Product updateProduct = productService.updateProduct(product, file);

		return "redirect:/admin/product";
	}

	@GetMapping("/order")
	public String order(Model model) {
		model.addAttribute("allCategory", categoryService.findAll());
		return "/admin/order/order-home";
	}
}
