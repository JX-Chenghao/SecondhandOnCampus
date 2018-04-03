package com.ncu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.pojo.Cart;
import com.ncu.pojo.Goods;
import com.ncu.pojo.Orderitem;
import com.ncu.pojo.User;
import com.ncu.pojo.vo.OrderVO;
import com.ncu.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService orderService;

	@RequestMapping("/commitOrderView")
	public ModelAndView cart(Goods goods, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		List<OrderVO> orders = orderService.separateCartToManyOrder(getCart(request), 0, getUserID(request));
		for(OrderVO o : orders){
			System.out.println(o.getOrder().toString());
			for(Orderitem i :o.getOrderitems()){
				System.out.println(i.toString());
			}
		}
		return modelAndView;
	}
	private Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
	}
	private Integer getUserID(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
		   return user.getId();
		}
		return null;
	}	
}
