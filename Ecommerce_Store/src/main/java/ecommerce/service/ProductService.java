package ecommerce.service;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;
import ecommerce.entity.Product;

public interface ProductService {

	public Product saveProduct(Product product);

	public List<Product> findAll();

	public Boolean deleteProduct(long id);

	public Optional<Product> findById(long id);

	public Product getProductById(long id);

	public Product updateProductById(Product product, MultipartFile file);

	List<Product> findAllProductsByCategoryId(Long categoryId);

}
