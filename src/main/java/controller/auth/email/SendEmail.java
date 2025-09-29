package controller.auth.email;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import service.auth.EmailService;
import service.auth.EmailServiceImpl;

/**
 * Servlet implementation class EmailAuth
 */
@WebServlet("/auth/sendEmailCode")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	EmailService service;
    
    public SendEmail() {
    	service = new EmailServiceImpl(getServletContext());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		boolean useEmail = service.useEmail(email);
		
		Gson gson = new Gson();
		String result;
		
		if(useEmail) { // 이미 누가 사용중인 이메일
			result = gson.toJson(new ResponseDto(false, "이미 사용중인 이메일 입니다."));
		}else { // 사용 가능한 이메일
			result = gson.toJson(new ResponseDto(true, "사용 가능한 이메일"));
		}
		response.getWriter().write(result);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		Gson gson = new Gson();
		String result;
		try {
			service.sendEmail(email);
			result = gson.toJson(new ResponseDto(true, "이메일 전송 완료"));
			response.getWriter().write(result);
			
		}catch(Exception e) {
			e.printStackTrace();
			result = gson.toJson(new ResponseDto(false, "이메일 전송 실패"));
			response.getWriter().write(result);
		}
			
				
		
	}

}
