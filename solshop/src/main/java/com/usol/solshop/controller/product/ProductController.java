package com.usol.solshop.controller.product;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.usol.solshop.model.product.dto.ProductDTO;
import com.usol.solshop.service.product.ProductService;

@Controller
@RequestMapping("product/*")
public class ProductController {

	@Inject
	ProductService productService;
	
	@RequestMapping("insert.do")
	public String insert(ProductDTO dto) {
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="";
				new File(path).mkdir();
				//임시디렉토리에서 내가 지정한 디렉토리로 이동
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setPicture_url(filename);
		productService.insertProduct(dto);
		return "redirect:/product/product_write.do";
	}
	
	@RequestMapping("productlist.do")
	public ModelAndView productlist(ModelAndView mav) {
		List<ProductDTO> items = productService.listProduct();
		mav.setViewName("/product/productlist");
		mav.addObject("list", items);
		return mav;
	}
	
	@RequestMapping("detail/{product_id}")
	public ModelAndView detail(@PathVariable int product_id, ModelAndView mav) {
		mav.setViewName("/product/productdetail");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	@RequestMapping("product_write.do")
	public String write() {
		return "product/product_write";
	}
}
