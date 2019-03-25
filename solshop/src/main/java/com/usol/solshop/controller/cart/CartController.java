package com.usol.solshop.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.usol.solshop.model.cart.dto.CartDTO;
import com.usol.solshop.service.cart.CartService;
import com.usol.solshop.service.cart.CartServiceImpl;

@Controller
@RequestMapping("cart/*")
public class CartController {
	
	@Inject
	CartService cartService;

	@RequestMapping("cartinsert.do")
	public String cartinsert(HttpSession session, CartDTO dto) {
		String userid=(String)session.getAttribute("userid");
		if(userid == null) {
			return "redirect:/member/login.do";
		}else {
			dto.setUserid(userid);
			cartService.insert(dto);
			return "redirect:/cart/cartlist.do";
		}
	}
	
	
	@RequestMapping("cartlist.do")
	public ModelAndView cartlist(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		String userid=(String)session.getAttribute("userid");
		if(userid != null) {
			List<CartDTO> list = cartService.listCart(userid);
			int sumMoney = cartService.sumMoney(userid);
			map.put("list", list);
			map.put("count", list.size());
			map.put("sum", sumMoney);
			mav.setViewName("cart/cartlist");
			mav.addObject("map", map);
			
			//mav.addObject("list", list);
			//mav.addObject("count", list.size()); hashmap에 안넣고 이렇게 따로 보내도 상관없다.
			return mav;
		}else {
			return new ModelAndView("member/login","",null);
		}
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cart_id) {
		cartService.delete(cart_id);
		return "redirect:/cart/cartlist.do";
	}
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid != null) {
			cartService.deleteAll(userid);
		}
		return "redirect:/cart/cartlist.do";
	}
	
	@RequestMapping("update.do")
	public String update(@RequestParam int amount, int cart_id, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		if(userid != null) {
			if(amount == 0) {
				cartService.delete(cart_id);
			}
			CartDTO dto = new CartDTO();
			dto.setUserid(userid);
			dto.setCart_id(cart_id);
			dto.setAmount(amount);
			cartService.modifyCart(dto);
		}
		
		return "redirect:/cart/cartlist.do";
	}
	
	
	
	
	
}
