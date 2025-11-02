package ecommerce.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import ecommerce.entity.Product;
import ecommerce.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository productRepository;

	public Product saveProduct(Product product) {
		return productRepository.save(product);
	}

	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public List<Product> findAll(int offset, int limit) {
		return productRepository.findAll(offset, limit);
	}

	public List<Product> findAllWithoutCategory() {
		return productRepository.findAllWithoutCategory();
	}

	public List<Product> findAllWithoutCategory(int offset, int limit) {
		return productRepository.findAllWithoutCategory(offset, limit);
	}

	public Boolean deleteProduct(long id) {
		Optional<Product> product = productRepository.findById(id);
		if (product.isPresent()) {
			productRepository.deleteById(product.get().getId());
			return true;
		} else {
			return false;
		}

	}

	public Product getProductById(long id) {
		return productRepository.findByIdWithCategory(id).orElse(null);
	}

	public Product updateProduct(Product product, MultipartFile file) {
		Product dbProductById = getProductById(product.getId());
		String oldImageName = dbProductById.getProductImage();

		String imageName = (file == null || file.isEmpty())
				? oldImageName
				: file.getOriginalFilename();

		dbProductById.setProductImage(imageName);
		dbProductById.setProductName(product.getProductName());
		dbProductById.setProductDescription(product.getProductDescription());
		dbProductById.setCategory(product.getCategory());
		dbProductById.setProductPrice(product.getProductPrice());
		dbProductById.setProductStock(product.getProductStock());

		Product updatedProduct = productRepository.save(dbProductById);

		if (updatedProduct != null && file != null && !file.isEmpty()) {
			try {
				// ✅ Store outside classpath (recommended)
				String uploadDir = System.getProperty("user.dir") + "/uploads/product_image";

				Path imageDir = Paths.get(uploadDir);
				if (!Files.exists(imageDir)) {
					Files.createDirectories(imageDir);
				}

				// Delete old image
				if (oldImageName != null && !oldImageName.isEmpty()) {
					Path oldImagePath = imageDir.resolve(oldImageName);
					if (Files.exists(oldImagePath)) {
						Files.delete(oldImagePath);
						System.out.println("Deleted old image: " + oldImagePath);
					}
				}

				// Save new image
				Path newImagePath = imageDir.resolve(file.getOriginalFilename());
				Files.copy(file.getInputStream(), newImagePath, StandardCopyOption.REPLACE_EXISTING);
				System.out.println("Saved new image: " + newImagePath);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return updatedProduct;
	}

	public List<Product> findAllProductsByCategoryId(Long categoryId) {
		return productRepository.findAllProductsByCategoryId(categoryId);
	}

	public List<Product> findAllProductsByCategoryId(Long categoryId, int offset, int limit) {
		return productRepository.findAllProductsByCategoryId(categoryId, limit, offset);
	}

	public Optional<Product> getProductByIdWithCategory(Long productId) {
		return productRepository.findByIdWithCategory(productId);
	}

}
