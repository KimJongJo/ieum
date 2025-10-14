package controller.common.findId;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class FindId3
 */
@WebServlet("/findId2")
public class FindId3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindId3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberService service = new MemberServiceImpl();
		String email = (String)session.getAttribute("email");
		Map<String, Object> userMap = service.findId(email);
		request.setAttribute("userMap", userMap);
		
		request.setAttribute("navPath", "/ieum/findId1");
		request.setAttribute("navPathName", "아이디 찾기");
		request.setAttribute("navcurPage", "아이디 확인");
		
		session.removeAttribute("userType");
		
		request.getRequestDispatcher("/common/findId/findId3.jsp").forward(request, response);
	}

	

}
