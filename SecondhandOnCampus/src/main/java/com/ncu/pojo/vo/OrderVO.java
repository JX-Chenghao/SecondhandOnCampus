package com.ncu.pojo.vo;

import com.ncu.pojo.Order;
import com.ncu.pojo.Orderitem;

import java.util.ArrayList;
import java.util.List;

public class OrderVO {
    private Order order;
    private List<OrderitemVO> orderitemVOs=new ArrayList<OrderitemVO>();
    private String cropName;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
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
    
}
