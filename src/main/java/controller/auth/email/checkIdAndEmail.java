package controller.auth.email;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.ExamResultDto;
import dto.otherDto.ResponseDto;
import service.auth.EmailService;
import service.auth.EmailServiceImpl;

/**
 * Servlet implementation class FindPwToSendEamil
 */
@WebServlet("/auth/checkIdAndEmail")
public class checkIdAndEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkIdAndEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		EmailService service = new EmailServiceImpl();
		
		Gson gson = new Gson();
		ResponseDto resDto;
		String result;
		
		
		boolean send = service.pwToEmail(userId, email);
		if(!send) { // 정보가 없음
			resDto = new ResponseDto(false, "아이디와 이메일이 일치하지 않습니다.");
		}else {
			resDto = new ResponseDto(true, "이메일이 전송되었습니다.");
		}
		result = gson.toJson(resDto);
		
		response.getWriter().write(result);
		
	}

}
