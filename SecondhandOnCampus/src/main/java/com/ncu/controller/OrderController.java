package com.ncu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.pojo.Cart;
import com.ncu.pojo.Goods;
import com.ncu.pojo.Orderitem;
import com.ncu.pojo.User;
import com.ncu.pojo.vo.OrderVO;
import com.ncu.pojo.vo.OrderitemVO;
import com.ncu.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService orderService;
	
    static Integer orderNumBase=1111;

	@RequestMapping("/commitOrderInCart")
	public ModelAndView commitOrderInCart( HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		List<OrderVO> orderVOs = orderService.separateCartToManyOrder(getCart(request), 0, getUserID(request));
		for(OrderVO o : orderVOs){
			o.getOrder().setOrderNumber(creatOrderNum());
			System.out.println(o.getOrder().toString());
			for(OrderitemVO i :o.getOrderitemVOs()){
				System.out.println(i.getOrderitem().toString());
			}
			
		}
		modelAndView.addObject("orderVOs",orderVOs);
		request.getSession().setAttribute("orderVOs", orderVOs);
		modelAndView.setViewName("commitOrderCart");
		return modelAndView;
	}
	@RequestMapping("/showOrder")
	public ModelAndView showOrder(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("order");
		List<OrderVO> orderVOs = orderService.findOrderByClientId(getUserID(request),null);
		List<OrderVO> orderVOs0 = orderService.findOrderByClientId(getUserID(request),0);
		List<OrderVO> orderVOs1 = orderService.findOrderByClientId(getUserID(request),1);
		List<OrderVO> orderVOs2 = orderService.findOrderByClientId(getUserID(request),2);
		
		modelAndView.addObject("orderVOs", orderVOs);
		modelAndView.addObject("orderVOs0", orderVOs0);
		modelAndView.addObject("orderVOs1", orderVOs1);
		modelAndView.addObject("orderVOs2", orderVOs2);
		System.out.println(orderVOs.size()+"-"+orderVOs1.size()+"-"+orderVOs2.size()+"-");
		return modelAndView;
	}
	@RequestMapping("/showOrderForCrop")
	public ModelAndView showOrderForCrop(HttpServletRequest request,Integer orderStatus) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("userOrderforCrop");
		List<OrderVO> orderVOs = orderService.findOrderByCropId(getUserID(request),orderStatus);
		modelAndView.addObject("orderStatus",orderStatus);
		modelAndView.addObject("orderVOs", orderVOs);
		return modelAndView;
	}

	
	@RequestMapping("/addOrders")
	public String addOrders( HttpServletRequest request,Integer payWay) {
		List<OrderVO> orderVOs=getOrderVOs(request) ;
		for(OrderVO orderVO:orderVOs){
			orderVO.getOrder().setPayWay(payWay);
			orderVO.getOrder().setOrderState(0);//持久带数据库就是 代发货状态0
			
			orderVO.getOrder().setGetWay(Integer.parseInt(request.getParameter("o_"+orderVO.getOrder().getCropId())));
			if(orderVO.getOrder().getGetWay().equals(1)){
				orderVO.getOrder().setTotalPrice(orderVO.getOrder().getTotalPrice()+2.5);
			}
			//MySQL 5.7的关键字和保留字：order
			orderService.save(orderVO);//注意！！！！浪费了2个小时！！！order不能做mysql表名，数据inser into order插不进去.改成 inser into 'order'成功
			
		}
		request.getSession().setAttribute("orderVOs", null);
		request.getSession().setAttribute("cart", null);
		return "redirect:/order/showOrder.action";
	}
	private List<OrderVO>  getOrderVOs(HttpServletRequest request) {
		List<OrderVO> orderVOs =(List<OrderVO>) request.getSession().getAttribute("orderVOs");
		if (orderVOs != null) {
			return orderVOs;
		}
		return null;
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
	
	private String creatOrderNum() {
		String finalOrderNum = "";  
		try {  
            synchronized (orderNumBase) {  
                // 取系统当前时间作为订单号变量前半部分，精确到毫秒  
                String now = new SimpleDateFormat("yyMMdd-HHmm").format(new Date());  
                String[] split = (now+"").split("-");
                
                //组装订单号  
                finalOrderNum=split[0]+orderNumBase+split[1];  
                orderNumBase++;  
            }
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		System.out.println("订单号"+finalOrderNum);
		return finalOrderNum;
	}

}
