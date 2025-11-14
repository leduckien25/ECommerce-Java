package ecommerce.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Optional;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import ecommerce.entity.Category;
import ecommerce.entity.Product;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController extends AdminBaseController {

	@GetMapping({ "", "/" })
	public String dashboard(Model model, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);
		return "admin/dashboard";
	}

	@GetMapping("/add-category")
	public String addCategory(Model model, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);
		return "admin/category/category-add-form";
	}

	@PostMapping("/add-category")
	public String addCategory(@ModelAttribute Category category) {
		categoryService.saveCategory(category);
		return "redirect:/admin/category";
	}

	@GetMapping("/category")
	public String category(Model model, @RequestParam(name = "p", defaultValue = "1") int p, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);

		int offset = (p - 1) * sizeOfAdminPage;
		int totalPages = (categoryService.findAll().size() - 1) / sizeOfAdminPage + 1;

		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", p);
		model.addAttribute("allCategoryList", categoryService.findAll(offset, sizeOfAdminPage));

		return "/admin/category/category-home";
	}

	@GetMapping("/edit-category/{id}")
	public String updateCategory(@PathVariable("id") long id, Model model, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);

		Optional<Category> categoryObj = categoryService.findById(id);
		if (categoryObj.isPresent()) {
			model.addAttribute("category", categoryObj.get());
			return "/admin/category/category-edit-form";
		}
		return "redirect:/admin/category";
	}

	@PostMapping("/update-category")
	public String updateCategory(@ModelAttribute Category category) {
		categoryService.saveCategory(category);
		return "redirect:/admin/category";
	}

	@GetMapping("/delete-category/{id}")
	public String deleteCategory(@PathVariable("id") long id) {
		categoryService.deleteCategory(id);
		return "redirect:/admin/category";
	}

	@GetMapping("/add-product")
	public String addProduct(Model model, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);
		model.addAttribute("allCategoryList", categoryService.findAll());
		return "/admin/product/add-product";
	}

	@PostMapping("/add-product")
	public String addProduct(@ModelAttribute Product product,
			@RequestParam("categoryId") Long categoryId,
			@RequestParam("file") MultipartFile file) throws IOException {

		if (categoryId != -1) {
			product.setCategory(categoryService.findById(categoryId).get());
		}

		String imageName = null;
		if (!file.isEmpty()) {
			imageName = file.getOriginalFilename();
		}

		product.setProductImage(imageName);

		productService.saveProduct(product);

		if (!file.isEmpty()) {
			String uploadDir = System.getProperty("user.dir") + "/uploads/product_image/";

			Path filePath = Paths.get(uploadDir + imageName);
			Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		}

		return "redirect:/admin/product";
	}

	@GetMapping("/product")
	public String product(Model model, @RequestParam(name = "p", defaultValue = "1") int p, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);

		int offset = (p - 1) * sizeOfAdminPage;
		int totalPages = (productService.findAll().size() - 1) / sizeOfAdminPage + 1;

		model.addAttribute("productList", productService.findAll(offset, sizeOfAdminPage));
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", p);

		return "/admin/product/product-home";
	}

	@GetMapping("/delete-product/{id}")
	public String deleteProduct(@PathVariable("id") long id, HttpSession session) {

		Product product = productService.getProductById(id);

		if (product != null) {

			String uploadDir = System.getProperty("user.dir") + "/uploads/product_image/";
			String imageName = product.getProductImage();

			if (imageName != null) {
				File file = new File(uploadDir + imageName);

				if (file.exists()) {
					file.delete();
				}
			}

			productService.deleteProduct(id);
		}

		return "redirect:/admin/product";
	}

	@GetMapping("/edit-product/{id}")
	public String editProduct(@PathVariable long id, Model model, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);
		model.addAttribute("allCategoryList", categoryService.findAll());
		model.addAttribute("product", productService.getProductById(id));
		return "/admin/product/edit-product";
	}

	@PostMapping("/update-product")
	public String updateProduct(@ModelAttribute Product product,
			@RequestParam("categoryId") Long categoryId,
			@RequestParam("file") MultipartFile file) throws IOException {

		Product existingProduct = productService.getProductById(product.getId());
		if (existingProduct == null) {
			return "redirect:/admin/product";
		}

		if (categoryId != -1) {
			product.setCategory(categoryService.findById(categoryId).get());
		}

		if (!file.isEmpty()) {
			String oldImageName = existingProduct.getProductImage();

			String uploadDir = System.getProperty("user.dir") + "/uploads/product_image/";

			if (oldImageName != null) {
				File oldFile = new File(uploadDir + oldImageName);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}

			String newImageName = file.getOriginalFilename();

			Path newPath = Paths.get(uploadDir + newImageName);
			Files.copy(file.getInputStream(), newPath, StandardCopyOption.REPLACE_EXISTING);

			product.setProductImage(newImageName);
		} else {
			product.setProductImage(existingProduct.getProductImage());
		}

		productService.saveProduct(product);

		return "redirect:/admin/product";
	}

	@GetMapping("/order")
	public String order(Model model, @RequestParam(name = "p", defaultValue = "1") int p, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);

		int offset = (p - 1) * sizeOfAdminPage;
		int totalPages = (orderService.findAll().size() - 1) / sizeOfAdminPage + 1;

		model.addAttribute("AllOrderList", orderService.findAll(offset, sizeOfAdminPage));
		model.addAttribute("currentPage", p);
		model.addAttribute("totalPages", totalPages);

		return "/admin/order/order-home";
	}

	@GetMapping("/order/{id}")
	public String orderDetail(Model model, @PathVariable long id, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);

		model.addAttribute("order", orderService.getOrderById(id));
		return "/admin/order/order-detail";
	}

	@PostMapping("/order/update-order")
	public String updateOrder(@RequestParam String newStatus, @RequestParam long id) {

		var order = orderService.getOrderById(id);
		order.setStatus(newStatus);
		orderService.saveOrder(order);

		return "redirect:/admin/order";
	}
}
