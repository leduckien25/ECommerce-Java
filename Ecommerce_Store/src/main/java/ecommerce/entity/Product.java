package ecommerce.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(length = 500)
	private String productName;

	@Column(length = 5000)
	private String productDescription;

	private Double productPrice;

	private int productStock;

	private String productImage;

	@ManyToOne
	@JoinColumn(name = "categoryId", referencedColumnName = "id")
	private Category category;

	public Long getId() {
		return id;
	}

	public String getProductName() {
		return productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public String getProductImage() {
		return productImage;
	}

	public Category getCategory() {
		return category;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
