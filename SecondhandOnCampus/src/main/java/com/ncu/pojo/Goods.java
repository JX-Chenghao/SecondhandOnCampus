package com.ncu.pojo;

import java.util.Date;

public class Goods {
    private Integer id;

    private String name;

    private String picture;

    private Integer quantity;

    private Double price;

    private Integer usedMonth;

    private Date publishDate;

    private Date goodsState;

    private Integer auditState;

    private Integer userId;

    private Integer categoryId;

    private String introducedText;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getUsedMonth() {
        return usedMonth;
    }

    public void setUsedMonth(Integer usedMonth) {
        this.usedMonth = usedMonth;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getGoodsState() {
        return goodsState;
    }

    public void setGoodsState(Date goodsState) {
        this.goodsState = goodsState;
    }

    public Integer getAuditState() {
        return auditState;
    }

    public void setAuditState(Integer auditState) {
        this.auditState = auditState;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getIntroducedText() {
        return introducedText;
    }

    public void setIntroducedText(String introducedText) {
        this.introducedText = introducedText == null ? null : introducedText.trim();
    }
}