package com.academy.delivary.web;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.academy.delivery.common.EmailService;
import com.academy.delivery.service.MemberDto;
import com.academy.delivery.service.MemberService;
import com.academy.delivery.service.impl.MemberServiceImpl;

public class MemberEmailSendController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EmailService	emailService	= new EmailService();
		MemberService	memberService	= new MemberServiceImpl();
		
		List<MemberDto> emailMember		= memberService.selectAgreeEmail();
		int				count			= 0;

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		// json 파일에 메일 전송 개수 기록
		JSONObject 	object			= new JSONObject();
		for (MemberDto member : emailMember) {
			emailService.send(member.getMember_name(), member.getMember_email(),
							  req.getParameter("title"), req.getParameter("content").replace("\r\n", "<br>"));
			count++;
			setJsonObject(object, emailMember.size(), count);

			// 계속 갱신되어야 하므로 하나 보내질 때 마다 파일을 계속 열고 닫는다.
			String		fileName	= req.getServletContext().getRealPath("/admin/member/json/") + "sendState.json";
			FileWriter	fw		= new FileWriter(fileName);
			fw.write(object.toJSONString());
			fw.flush();
			fw.close();
			System.out.println("보내졌습니다.");
		}
		
		System.out.println("한번 확인해봅시다. 잘 갔는지.");
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		PrintWriter out = resp.getWriter();
		out.println("<script>");
		out.println("alert('메일 전송이 완료되었습니다.');");
		out.println("self.close();");
		out.println("</script>");
}
	
	private void setJsonObject(JSONObject object, int total, int complete) {
		object.put("total", total);
		object.put("complete", complete);
	}

}
