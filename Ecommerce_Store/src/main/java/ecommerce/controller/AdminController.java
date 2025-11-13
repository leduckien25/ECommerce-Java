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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ecommerce.entity.Category;
import ecommerce.entity.Product;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
	static final int sizeOfAdminPage = 12;

	@GetMapping({ "", "/" })
	public String admin(Model model) {
		model.addAttribute("allCategory", categoryService.findAll());

		return "admin/dashboard";
	}

	@GetMapping("/add-category")
	public String addCategory(Model model) {
		addCommonData(model);

		return "admin/category/category-add-form";
	}

	@PostMapping("/save-category")
	public String saveCategory(@ModelAttribute Category category) {

		return "redirect:/admin/category";
	}

	@GetMapping("/category")
	public String category(Model model, @RequestParam(name = "p", defaultValue = "1") int p) {
		addCommonData(model);

		int offset = (p - 1) * sizeOfAdminPage;
		int totalPages = (categoryService.findAll().size() - 1) / sizeOfAdminPage + 1;

		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", p);
		model.addAttribute("allCategoryList", categoryService.findAll(offset, sizeOfAdminPage));

		return "/admin/category/category-home";
	}

	@GetMapping("/edit-category/{id}")
	public String editCategoryForm(@PathVariable("id") long id, Model model) {
		addCommonData(model);

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
		return "redirect:/admin/category";
	}

	@GetMapping("/delete-category/{id}")
	public String deleteCategory(@PathVariable("id") long id, Model model) {
		addCommonData(model);

		return "redirect:/admin/category";
	}

	@GetMapping("/add-product")
	public String addProduct(Model model) {
		addCommonData(model);

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
	public String product(Model model, @RequestParam(name = "p", defaultValue = "1") int p) {
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
		addCommonData(model);

		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
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
		return "redirect:/admin/product";
	}

	@GetMapping("/order")
	public String order(Model model, @RequestParam(name = "p", defaultValue = "1") int p) {
		addCommonData(model);

		int offset = (p - 1) * sizeOfAdminPage;
		int totalPages = (orderService.findAll().size() - 1) / sizeOfAdminPage + 1;

		model.addAttribute("AllOrderList", orderService.findAll(offset, sizeOfAdminPage));
		model.addAttribute("currentPage", p);
		model.addAttribute("totalPages", totalPages);

		return "/admin/order/order-home";
	}

	@GetMapping("/order/{id}")
	public String detailOrder(Model model, @PathVariable long id) {
		addCommonData(model);

		var order = orderService.getOrderById(id);

		model.addAttribute("order", order);
		return "/admin/order/order-detail";
	}

	@PostMapping("/order/update/{id}")
	public String updateOrder(@RequestParam String newStatus, @PathVariable long id) {
		var oldOrder = orderService.getOrderById(id);

		oldOrder.setStatus(newStatus);

		orderService.saveOrder(oldOrder);
		return "redirect:/admin/order";
	}
}
