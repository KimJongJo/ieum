package controller.social;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.FileDto;
import dto.MemberDto;
import dto.otherDto.KakaoMemberDto;
import service.file.FileService;
import service.file.FileServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class KakaoSignUp
 */
@WebServlet("/social/kakaoSignUp")
public class KakaoSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/common/join/joinKakao.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userName = request.getParameter("userName");
		String nickname = request.getParameter("nickName");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String gender1 = request.getParameter("gender");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("addressDetail");
		String address = address1 + " " + address2;
		HttpSession session = request.getSession();
		KakaoMemberDto kakaoDto = (KakaoMemberDto) session.getAttribute("kakaoDto");
		
		String id = kakaoDto.getId();
		String profile = kakaoDto.getProfile();
		MemberService memberService = new MemberServiceImpl(request.getServletContext());
		
		// 타사에서 받은 프로필 이미지를 다운로드 하고 다른 이름으로 저장
		profile = memberService.profileDown(id, profile);
		
		FileService fileService = new FileServiceImpl();
		FileDto file = new FileDto(profile, "img\\userProfile\\", "userProfile");
		Integer fileNo = fileService.normalImg(file);
		
		String gender = "M".equals(gender1) ? "MALE" : "FEMALE";
		
		// 생년월일 중 월과 일이 한자리면 앞에 0 추가 // 1 -> 01
		if(month.length() == 1) month = "0" + month;
		if(day.length() == 1) day = "0" + day;
		Date birthDate = Date.valueOf(year + "-" + month + "-" + day);
		
		// 전화번호 조립
		String tel = "010-" + tel1 + "-" + tel2;
		String diary = request.getParameter("diary");
		boolean diarYN = diary.equals("yes") ? true : false;
		
		MemberDto member = new MemberDto(id, userName, birthDate, gender, tel, email,
				nickname, address, diarYN, fileNo);
		
		Integer uNo = memberService.socialSignUp(member);
		session.setAttribute("uNo", uNo);
		
		response.sendRedirect(request.getContextPath() + "/index");
		
		
	}

}
