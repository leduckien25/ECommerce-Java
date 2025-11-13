package ecommerce.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ecommerce.entity.Category;
import ecommerce.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	public Category saveCategory(Category category) {
		return categoryRepository.save(category);
	}

	public Boolean deleteCategory(long id) {
		Category categoryFound = categoryRepository.findById(id).orElse(null);

		if (categoryFound != null) {
			categoryRepository.delete(categoryFound);
			return true;
		}

		return false;
	}

	public Optional<Category> findById(long id) {
		return categoryRepository.findById(id);
	}

	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	public List<Category> findAll(int offset, int limit) {
		return categoryRepository.findAll(limit, offset);
	}

	public Optional<Category> findByName(String name) {
		return categoryRepository.findByCategoryName(name);
	}

}
