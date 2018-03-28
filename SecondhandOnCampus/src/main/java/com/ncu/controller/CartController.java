package com.ncu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.pojo.Cart;
import com.ncu.pojo.Goods;
import com.ncu.service.GoodsService;

@Controller
@RequestMapping("/cart")
public class CartController  {
    @Autowired
    GoodsService goodsService;

    @RequestMapping("/showCart")
    public ModelAndView cart(Goods goods,HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("cart");
        return modelAndView;
    }
    
    
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,String> add(Goods goods,HttpServletRequest request){
        Map<String,String> resMap=new HashMap<String, String>();
        goods=goodsService.findGoodsById(goods.getId());
        Cart cart=getCart(request);
        cart.add(goods);
        resMap.put("res","success");
        resMap.put("totalPrice",cart.getTotal()+"");
        resMap.put("items", cart.getItems().size()+"");
        return resMap;
    }
    @RequestMapping("/remove")
    @ResponseBody
    public Map<String,String> remove(Goods goods,HttpServletRequest request){
        Map<String,String> resMap=new HashMap<String, String>();
        Cart cart=getCart(request);
        cart.remove(goods.getId());
        resMap.put("res","success");
        resMap.put("totalPrice",cart.getTotal()+"");
        resMap.put("items", cart.getItems().size()+"");
        return resMap;
    }
    @RequestMapping("/change")
    @ResponseBody
    public Map<String,String> change(Goods goods,String op,HttpServletRequest request){
        Map<String,String> resMap=new HashMap<String, String>();
        Cart cart=getCart(request);
        if("+".equals(op)){
            cart.changeQuantity(goods.getId(),1);
        }else if("-".equals(op)){
            cart.changeQuantity(goods.getId(),-1);
        }
        resMap.put("res","success");
        return resMap;
    }
    
    private Cart getCart(HttpServletRequest request) {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        return cart;
    }
}
