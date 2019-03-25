package com.usol.solshop.service.product;

import java.util.List;

import com.usol.solshop.model.product.dto.ProductDTO;

public interface ProductService {

	List<ProductDTO> listProduct();
	ProductDTO detailProduct(int product_id);
	String fileInfo(int Product_id);
	void updateProduct(ProductDTO dto);
	void deleteProduct(int product_id);
	void insertProduct(ProductDTO dto);
}
