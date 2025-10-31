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
	public String adminIndex() {

		return "admin/dashboard";
	}

	@GetMapping("/add-category")
	public String addCategory(Model model) {

		return "admin/category/category-add-form";
	}

	@PostMapping("/save-category")
	public String saveCategory(@ModelAttribute Category category) {

		Category saveCategory = categoryService.saveCategory(category);

		return "redirect:/admin/category";
	}

	@GetMapping("/category")
	public String category(Model model) {
		List<Category> allCategories = categoryService.findAll();
		System.out.println("category: " + allCategories.toString());

		model.addAttribute("allCategoryList", allCategories);

		return "/admin/category/category-home";
	}

	@GetMapping("/edit-category/{id}")
	public String editCategoryForm(@PathVariable("id") long id, Model model) {
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
	public String deleteCategory(@PathVariable("id") long id, HttpSession session) {
		Boolean deleteCategory = categoryService.deleteCategory(id);

		return "redirect:/admin/category";
	}

	@GetMapping("/add-product")
	public String addProduct(Model model) {
		List<Category> allCategories = categoryService.findAll();
		model.addAttribute("allCategoryList", allCategories);
		return "/admin/product/add-product";
	}

	@PostMapping("/save-product")
	public String saveProduct(@ModelAttribute Product product, @RequestParam("file") MultipartFile file,
			HttpSession session) throws IOException {
		String imageName = file != null ? file.getOriginalFilename() : "default.png";

		product.setProductImage(imageName);

		Product saveProduct = productService.saveProduct(product);

		if (!ObjectUtils.isEmpty(saveProduct)) {
			File savefile = new ClassPathResource("static/img").getFile();
			Path path = Paths
					.get(savefile.getAbsolutePath() + File.separator + "product_image" + File.separator + imageName);
			System.out.println("File save Path :" + path);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			session.setAttribute("successMsg", "Product Save Successfully.");
		} else {
			session.setAttribute("errorMsg", "Something Wrong on server while save Product");
			// System.out.println("Something Wrong on server while save Product");
		}

		return "redirect:/admin/product-list";
	}

	@GetMapping("/product")
	public String productList(Model model) {
		model.addAttribute("productList", productService.findAll());
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
		return "redirect:/admin/product-list";

	}

	@GetMapping("/edit-product/{id}")
	public String editProduct(@PathVariable long id, Model model) {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		model.addAttribute("allCategoryList", categoryService.findAll());
		return "/admin/product/edit-product";
	}

	@PostMapping("/update-product")
	public String updateProduct(@ModelAttribute Product product, @RequestParam("file") MultipartFile file,
			HttpSession session, Model model) {

		Product updateProduct = productService.updateProductById(product, file);
		if (!ObjectUtils.isEmpty(updateProduct)) {
			session.setAttribute("successMsg", "Product Updated Successfully.");
		} else {
			session.setAttribute("errorMsg", "Something Wrong on server while deleting Product");
		}

		// return "redirect:/admin/product/edit-product";
		return "redirect:/admin/product-list";
	}

}
