package com.ncu.pojo.vo;

import com.ncu.pojo.Order;
import com.ncu.pojo.Orderitem;

import java.util.ArrayList;
import java.util.List;

public class OrderVO {
    private Order order;
    private List<OrderitemVO> orderitemVOs=new ArrayList<OrderitemVO>();
    private String cropName;
    private String evaluateContent;
    
    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
    

	public String getEvaluateContent() {
		return evaluateContent;
	}

	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}

	public List<OrderitemVO> getOrderitemVOs() {
		return orderitemVOs;
	}

	public void setOrderitemVOs(List<OrderitemVO> orderitemVOs) {
		this.orderitemVOs = orderitemVOs;
	}

	public String getCropName() {
		return cropName;
	}

	public void setCropName(String cropName) {
		this.cropName = cropName;
	}

	@Override
	public String toString() {
		return "OrderVO [order=" + order + ", orderitemVOs=" + orderitemVOs
				+ ", cropName=" + cropName + "]";
	}
    
}
