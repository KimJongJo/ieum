package controller.common.join;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignUp2
 */
@WebServlet("/join2")
public class Join2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Join2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userType = request.getParameter("userType");
		HttpSession session = request.getSession();
		session.setAttribute("userType", userType);
		
		request.setAttribute("navPath", "/ieum/join1");
		request.setAttribute("navPathName", "회원가입");
		request.setAttribute("navcurPage", "약관동의");
		
		request.getRequestDispatcher("/common/join/join2.jsp").forward(request, response);
	}

	

}
