package ecommerce.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import ecommerce.entity.Category;
import ecommerce.repository.CategoryRepository;
import ecommerce.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public Category saveCategory(Category category) {
		// TODO Auto-generated method stub
		return categoryRepository.save(category);
	}

	@Override
	public boolean existCategory(String categoryName) {
		return categoryRepository.existsByCategoryName(categoryName);
	}

	@Override
	public Boolean deleteCategory(long id) {
		// TODO Auto-generated method stub

		Category categoryFound = categoryRepository.findById(id).orElse(null);

		if (!ObjectUtils.isEmpty(categoryFound)) {
			categoryRepository.delete(categoryFound);
			return true;
		}

		return false;
	}

	@Override
	public Optional<Category> findById(long id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id);
	}

	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Optional<Category> findByName(String name) {
		return categoryRepository.findByCategoryName(name);
	}

}
