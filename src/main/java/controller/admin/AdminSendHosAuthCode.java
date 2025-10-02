package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.auth.EmailService;
import service.auth.EmailServiceImpl;

/**
 * Servlet implementation class AdminSehdHosAuthCode
 */
@WebServlet("/admin/sendHosAuthCode")
public class AdminSendHosAuthCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSendHosAuthCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer hNo = Integer.parseInt(request.getParameter("hNo"));
		String email = request.getParameter("email");
		EmailService emailService = new EmailServiceImpl(request.getServletContext());
		emailService.sendHosKey(hNo, email);
		
	}

}
