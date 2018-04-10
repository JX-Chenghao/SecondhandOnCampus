package com.ncu.pojo.vo;

import java.util.ArrayList;
import java.util.List;

import com.ncu.pojo.Category;

public class CategoryVO {
	private Category firstCategory;
	private List<Category> secondCategories = new ArrayList<Category>();

	public Category getFirstCategory() {
		return firstCategory;
	}

	public void setFirstCategory(Category firstCategory) {
		this.firstCategory = firstCategory;
	}

	public List<Category> getSecondCategories() {
		return secondCategories;
	}

	public void setSecondCategories(List<Category> secondCategories) {
		this.secondCategories = secondCategories;
	}

}
