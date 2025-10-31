package ecommerce.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ecommerce.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
	List<Product> findByCategoryId(Long categoryId);

	@Query("SELECT p FROM Product p WHERE p.category IS NULL")
	List<Product> findAllWithoutCategory();

	@Query("SELECT p FROM Product p LEFT JOIN FETCH p.category WHERE p.id = :id")
	Optional<Product> findByIdWithCategory(@Param("id") Long id);
}
