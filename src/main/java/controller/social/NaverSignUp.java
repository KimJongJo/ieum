package controller.social;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.FileDto;
import dto.MemberDto;
import dto.otherDto.KakaoMemberDto;
import dto.otherDto.NaverMemberDto;
import service.file.FileService;
import service.file.FileServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class KakaoSignUp
 */
@WebServlet("/social/naverSignUp")
public class NaverSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/common/join/joinNaver.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userName = request.getParameter("userName");
		String nickname = request.getParameter("nickName");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("addressDetail");
		String address = address1 + " " + address2;
		HttpSession session = request.getSession();
		NaverMemberDto naverDto = (NaverMemberDto)session.getAttribute("naverDto");
		String id = naverDto.getId();
		String profile = naverDto.getProfile();
		MemberService memberService = new MemberServiceImpl();
		FileService fileService = new FileServiceImpl();
		FileDto file = new FileDto(profile, "img\\userProfile\\", "userProfile");
		Integer fileNo = fileService.normalImg(file);
		
		String social = "Naver";
		
		String diary = request.getParameter("diary");
		boolean diarYN = diary.equals("yes") ? true : false;
		
	        // java.sql.Date.valueOf()를 사용하면 yyyy-MM-dd 형식의 문자열을 바로 변환 가능
        Date sqlDate = Date.valueOf(naverDto.getBirthDate());
		
		MemberDto member = new MemberDto(id, userName, sqlDate, naverDto.getGender(),
				naverDto.getTel(), email, nickname, address, diarYN, social, fileNo);
		
		Integer uNo = memberService.socialSignUp(member);
		
		session.setAttribute("uNo", uNo);
		
		response.sendRedirect(request.getContextPath() + "/index");
		
		
	}

}
