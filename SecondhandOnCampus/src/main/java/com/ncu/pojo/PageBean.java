package com.ncu.pojo;

import java.util.List;

public class PageBean<T> {
	private int currPage;  // 当前页面
	private int pageSize;  // 页面大小
	private int totalCount;// 总数
	private int totalPage; // 总页面
	private List<T> list;  // 项集合

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		
		String str= "PageBean [currPage=" + currPage + ", pageSize=" + pageSize
				+ ", totalCount=" + totalCount + ", totalPage=" + totalPage
				+ ", list=< /n" ;
        for(T t : list)
        	str+=t.toString();
        str+= ">]";
        return str;
	}

    /**
     * 计算总页数  静态方法
     * @param pageSize  每页的记录数
     * @param allRow  总记录数
     * @return 总页数
     */
    public static int countTatalPage(final int pageSize,final int allRow){
    int toalPage = allRow % pageSize == 0 ? allRow/pageSize : allRow/pageSize + 1;
    return toalPage;
    }
    /**
     * 计算当前页开始的记录
     * @param pageSize 每页记录数
     * @param currentPage 当前第几页
     * @return 当前页开始记录号
     */
    public static int countOffset(final int pageSize,final int currentPage){
    final int offset = pageSize * (currentPage - 1);
    return offset;
    }
    /**
     * 计算当前页，若为0或者请求的URL中没有“?page = ”则用1代替
     * @param page 传入的参数（可能为空，即0  则返回1）
     * @return
     */
    public static int countCurrentPage(int page){
        final int curpage = (page == 0 ? 1 : page);
        return curpage;
    }
}
