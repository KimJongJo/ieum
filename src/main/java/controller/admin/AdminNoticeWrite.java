package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.admin.noticeService;
import service.admin.noticeServiceImpl;

/**
 * Servlet implementation class AdminNoticeWrite
 */
@WebServlet("/admin/notice/write")
public class AdminNoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 멤버에서 로그인 사용자 이름 뽑아오기
		HttpSession session = request.getSession();
	    Integer uNo = (Integer)session.getAttribute("uNo");
	    noticeService service = new noticeServiceImpl();
	    String title = request.getParameter("title");
	    try {
	    	// 작성
	    	if (title == null) {
	    		String uNm = service.getUserNm(uNo);
		    	request.setAttribute("writer", uNm);
				request.getRequestDispatcher("/admin/noticeWrite.jsp").forward(request, response);
	    	}
	    	// 수정 조회
	    	
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String topYn = request.getParameter("topYn");
		
		request.getRequestDispatcher("/admin/adminNoticeList.jsp").forward(request, response);
	}

}
