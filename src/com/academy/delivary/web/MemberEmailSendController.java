package com.academy.delivary.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.common.EmailService;
import com.academy.delivery.service.MemberDto;
import com.academy.delivery.service.MemberService;
import com.academy.delivery.service.impl.MemberServiceImpl;

public class MemberEmailSendController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EmailService	emailService	= new EmailService();
		MemberService	memberService	= new MemberServiceImpl();
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");

		List<MemberDto> emailMember		= memberService.selectAgreeEmail();
		int				sendTotal		= emailMember.size();
		int				count			= 0;
		
		PrintWriter out = resp.getWriter();
		out.println("<script>");
		out.println("document.getElementById('mailtext').innerHTML = '메일 전송 진행 중..';");
		out.println("var progressBar = document.getElementById('sendmail');");
		for (MemberDto member : emailMember) {
			emailService.send(member.getMember_name(), member.getMember_email(),
							  req.getParameter("title"), req.getParameter("content").replace("\r\n", "<br>"));
			count++;
			out.println("progressBar.data-value = " + (int) ((double) count / sendTotal));
			System.out.println("보내졌습니다.");
		}
		
		System.out.println("한번 확인해봅시다. 잘 갔는지.");
		out.println("document.getElementById('mailtext').innerHTML = '메일 전송 완료!';");
		out.println("progressBar.data-value = 100");

		out.println("alert('메일 전송이 완료되었습니다.');");
		out.println("self.close();");
		out.println("</script>");
	}

}
