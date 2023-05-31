package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.tb_storeDAO;
import com.smhrd.model.tb_storeDTO;

@WebServlet("/SelectLatLng")
public class SelectLatLng extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		tb_storeDTO dto = new tb_storeDTO(lat, lng);
		tb_storeDAO dao = new tb_storeDAO();
		List<tb_storeDTO> store_list = dao.selectStore(dto);
		JsonArray arrayObj = new JsonArray();
		
		for(int i = 0; i < store_list.size(); i++) {
			Double shop_idx = store_list.get(i).getShop_idx();
			String shop_name = store_list.get(i).getShop_name();
			String shop_addr = store_list.get(i).getShop_addr();
			String shop_tel = store_list.get(i).getShop_tel();
			String shop_business = store_list.get(i).getShop_business();
			String shop_items = store_list.get(i).getShop_items();
			String shop_delivery = store_list.get(i).getShop_delivery();
			String shop_img = store_list.get(i).getShop_img();
			String shop_parking = store_list.get(i).getShop_parking();
			Double shop_lat = store_list.get(i).getLat();
			Double shop_lng = store_list.get(i).getLng();
			
			JsonObject obj = new JsonObject();
			obj.addProperty("shop_idx", shop_idx);
			obj.addProperty("shop_name", shop_name);
			obj.addProperty("shop_addr", shop_addr);
			obj.addProperty("shop_tel", shop_tel);
			obj.addProperty("shop_business", shop_business);
			obj.addProperty("shop_items", shop_items);
			obj.addProperty("shop_delivery", shop_delivery);
			obj.addProperty("shop_img", shop_img);
			obj.addProperty("shop_parking", shop_parking);
			obj.addProperty("lat", shop_lat);
			obj.addProperty("lng", shop_lng);
			
			arrayObj.add(obj);
		}
		
		response.getWriter().print(arrayObj);
	}

}
