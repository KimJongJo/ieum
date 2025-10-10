package controller.common.login;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.MemberDto;
import dto.otherDto.ResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Servlet
		Properties prop = new Properties();
		try(InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
		    prop.load(is);
		    String kakaoKey = prop.getProperty("kakao.api.key");
		    String kakaoRedirectUrl = prop.getProperty("kakao.api.redirectUrl");
		    String naverClientId = prop.getProperty("naver.api.id");
		    String naverRedirectUrl = prop.getProperty("naver.api.redirectUrl");
		    String googleId = prop.getProperty("google.api.id");
		    String googleRedirectUrl = prop.getProperty("google.api.redirectUrl");
		    request.setAttribute("kakaoKey", kakaoKey);
		    request.setAttribute("kakaoRedirectUrl", kakaoRedirectUrl);
		    request.setAttribute("naverClientId", naverClientId);
		    request.setAttribute("naverRedirectUrl", naverRedirectUrl);
		    request.setAttribute("state", "aB3dE9fGh12IjK45fes"); // -> 그냥 아무거나 막 친거임
		    request.setAttribute("googleId", googleId);
		    request.setAttribute("googleRedirectUrl", googleRedirectUrl);
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		request.getRequestDispatcher("/common/login/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session;
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPw");
		String rememberId = request.getParameter("rememberId");
		
		MemberService service = new MemberServiceImpl();
		
		// 0 - 존재하지않는 계정, 1 - 비밀번호 틀림, 2 - 로그인
		int userNo = service.login(userId, password);
		
		Gson gson = new Gson();
		String result;
		ResponseDto resDto;
		if(userNo == 0) { // 존재하지 않을때
			resDto = new ResponseDto(false, "아이디가 존재하지 않습니다.");
		}else if(userNo == -1) {
			resDto = new ResponseDto(false, "비밀번호가 틀립니다.");
		}else {
			// 로그인 성공시 세션에 정보를 저장, 아이디 저장을 체크했을때 쿠키생성
			// 쿠키 시간은 7일정도로 지정
			
			session = request.getSession();
			MemberDto member = service.selectUserByNo(userNo);
			
			if(member.getUserType().equals("DOCTOR") || member.getUserType().equals("MANAGER")) {
				HospitalService hosService = new HospitalServiceImpl();
				String hNm = hosService.getHosNoByuNo(userNo);
				session.setAttribute("hNm", hNm);
			}
			resDto = new ResponseDto(true, "로그인 성공");
			
			session.setAttribute("uNo", userNo); // 세션에 회원 번호 저장
			session.setAttribute("userType", member.getUserType());
			Cookie idCookie;
			if(rememberId != null) { // 만약 아이디 저장을 체크했을때
				idCookie = new Cookie("rememberId", userId);
				idCookie.setPath("/ieum/login"); // 로그인 페이지에서만 아이디 저장
				idCookie.setMaxAge(60*60*24*7); // 7일
			}else { // 다시 로그인할때 체크를 해제할 수 있으니 그땐 쿠키 삭제
				idCookie = new Cookie("rememberId", "");
			    idCookie.setPath("/ieum/login"); // 기존 쿠키와 같은 경로
			    idCookie.setMaxAge(0);
			}
			response.addCookie(idCookie);
		}
		
		
		result = gson.toJson(resDto);
		response.getWriter().write(result);
		
		
		
	}

}
