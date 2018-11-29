package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Brand;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

//==> ��ǰ���� Controller
@Controller
@RequestMapping("/product/*")
public class ProductController{
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
		int pageUnit;	
	
	@Value("#{commonProperties['pageSize']}")
		int pageSize;
	
	@RequestMapping(value = "addProduct", method=RequestMethod.POST)
	public String addProduct (@ModelAttribute("product") Product product, @ModelAttribute("brand") Brand brand,
							  @RequestParam("originalFileName") MultipartFile file) throws Exception {
		
		
		String path = "C:\\Users\\bit\\git\\11.Refactoring\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
		String originalFileName = file.getOriginalFilename();
		System.out.println(originalFileName);
		File uploadFile = new File(path, originalFileName);
		file.transferTo(uploadFile);

		product.setBrandIden(brand);
		product.setFileName(originalFileName);
		
		//Business Logic
		productService.addProduct(product);

		return "forward:/product/addProduct.jsp";
	}
		
	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("����� productController listProduct");
		System.out.println("search.getCurrentPage() : "+search.getCurrentPage());
	
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		
		//Business Logic ����
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		//Model�� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println("����� productController listProduct ������");
		System.out.println("search : "+search);
		return "forward:/product/listProduct.jsp";
	}
	
		@RequestMapping(value="getProduct", method=RequestMethod.GET)
		public String getProduct (@ModelAttribute("product") Product product, 
								  @RequestParam("prodNo") String CookieprodNo, @RequestParam("prodNo") int prodNo,
								  Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		

		product = productService.getProduct(prodNo);
		System.out.println(product);
		model.addAttribute("product", product);
		
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0) {
			System.out.println("���� Cookie �̿�");
		  for(int i=0;i<cookies.length;i++) {	
			  Cookie cookie = cookies[i];
			if(cookie.getName().equals("history")) {
				cookie.setValue(cookie.getValue()+","+CookieprodNo);
				cookie.setPath("/");
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);
			}else{
			System.out.println("Cookie ù ����");
			cookie = new Cookie("history",CookieprodNo);
			cookie.setMaxAge(60*60);
			cookie.setPath("/");
			response.addCookie(cookie);
			}
		  }
		}
		System.out.println("getProduct ��");
		
		return "forward:/product/getProduct.jsp"; 
	}
		
		@RequestMapping(value="updateProductView", method=RequestMethod.GET)
		public String updateProductView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
			
			System.out.println("����� productController updateProductView");
			
			Product product = productService.getProduct(prodNo);
			
			model.addAttribute("product", product);
		
			return "forward:/product/updateProductView.jsp";
		}
		
		@RequestMapping(value="updateProduct", method=RequestMethod.POST)
		public String updateProduct(@ModelAttribute("product") Product product, @ModelAttribute("brand") Brand brand,  
								    @RequestParam("originalFileName") MultipartFile file , @RequestParam("menu") String menu) throws Exception {
			
		
			
			String path = "C:\\Users\\bit\\git\\11.Refactoring\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
			
			String originalFileName = file.getOriginalFilename();
			
			File uploadFile = new File(path, originalFileName);
			file.transferTo(uploadFile);
			
			
			product.setBrandIden(brand);
			product.setFileName(originalFileName);
					
			productService.updateProduct(product);
			
		
			return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu="+menu;
		}
		
		@RequestMapping(value="inventoryManage", method=RequestMethod.GET)
		public void inventoryManage(@RequestParam int count) throws Exception{
			
		
		}



}
