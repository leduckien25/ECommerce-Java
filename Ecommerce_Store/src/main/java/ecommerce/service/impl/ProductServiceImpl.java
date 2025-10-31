package ecommerce.service.impl;

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
import ecommerce.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;

	@Override
	public Product saveProduct(Product product) {
		return productRepository.save(product);
	}

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Boolean deleteProduct(long id) {
		Optional<Product> product = productRepository.findById(id);
		if (product.isPresent()) {
			productRepository.deleteById(product.get().getId());
			return true;
		} else {
			return false;
		}

	}

	@Override
	public Optional<Product> findById(long id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public Product getProductById(long id) {
		// TODO Auto-generated method stub
		return productRepository.findById(id).orElse(null);
	}

	@Override
	public Product updateProductById(Product product, MultipartFile file) {
		Product dbProductById = getProductById(product.getId());

		String imageName = file.isEmpty() ? dbProductById.getProductImage() : file.getOriginalFilename();
		dbProductById.setProductImage(imageName);
		dbProductById.setProductName(product.getProductName());
		dbProductById.setProductDescription(product.getProductDescription());
		dbProductById.setCategory(product.getCategory());
		dbProductById.setProductPrice(product.getProductPrice());
		dbProductById.setProductStock(product.getProductStock());

		Product updatedProduct = productRepository.save(dbProductById);

		if (!ObjectUtils.isEmpty(updatedProduct)) {
			if (!file.isEmpty()) {
				try {

					File savefile = new ClassPathResource("static/img").getFile();
					Path path = Paths.get(savefile.getAbsolutePath() + File.separator + "product_image" + File.separator
							+ file.getOriginalFilename());
					System.out.println("File save Path :" + path);
					Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return updatedProduct;
		}
		return null;
	}

	@Override
	public List<Product> findAllProductsByCategoryId(Long categoryId) {
		List<Product> products = null;
		if (categoryId == 0) {
			products = productRepository.findAll();
		} else {
			products = productRepository.findByCategoryId(categoryId);
		}

		return products;
	}

}
