package controller.auth.email;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.EmailAuthDto;
import dto.otherDto.responseDto;
import service.auth.EmailService;
import service.auth.EmailServiceImpl;

/**
 * Servlet implementation class CheckEmailCode
 */
@WebServlet("/auth/checkEmailCode")
public class CheckEmailCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		EmailAuthDto emailDto = new EmailAuthDto(email, code);
		
		EmailService service = new EmailServiceImpl();
		
		
		
		// 0 인증 실패, 1 만료된 코드 2 인증성공
		int checkCode = service.checkEmail(emailDto);
		
		String message;
		message = checkCode == 0 ? "인증 실패" : checkCode == 1 ? "만료된 코드" : "인증 성공";
		
		responseDto resDto = new responseDto(checkCode == 2 ? true : false, message);
		
		Gson gson = new Gson();
		String result = gson.toJson(resDto);
		
		response.getWriter().write(result);
	}

}
