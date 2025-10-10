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
import dto.otherDto.GoogleMemberDto;
import dto.otherDto.NaverMemberDto;
import service.social.GoogleService;
import service.social.GoogleServiceImpl;

/**
 * Servlet implementation class GoogleLogin
 */
@WebServlet("/social/google")
public class GoogleLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoogleLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		
		Properties prop = new Properties();
		String clientId = "";
		String clientSecret = "";
		String redirectUrl="";
		try(InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
		    prop.load(is);
		    clientId = prop.getProperty("google.api.id");
		    clientSecret = prop.getProperty("google.api.secret");
		    redirectUrl = prop.getProperty("google.api.redirectUrl");
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		GoogleService googleService = new GoogleServiceImpl();
		String token;
		
		try {
			token = googleService.getAccessToken(clientId, clientSecret, code, redirectUrl);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("구글 토큰 요청중 에러 발생");
			token = null;
		}
		
		// 서비스에서 토큰 조회할때 가져온 id로 db를 조회
		
		HttpSession session = request.getSession();
		GoogleMemberDto googleDto = null;
		
		try {
			googleDto = googleService.getMemberDto(token);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("구글 로그인중 오류 발생");
		}
		MemberDto member = googleService.emailCheck(googleDto.getEmail());
			
		// member 객체가 있을때
		if(googleDto.getMemberDto() != null) {
			session.setAttribute("uNo", googleDto.getMemberDto().getuNo());
			response.sendRedirect(request.getContextPath() + "/index");
		}else if(member != null) { // member 객체가 없지만 이미 기존 계정과 naver 소셜 계정을 병합한 계정인가? 
			
			// 만약에 이미 병합한 계정이라면
			if(member.getSocialId() != null && member.getSocialId().equals(googleDto.getId())) {
				session.setAttribute("userType", member.getUserType());
				session.setAttribute("uNo", member.getuNo());
				response.sendRedirect(request.getContextPath() + "/index");
			}else { // 아니라면 병합을 묻는 페이지로 이동
				session.setAttribute("googleDto", googleDto);
				response.sendRedirect(request.getContextPath() + "/social/googleAlreadyEmail");
			}
			
			
		}else { // member 객체도 없고, 병합하지도 않았고, 이메일도 겹치지 않는다면 회원가입으로 진행
			session.setAttribute("googleDto",googleDto);
			// 새로운 카카오 회원가입 페이지로 이동
			response.sendRedirect("googleSignUp");
		}
		
	}

}
