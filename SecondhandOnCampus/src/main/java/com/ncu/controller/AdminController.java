package com.ncu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.common.StringUtil;
import com.ncu.pojo.Admin;
import com.ncu.pojo.Goods;
import com.ncu.pojo.Order;
import com.ncu.pojo.User;
import com.ncu.pojo.vo.GoodsVO;
import com.ncu.pojo.vo.OrderVO;
import com.ncu.service.AdminService;
import com.ncu.service.GoodsService;
import com.ncu.service.OrderService;
import com.ncu.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	UserService userService;
	@Autowired
	GoodsService goodsService;
	@Autowired
	OrderService orderService;

	// 进入登录页面
	@RequestMapping("/index")
	public ModelAndView index() throws Exception {
		ModelAndView modelAndview = new ModelAndView();
		modelAndview.setViewName("admin/index");
		return modelAndview;
	}

	// 登录失败跳转页面
	@RequestMapping("/loginFail")
	public ModelAndView loginFail() throws Exception {
		ModelAndView modelAndview = new ModelAndView();
		modelAndview.setViewName("admin/index");
		modelAndview.addObject("failureInfo", "用户名或密码错误！");
		return modelAndview;
	}

	// 登录
	@RequestMapping("/login")
	public String login(@RequestParam String account,
			@RequestParam String pwd, HttpServletRequest request)
			throws Exception {
		ModelAndView modelAndview = new ModelAndView();
		Admin admin = adminService.loginValidate(account, pwd);
		if (admin != null) {
			request.getSession().setAttribute("admin", admin);
			return "redirect:/admin/main.action";
		} else {
			return "redirect:/admin/loginFail.action";
		}

	}

	// 退出登录
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request) throws Exception {
		// 注销session
		request.getSession().setAttribute("admin", null);
		System.out.println("退出登录");
		return "redirect:/admin/index.action";
	}

	// 管理员登录主页
	@RequestMapping("/main")
	public ModelAndView adminMain(HttpServletRequest request) throws Exception {
		ModelAndView modelAndview = new ModelAndView();
		modelAndview.setViewName("admin/main");
		//用户数
		int ucount=userService.findUserCount();
		//订单数
		int ocount=orderService.findOrderCount();
		//上架商品数
		int gcount1=goodsService.findGoodsCount( 1);
		//待审核数
		int gcount0=goodsService.findGoodsCount( 0);
		modelAndview.addObject("ucount", ucount);
		modelAndview.addObject("ocount", ocount);
		modelAndview.addObject("gcount1", gcount1);
		modelAndview.addObject("gcount0", gcount0);
		
		List<User> users=userService.findAllUser();
		modelAndview.addObject("users", users);
		return modelAndview;
	}
	//  审核商品页
	@RequestMapping("/auditGoodsView")
	public ModelAndView auditGoodsView(HttpServletRequest request) throws Exception {
		ModelAndView modelAndview = new ModelAndView();
		modelAndview.setViewName("admin/goodsAudit");
		List<GoodsVO> goodsList=goodsService.findGoodsForAuditing();
		modelAndview.addObject("goodsList", goodsList);
		return modelAndview;
	}
	// 审核商品
	@RequestMapping("/auditGoods")
	public String auditGoods(Integer auditStatus,
			String failureText,Integer goodsId) throws Exception {
		Goods g = new Goods();
		g.setAuditState(auditStatus);
		g.setId(goodsId);
		
		if (!"".equals(failureText) && auditStatus.equals(2)) {
			g.setFailureText(StringUtil.messyCodetoChineseStr(failureText));
		}
		goodsService.updateGoods(g);
		 System.out.println(g);
		return "redirect:/admin/auditGoodsView.action";
	}
	//  修改订单页
	@RequestMapping("/updateOrderView")
	public ModelAndView updateOrderView(HttpServletRequest request,Integer status) throws Exception {
		ModelAndView modelAndview = new ModelAndView();
		List<OrderVO> orderVos=null;
		if(status.equals(0)){
			orderVos=orderService.findOrderByNotSendGoods();
		}else if(status.equals(1)){
			orderVos=orderService.findOrderByNotGetGoods();
		}
		modelAndview.addObject("status", status);
		modelAndview.addObject("orderVos", orderVos);
		modelAndview.setViewName("admin/updateOrderStatus");
		
		return modelAndview;
	}

	
	// 根据订单号找到订单
	@RequestMapping("/findOrder")
	@ResponseBody
	public OrderVO findOrder(String orderNumber) throws Exception {
		OrderVO orderVO = orderService.findOrderByNum(orderNumber);
		/*if(orderVO==null)
			orderVO=new OrderVO();*/
		return orderVO;
	}
	
	
	
	// 修改订单状态
	@RequestMapping("/updateOrderStatus")
	@ResponseBody
	public Map<String, String> updateOrderStatus(Integer orderId,
			Integer orderStatus) throws Exception {
		Map<String, String> resMap = new HashMap<String, String>();

		boolean res = orderService.updateOrderStatus(orderId, orderStatus);
		
		if (res) {
			resMap.put("res", "success");
		} else {
			resMap.put("res", "fail");
		}
		return resMap;
	}

}
