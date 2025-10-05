package controller.social;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.otherDto.NaverMemberDto;
import service.social.NaverService;
import service.social.NaverServiceImpl;

/**
 * Servlet implementation class NaverLogin
 */
@WebServlet("/social/naver")
public class NaverLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		String state = request.getParameter("stage");
		
		Properties prop = new Properties();
		String clientId = "";
		String clientSecret = "";
		try(InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
		    prop.load(is);
		    clientId = prop.getProperty("naver.api.id");
		    clientSecret = prop.getProperty("naver.api.secret");
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		NaverService naverService = new NaverServiceImpl();
		String token;
		
		try {
			token = naverService.getAccessToken(clientId, clientSecret, code, state);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("네이버 토큰 요청중 에러 발생");
			token = null;
		}
		
			// 서비스에서 토큰 조회할때 가져온 id로 db를 조회
			
		HttpSession session = request.getSession();
		NaverMemberDto naverDto = null;
		
		try {
			naverDto = naverService.getMemberDto(token);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("네이버 로그인중 오류 발생");
		}
		MemberDto member = naverService.emailCheck(naverDto.getEmail());
			
		// member 객체가 있을때
		if(naverDto.getMemberDto() != null) {
			session.setAttribute("hNo", naverDto.getMemberDto().getuNo());
			response.sendRedirect(request.getContextPath() + "/index");
		}else if(member != null) { // member 객체가 없지만 이미 기존 계정과 naver 소셜 계정을 병합한 계정인가? 
			
			// 만약에 이미 병합한 계정이라면
			if(member.getSocialId() != null && member.getSocialId().equals(naverDto.getId())) {
				session.setAttribute("uNo", member.getuNo());
				response.sendRedirect(request.getContextPath() + "/index");
			}else { // 아니라면 병합을 묻는 페이지로 이동
				session.setAttribute("naverDto", naverDto);
				response.sendRedirect(request.getContextPath() + "/social/naverAlreadyEmail");
			}
			
			
		}else { // member 객체도 없고, 병합하지도 않았고, 이메일도 겹치지 않는다면 회원가입으로 진행
			session.setAttribute("naverDto",naverDto);
			// 새로운 카카오 회원가입 페이지로 이동
			response.sendRedirect("naverSignUp");
		}
			
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
