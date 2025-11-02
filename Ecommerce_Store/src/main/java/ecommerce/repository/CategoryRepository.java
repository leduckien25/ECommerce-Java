package ecommerce.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ecommerce.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

	@Query(value = "SELECT * FROM category LIMIT :limit OFFSET :offset", nativeQuery = true)
	List<Category> findAll(@Param("limit") int limit, @Param("offset") int offset);

	boolean existsByCategoryName(String categoryName);

	Optional<Category> findByCategoryName(String categoryName);
}
