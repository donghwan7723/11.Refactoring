package com.model2.mvc.service.domain;




public class Brand {
 	//Field
	private String brandId;	
	private String brandName;

 	//constructor
	public Brand() {
	}
	
	//method
	public String getBrandId() {
		return brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String toString() {
		return "Brand [brandId=" + brandId + ", brandName=" + brandName + "]";
	}	
	


	
}