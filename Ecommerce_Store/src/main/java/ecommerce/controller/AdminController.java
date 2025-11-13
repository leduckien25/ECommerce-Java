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
	public String admin(Model model, HttpSession session) {

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

	@PostMapping("/save-category")
	public String saveCategory(@ModelAttribute Category category) {
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
	public String editCategoryForm(@PathVariable("id") long id, Model model, HttpSession session) {

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
		return "/admin/product/add-product";
	}

	@PostMapping("/save-product")
	public String saveProduct(@ModelAttribute Product product,
			@RequestParam("categoryId") Long categoryId,
			@RequestParam("file") MultipartFile file) throws IOException {

		if (categoryId != -1) {
			product.setCategory(categoryService.findById(categoryId).get());
		}

		String imageName = file != null ? file.getOriginalFilename() : "default.png";
		product.setProductImage(imageName);

		Product saved = productService.saveProduct(product);

		if (!ObjectUtils.isEmpty(saved)) {
			File savefile = new ClassPathResource("static/img").getFile();
			Path path = Paths.get(savefile.getAbsolutePath()
					+ File.separator + "product_image"
					+ File.separator + imageName);

			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
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

		boolean ok = productService.deleteProduct(id);
		session.setAttribute(ok ? "successMsg" : "errorMsg",
				ok ? "Product Deleted Successfully." : "Error deleting product");

		return "redirect:/admin/product";
	}

	@GetMapping("/edit-product/{id}")
	public String editProduct(@PathVariable long id, Model model, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);

		model.addAttribute("product", productService.getProductById(id));
		return "/admin/product/edit-product";
	}

	@PostMapping("/update-product")
	public String updateProduct(@ModelAttribute Product product,
			@RequestParam("categoryId") Long categoryId,
			@RequestParam("file") MultipartFile file) {

		if (categoryId != -1) {
			product.setCategory(categoryService.findById(categoryId).get());
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
	public String detailOrder(Model model, @PathVariable long id, HttpSession session) {

		String redirect = redirectIfNotLogged(session);
		if (redirect != null)
			return redirect;

		addCommonData(model);

		model.addAttribute("order", orderService.getOrderById(id));
		return "/admin/order/order-detail";
	}

	@PostMapping("/order/update/{id}")
	public String updateOrder(@RequestParam String newStatus, @PathVariable long id) {

		var order = orderService.getOrderById(id);
		order.setStatus(newStatus);
		orderService.saveOrder(order);

		return "redirect:/admin/order";
	}
}
