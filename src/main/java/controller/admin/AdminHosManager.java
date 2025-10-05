package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class AdminHosManager
 */
@WebServlet("/admin/adminHosManager")
public class AdminHosManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHosManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 모든 병원매니저 목록 조회
//		int curPage = 1;
//		String filter = "none";
//		int state = 0;
//		
//		MemberService service = new MemberServiceImpl();
//		ManagerPageResponseDto managerList = service.managerList(curPage, filter, state);
//		request.setAttribute("managerList", managerList);
		
		request.getRequestDispatcher("/admin/adminHosManager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
