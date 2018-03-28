package com.ncu.pojo.vo;

import com.ncu.pojo.Order;
import com.ncu.pojo.Orderitem;

import java.util.List;

public class OrderVO {
    private Order order;
    private List<Orderitem> orderitems;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<Orderitem> getOrderitems() {
        return orderitems;
    }

    public void setOrderitems(List<Orderitem> orderitems) {
        this.orderitems = orderitems;
    }
}
