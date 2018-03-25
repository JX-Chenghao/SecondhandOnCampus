package com.ncu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.pojo.Evaluate;
import com.ncu.pojo.Goods;
import com.ncu.pojo.PageBean;
import com.ncu.pojo.vo.MessageVO;
import com.ncu.pojo.vo.SignVO;
import com.ncu.service.GoodsService;
import com.ncu.service.MessageService;


@Controller 
@RequestMapping("/goods")  
public class GoodsController {
    @Autowired
	GoodsService goodsService;
    @Autowired
    MessageService messageService;
    
    
    //分页展示商品
    @RequestMapping("/showGoodsByPage")
    public ModelAndView showGoodsByPage(HttpServletRequest request){
    	
    	ModelAndView modelAndView=new ModelAndView();
    	int currentPage;
    	if(request.getParameter("currentPage")!=null)
    		currentPage=Integer.parseInt(request.getParameter("currentPage"));
    	else
    		currentPage=1;
    	
    	PageBean<Goods> pageBeanForGoods = goodsService.getGoodsByPage(currentPage);
    	System.out.println(pageBeanForGoods.toString());
    	modelAndView.addObject("pageBeanForGoods", pageBeanForGoods);
    	modelAndView.setViewName("goods");
		return modelAndView;
		
    }

	//查詢自身收藏商品
	@RequestMapping("/showCollection")
	public ModelAndView showGoodsForUser(Integer userId){

		ModelAndView modelAndView=new ModelAndView();
        
        //展示用戶收藏商品
        List<SignVO> signGoodsList= goodsService.listGoodsForCollection(userId);
        modelAndView.addObject("signGoodsList",signGoodsList);
		modelAndView.setViewName("userSign");
		return modelAndView;

	}
	//查詢自身商品
	@RequestMapping("/showOwnerGoods")
	public ModelAndView showGoodsForUser(Integer userId,Integer auditState){

		ModelAndView modelAndView=new ModelAndView();
		List<Goods> goodsList=goodsService.listGoodsForUser(userId,auditState);
		modelAndView.addObject("ownGoodsList",goodsList);
		modelAndView.addObject("statusType",auditState);
		modelAndView.setViewName("userGoods");
		return modelAndView;

	}
	//商品詳細信息
	@RequestMapping("/detailOfGoods")
	public ModelAndView detailOfGoods(Goods goods){

		ModelAndView modelAndView=new ModelAndView();
		goods=goodsService.getDetailOfGoods(goods.getId());
		modelAndView.addObject("goods",goods);
		List<MessageVO> messagesVO = messageService.findMessageOfGoods(goods.getId());
		modelAndView.addObject("messagesVO",messagesVO);
		modelAndView.setViewName("detailOfGoods");
		return modelAndView;
	}
    //添加商品
	@RequestMapping("/saveGoods")
	public ModelAndView saveGoods(Goods goods,Integer userId,Integer categoryId){

		ModelAndView modelAndView=new ModelAndView();
		boolean saveRes=goodsService.saveGoods(goods,userId,categoryId);
		if(!saveRes){
			modelAndView.addObject("failInfo","商品上架異常！");
		}
		modelAndView.setViewName("user");
		return modelAndView;
	}
	//修改商品
	@RequestMapping("/updateGoods")
	public ModelAndView updateGoods(Goods goods){

		ModelAndView modelAndView=new ModelAndView();

		boolean updateRes=goodsService.updateGoods(goods);
		if(!updateRes){
			modelAndView.addObject("failInfo","商品修改異常！");
		}
		modelAndView.setViewName("user");
		return modelAndView;
	}
	//删除商品
	@RequestMapping("/removeGoods")
	public ModelAndView removeGoods(Goods goods){

		ModelAndView modelAndView=new ModelAndView();
		boolean removeRes=goodsService.removeGoods(goods.getId());
		if(!removeRes){
			modelAndView.addObject("failInfo","商品刪除異常！");
		}
		modelAndView.setViewName("user");
		return modelAndView;
	}
    //查询此卖家 的其他商品
    @RequestMapping("/queryOtherGoods")
    @ResponseBody
    public List<Goods> queryOtherGoods(Integer userId,Integer excludeGoodsId) throws Exception {
    	List<Goods> goodsList =null;
    	goodsList=goodsService.findOtherGoodsOfUser(userId,excludeGoodsId);
    	return goodsList;
    }
    //审核商品(管理员)
	@RequestMapping("/auditGoods")
	public ModelAndView auditGoods(Goods goods){

		ModelAndView modelAndView=new ModelAndView();
     	
		return modelAndView;
	}
}



