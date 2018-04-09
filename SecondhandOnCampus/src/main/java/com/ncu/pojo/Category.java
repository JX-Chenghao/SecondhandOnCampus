package com.ncu.pojo;

public class Category {
	/*还得添一个字段 来成为多级目
	 *添加商品处 还要多级联动的select
	 * 录*/
    private Integer id;

    private String name;

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

    public String getIntroducedText() {
        return introducedText;
    }

    public void setIntroducedText(String introducedText) {
        this.introducedText = introducedText == null ? null : introducedText.trim();
    }
}