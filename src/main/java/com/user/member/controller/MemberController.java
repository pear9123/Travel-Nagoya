package com.user.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.member.service.MemberService;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService MEMBERSERVICE;
	
	/* LOGIN FORM VIEW */
	@RequestMapping("/LoginForm.do")
	public String LoginForm() {
		
		return "member/Login";
	}
	
	/* LOGIN RESULT */
	@RequestMapping(value = "/LoginResult.do")
	public String LoginResult(SecurityContextHolderAwareRequestWrapper request) {
	logger.info("=====MemberController ComeIn=====");
	/* View 정보를 반환하는 부분 */
	/*로그인한 계정의 Roll이 ROLE_ADMIN이면 영역로 이동*/
	String result= "";
		if (request.isUserInRole("ROLE_ADMIN")) {
			result = "redirect:BlogMain.do";
		} else {
			result = "redirect:BlogMain.do";
		}
	return result;
	}
	
	/* LOGIN FAIL */
	@RequestMapping("/LoginFail.do")
	public String LoginFail() {
		
		return "member/LoginFail";
	}
	
	/* LOGOUT */
	@RequestMapping("/LogoutForm.do")
	public String LogoutForm() {
		
		return "home";
	}
	
	/* JOIN */
	@RequestMapping("/Join.do")
	public String Join() {
		
		return "member/join"; 
	}
	
	/* JOIN PROC */
	@RequestMapping("/JoinProc.do")
	public String JoinProc(@RequestParam HashMap<String, Object> map, Model model) throws Exception {
		
		// map 으로 파라미터 받음
		System.out.println("map id : "+map.get("input_id"));
		System.out.println("map efname : "+map.get("input_eng_firstname"));
		System.out.println("map elname : "+map.get("input_eng_lastname"));
		System.out.println("map password : "+map.get("input_password_result"));
		System.out.println("map korname : "+map.get("input_kor_name"));
		System.out.println("map email : "+map.get("input_email"));
		String recive_mail = (String)map.get("input_email"); 
		
		// 영문 이름 조합
		String Efirst = (String)map.get("input_eng_firstname");
		String Elast = (String)map.get("input_eng_lastname");
		String eng_name = Efirst+""+Elast;
		map.put("eng_name", eng_name);
		
		// 메일 인증 8자리 난수 발생
		Random ran = new Random();
		StringBuffer buf = new StringBuffer();
		for(int i=0; i<9; i++) {
			if(ran.nextBoolean()) {
				buf.append((char)((int)(ran.nextInt(26))+97));
			} else {
				buf.append((ran.nextInt(10)));
			}
		}
		System.out.println("8자리 난수 : "+buf.toString());
		String input_random = buf.toString();
		map.put("input_random",input_random);
		map.put("input_authority","N");
		map.put("input_enabled",99);
		
		MEMBERSERVICE.insertjointemp(map);
		
		// 메일 발송
		String host = "smtp.gmail.com";
		final String username = "ID";
		final String password = "PW";
		int port = 465;
		String charSet = "UTF-8";
		
		// 메일 내용
		String recipient = recive_mail; // 수신인
		String subject = "[흥청망청 계모임] 회원가입 승인 메일입니다.";
		String body = "<html>\n"
				+ "<body>\n"
				+ "\n"
				+ "아래 버튼을 눌러주시면 정상적으로 가입이 완료됩니다.\n"
				+ "<a href=\"http://192.168.0.10:8080/JoinComplete.do?cert_key="+input_random
				+ "\">\n"
				+ "<h1>가입완료</h1></a>\n"
				+ "\n"
				+ "</body>\n"
				+ "</html>";
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성
		
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		//session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //debug
		
		Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("EMAIL")); // 발신인 셋팅
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신인 셋팅
		mimeMessage.setSubject(subject); // 제목 셋팅
		
		// 이메일 헤더
//		mimeMessage.setHeader("content-Type", "text/html");
//		mimeMessage.setText(body); // 내용 셋팅
		mimeMessage.setContent(body, "text/html; charset=UTF-8");
		Transport.send(mimeMessage); // 전송
		
		model.addAttribute("result", "waitmember");
//		return "redirect:/LoginForm.do";
		return "member/joinresult";
	}
	
	@RequestMapping("/JoinComplete.do")
	public String JoinComplete(HttpServletRequest request, Model model) throws Exception {
		String cert_key = request.getParameter("cert_key");
		Map<String, Object> map = MEMBERSERVICE.selecttempmember(cert_key);
		int enabled = (Integer)map.get("ENABLED");
		String id = (String)map.get("EMAIL");
		
		if(enabled == 99) {
			MEMBERSERVICE.updatetruemember(id);
			model.addAttribute("result", "complete");
		} else {
			model.addAttribute("result", "fail");
		}
		return "member/joinresult";
	}

}
