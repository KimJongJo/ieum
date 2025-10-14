package controller.common.findPw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FindPw1
 */
@WebServlet("/findPw1")
public class FindPw1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPw1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("navPath", "/ieum/findPw1");
		request.setAttribute("navPathName", "비밀번호 찾기");
		request.setAttribute("navcurPage", "본인인증");
		
		request.getRequestDispatcher("/common/findPw/findPw1.jsp").forward(request, response);
	}


}
