package com.academy.delivery.common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailService {

	private String mailProtocol = "smtp";
	private String mailHost = "smtp.gmail.com";
	private String mailPort = "587";
	private String mailId = "javamurger@gmail.com"; // 구글계정
	private String mailPassword = "qjrjzld123"; // 구글계정 비밀번호 
	private String fromName = "자바머거 (Java Murger)";
	private String fromEmail = "javamurger@gmail.com"; // 보내는 사람 메일

	private String debugMode = "false";
	private String authMode = "true";

	public void send(String toName, String toEmail, String mailTitle, String mailContents) {
		try {
			boolean debug = Boolean.valueOf(debugMode).booleanValue();

			Properties mailProps = new Properties();
			mailProps.put("mail.smtp.starttls.enable", "true");
			mailProps.setProperty("mail.transport.protocol", mailProtocol); 
			mailProps.put("mail.debug", debugMode);
			mailProps.put("mail.smtp.host", mailHost);
			mailProps.put("mail.smtp.port", mailPort);
			mailProps.put("mail.smtp.connectiontimeout", "5000");
			mailProps.put("mail.smtp.timeout", "5000");  
			mailProps.put("mail.smtp.auth", authMode);

			Session msgSession = null;

			if(authMode.equals("true")) {
		       Authenticator auth = new MyAuthentication(mailId, mailPassword);
		       msgSession = Session.getInstance(mailProps, auth);
			} else {
				msgSession = Session.getInstance(mailProps, null); 
			}

			msgSession.setDebug(debug);

			MimeMessage msg = new MimeMessage(msgSession);
			msg.setFrom(new InternetAddress(fromEmail, fromName));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));
			msg.setSubject(mailTitle);
			msg.setContent(mailContents, "text/html; charset=UTF-8");

			// 스태틱함수로 직접 보내지 않고 객체를 이용해서 보내고 객체를 닫아준다. 
			Transport t = msgSession.getTransport(mailProtocol);
			try {
				t.connect();
				t.sendMessage(msg, msg.getAllRecipients());
			} finally {
				t.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // send
	
	class MyAuthentication extends Authenticator {
	    PasswordAuthentication pa;

	    public MyAuthentication(String mailId, String mailPass) {
	        pa = new PasswordAuthentication(mailId, mailPass);  
	    }

	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	} // MyAuthentication

} // EmailService
