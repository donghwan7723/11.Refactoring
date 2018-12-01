package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="json/addPurchase", method=RequestMethod.POST)
	public void addPurchase(@RequestBody Purchase purchase) throws Exception {
		System.out.println(purchase);
		purchaseService.addPurchase(purchase);
		
	}
	
	@RequestMapping(value="json/addPurchase/{prodNo}", method=RequestMethod.GET)
	public Product addPurchase(@PathVariable int prodNo) throws Exception {
	
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase(@PathVariable int tranNo) throws Exception{
		System.out.println(tranNo);
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value="json/updatePurchase", method=RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase) throws Exception{

		purchaseService.updatePurchase(purchase);
		purchase.setTranNo(purchase.getTranNo());
		
		return purchaseService.getPurchase(purchase.getTranNo());
	}
	
	@RequestMapping(value="json/updateTrancode/{tranNo}/{tranCode}", method=RequestMethod.GET)
	public Purchase updateTranCode(@PathVariable int tranNo, @PathVariable String tranCode) throws Exception{
		
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		purchase.setTranCode(tranCode);
		
		purchaseService.updateTranCode(purchase);
	
		return purchaseService.getPurchase(tranNo);
	}
	@RequestMapping(value="json/updateTranCodeBy/{prodNo}/{tranCode}", method=RequestMethod.GET)
	public Purchase updateTranCodeBy(@PathVariable int prodNo, @PathVariable String tranCode) throws Exception{
	
		
	 Product product = productService.getProduct(prodNo);
	 Purchase purchase = new Purchase();
	 purchase.setTranCode(tranCode);
	 purchase.setPurchaseProd(product);
	 
	 System.out.println(purchase);
	 purchaseService.updateTranCode(purchase);
	 
	 return purchase;
	 
	}
	
	@RequestMapping(value="json/listPurchase", method=RequestMethod.POST)
	public Map listPurchase(@RequestBody(required=false) Search search) throws Exception{


		Purchase purchase = new Purchase();

		User user = new User();
		user.setUserId("user02");
		purchase.setBuyer(user);
				
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		System.out.println(search);
		
		Map<String, Object> map = purchaseService.getPurchaseList(search, purchase.getBuyer().getUserId());
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
									pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
	}
	
	@RequestMapping(value="json/listPurchase", method=RequestMethod.GET)
	public Map listPurchase() throws Exception{
		
		Purchase purchase = new Purchase();

		User user = new User();
		user.setUserId("user02");
		purchase.setBuyer(user);
		
		Search search = new Search();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		System.out.println(search);
		
		Map<String, Object> map = purchaseService.getPurchaseList(search, purchase.getBuyer().getUserId());
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
									pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
		
	}
		
}
