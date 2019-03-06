package com.devdh.shopping.commons.paging;

public class ProductCriteria {

	private String cateCd;
	private String sort;
	private int page;
    private int pageNum;
    private String keyword;

    public ProductCriteria() {
        this.page = 1;
        this.pageNum = 20;
    }

    public void setPage(String page) {

    	// 기본적으로 숫자로만 받아야 하는데 문자, 문자열을 받을 경우 400에러가 발생하므로
    	// 방지차원에서 String으로 받고 숫자 타입 검사
    	
    	// 숫자인지 체크
    	if(page.matches("^[0-9]*$")) {
    		this.page = Integer.parseInt(page);
    	} else {
    		// 숫자가 아니면 1로 초기화
    		this.page = 1;
    	}
    	// 0보다 작거나 같으면 1로 초기화
        if (this.page <= 0) {
            this.page = 1;
            return;
        }
    }

    public int getPage() {
        return page;
    }

    public void setPageNum(String pageNum) {

    	int typeCheckPageNum = 0;
    	
    	if(pageNum.matches("^[0-9]*$")) {
    		typeCheckPageNum = Integer.parseInt(pageNum);
    	}
    	
        if (typeCheckPageNum <= 0 || typeCheckPageNum > 100) {
            this.pageNum = 20;
            return;
        }

        this.pageNum = typeCheckPageNum;
    }

    public int getPageNum() {
        return this.pageNum;
    }

    public int getPageStart() {
        return (this.page - 1) * pageNum;
    }

	public String getCateCd() {
		return cateCd;
	}

	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
