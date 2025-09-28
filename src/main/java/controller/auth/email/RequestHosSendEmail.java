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
 * Servlet implementation class RequestHosSendEmail
 */
@WebServlet("/auth/requestHosEmail")
public class RequestHosSendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestHosSendEmail() {
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
		EmailService service = new EmailServiceImpl();
		
		Gson gson = new Gson();
		ResponseDto resDto;
		String result;
		
		try {
			service.sendEmail(email);
			resDto = new ResponseDto(true, "이메일이 전송되었습니다.");
		}catch(Exception e) {
			resDto = new ResponseDto(false, "이메일 전송중 에러 발생");
		}
		result = gson.toJson(resDto);
		
		response.getWriter().write(result);
		
	}

}
