package com.model2.mvc.service.parts;


import java.util.List;
import java.util.Map;

import com.model2.mvc.service.domain.Parts;

 
public interface PartsService {

	public void addParts(Parts parts) throws Exception;

	public List<Parts> getParts(Parts parts) throws Exception;
	
	public int getPartsPrice(String PartsName) throws Exception;
}