package ecommerce.service;

import java.util.List;
import java.util.Optional;

import ecommerce.entity.Category;

public interface CategoryService {

	public Category saveCategory(Category category);

	boolean existCategory(String categoryName);

	public Boolean deleteCategory(long id);

	public Optional<Category> findById(long id);

	public Optional<Category> findByName(String name);

	List<Category> findAll();

}
