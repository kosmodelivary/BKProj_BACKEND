package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreDeliveryServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreDeliveryUseableController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 배달한 딜리버리 (store_delivery) - delivery_useable을 true 또는 false로 설정
		// - true: 배달중 아님 (배달 끝)
		//   배달 끝이면 delivery 테이블에 완료된 주문 추가 (작업 필요)
		// - false: 배달중
		JSONObject 				object;
		JSONParser				parser			= new JSONParser();
		StoreDeliveryService	deliveryService	= new StoreDeliveryServiceImpl();

		req.setCharacterEncoding("UTF-8");

		try {
			if (req.getParameter("PostData") != null) {
				object = (JSONObject) parser.parse(req.getParameter("PostData"));

				if (object != null) {
					System.out.println(object.get("useable").toString());
					
					// 딜리버리 배달 상태 변경
					StoreDeliveryDto	dto	= new StoreDeliveryDto();
					
					dto.setDelivery_useable(object.get("useable").toString());
					dto.setDelivery_no(object.get("deliveryNo").toString());
					deliveryService.update(dto);

					// 배달 끝나서 해당 딜리버리 사용 가능하게 되었다면
					if (object.get("useable").toString().equals("true")) {
						// 배달 종료될 때만 주문 번호가 들어오므로
						if (object.get("order_no") != null) {
							deliveryService.updateDeliveryComplete(object.get("order_no").toString());
						}
					} // if if (object.get("useable").toString().equals("true")) 
				} // if (object != null) 
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
}
