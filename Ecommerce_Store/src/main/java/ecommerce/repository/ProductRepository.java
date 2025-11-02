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
	List<Product> findAllProductsByCategoryId(Long categoryId);

	@Query(value = "SELECT * FROM product WHERE category_id = :categoryId LIMIT :limit OFFSET :offset", nativeQuery = true)
	List<Product> findAllProductsByCategoryId(@Param("categoryId") Long categoryId, @Param("limit") int limit,
			@Param("offset") int offset);

	@Query("SELECT p FROM Product p WHERE p.category IS NULL")
	List<Product> findAllWithoutCategory();

	@Query(value = "SELECT * FROM product WHERE category_id IS NULL LIMIT :limit OFFSET :offset", nativeQuery = true)
	List<Product> findAllWithoutCategory(@Param("offset") int offset, @Param("limit") int limit);

	@Query("SELECT p FROM Product p LEFT JOIN FETCH p.category WHERE p.id = :id")
	Optional<Product> findByIdWithCategory(@Param("id") Long id);

	@Query(value = "SELECT * FROM product LIMIT :limit OFFSET :offset", nativeQuery = true)
	List<Product> findAll(@Param("offset") int offset, @Param("limit") int limit);
}
