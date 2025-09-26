package controller.auth.email;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.responseDto;
import jakarta.mail.MessagingException;
import service.auth.EmailService;
import service.auth.EmailServiceImpl;

/**
 * Servlet implementation class EmailAuth
 */
@WebServlet("/auth/sendEmailCode")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		Gson gson = new Gson();
		String result;
		EmailService service = new EmailServiceImpl();
		try {
			service.sendEmail(email);
			result = gson.toJson(new responseDto(true, "이메일 전송 완료"));
			response.getWriter().write(result);
			
		}catch(Exception e) {
			e.printStackTrace();
			result = gson.toJson(new responseDto(false, "이메일 전송 실패"));
			response.getWriter().write(result);
		}
			
				
		
	}

}
