package com.ncu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.common.FileSaveUtils;
import com.ncu.pojo.Category;
import com.ncu.pojo.Goods;
import com.ncu.pojo.PageBean;
import com.ncu.pojo.User;
import com.ncu.pojo.vo.MessageVO;
import com.ncu.pojo.vo.SignVO;
import com.ncu.service.CategoryService;
import com.ncu.service.GoodsService;
import com.ncu.service.MessageService;


@Controller 
@RequestMapping("/goods")  
public class GoodsController {
    @Autowired
	GoodsService goodsService;
    @Autowired
    MessageService messageService;
    @Autowired
    CategoryService categoryService;
    
    
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
	@RequestMapping("/addGoodsView")
	public ModelAndView addGoods(Goods goods, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		List<Category> categories = categoryService.findAllCategoryData();
		modelAndView.setViewName("userAddGoods");
		System.out.println(categories.size());
		modelAndView.addObject("categories",categories);
		return modelAndView;
	}
    //添加商品
	@RequestMapping("/saveGoods")
	public String saveGoods(Goods goods,Integer categoryId,HttpServletRequest request,@RequestParam MultipartFile[] pics){
		String path=null;
		try {
			path="D:\\upfilesForBS\\goods\\";
			String random=UUID.randomUUID().toString();
			path=path+getUserID(request)+"\\"+random+"\\";
			savePics(pics, path);
			goods.setCoverPic(1+FileSaveUtils.getSuffixName(pics[0]));
			goods.setPicturePath(getUserID(request)+"/"+random);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(goods.toString()+"categoryId:"+categoryId);
		boolean saveRes=goodsService.saveGoods(goods,getUserID(request),categoryId);
		if(!saveRes){
			/*modelAndView.addObject("failInfo","商品上架異常！");*/
		}
		return "redirect:/goods/showOwnerGoods.action?auditState=0&userId="+getUserID(request);
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
	
	
	//保存图片
	private void savePics(MultipartFile[] pics,String path) throws IllegalStateException, IOException {
		int i=1;
		for (MultipartFile pic : pics) {
			File saveFile = FileSaveUtils.saveFile(pic,path,i+"");
			//保存缩略图片
			FileSaveUtils.saveThumbnailFile(saveFile, path+"\\thumbnail\\", saveFile.getName());
			i++;
        }
	}
	
	
	private Integer getUserID(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
		   return user.getId();
		}
		return null;
	}	
}



