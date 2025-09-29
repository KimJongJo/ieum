package controller.common.join;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import service.auth.PassAuthService;
import service.auth.PassAuthServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/signUp1")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String userName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String gender = request.getParameter("gender");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String[] emailArr = (String[])session.getAttribute("email");
		String email = emailArr[0] + "@" + emailArr[1];
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		
		// 생년월일 중 월과 일이 한자리면 앞에 0 추가 // 1 -> 01
		if(month.length() == 1) month = "0" + month;
		if(day.length() == 1) day = "0" + day;
		Date birthDate = Date.valueOf(year + "-" + month + "-" + day);
		
		// 비밀번호 암호화
		PassAuthService passService = new PassAuthServiceImpl();
		String password = passService.securityPw(userPw);
		
		// 성별에 맞는 Enum으로 바꾸기
		if(gender.equals("M")) {
			gender = "MALE";
		}else {
			gender = "FEMALE";
		}
		
		// 전화번호 조립
		String tel = "010-" + tel1 + "-" + tel2;
		
		// 주소 조립
		String add = address + " " + addressDetail;
		
		String diaryCheck = (String)session.getAttribute("diaryPrivate");
		boolean diaryPrivate;
		if(diaryCheck.equals("yes")) {
			diaryPrivate = true;
		}else {
			diaryPrivate = false;
		}
		
		// member 조립
		MemberDto member = new MemberDto(userId, userName,birthDate, password, gender, tel, email, nickName, add, diaryPrivate);
		MemberService memberService = new MemberServiceImpl();
		
		memberService.normalJoin(member);
		
		session.removeAttribute("email");
		session.removeAttribute("userType");
		session.removeAttribute("diaryPrivate");
		
		response.sendRedirect("join5");
		
	}

}
