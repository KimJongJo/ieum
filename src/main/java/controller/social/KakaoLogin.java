package controller.social;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dto.MemberDto;
import dto.otherDto.KakaoMemberDto;
import service.social.KakaoService;
import service.social.KakaoServiceImpl;


/**
 * Servlet implementation class kakaoLogin
 */
@WebServlet("/social/kakao")
public class KakaoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Properties prop = new Properties();
		String kakaoKey = "";
		String kakaoRedirectUrl = "";
		try(InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
		    prop.load(is);
		    kakaoKey = prop.getProperty("kakao.api.key");
		    kakaoRedirectUrl = prop.getProperty("kakao.api.redirectUrl");
		    request.setAttribute("kakaoKey", kakaoKey);
		    request.setAttribute("kakaoRedirectUrl", kakaoRedirectUrl);
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		String code = request.getParameter("code");
		
		KakaoService kakaoService = new KakaoServiceImpl();
		
		// 토큰 받아오기
		String token;
		try {
			token = kakaoService.getAccessToken(code, kakaoKey, kakaoRedirectUrl);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("카카오 토큰 요청중 에러 발생");
			token = null;
		}
		
		try {
			// 서비스에서 토큰 조회할때 가져온 id로 db를 조회
			KakaoMemberDto kakaoDto = kakaoService.getMemberDto(token);
			HttpSession session = request.getSession();
			
			// member 객체가 있을때
			if(kakaoDto.getMemberDto() != null) {
				
				session.setAttribute("uNo", kakaoDto.getMemberDto().getuNo());
				response.sendRedirect(request.getContextPath() + "/index");
			}else {
				session.setAttribute("kakaoDto",kakaoDto);
				// 새로운 카카오 회원가입 페이지로 이동
				response.sendRedirect("kakaoSignUp");
			}
			
		}catch(Exception e) {
			System.out.println("카카오 로그인 api 에러 발생");
		}

		
	}

}
