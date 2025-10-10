package controller.myPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BlackListDto;
import service.myPage.BlackListService;
import service.myPage.BlackListServiceImpl;

/**
 * Servlet implementation class BlackComment
 */
@WebServlet("/blackCom")
public class BlackComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackComment() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		if (uNo == null) {
            // 로그인 안 했을 경우
            response.sendRedirect("login.jsp");
            return;
        }
		
        BlackListService blackListService = new BlackListServiceImpl();
        String blockedNoStr = request.getParameter("blockedNo");
        if (blockedNoStr == null || blockedNoStr.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        int blockedNo = 0;
        try {
            blockedNo = Integer.parseInt(blockedNoStr);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        boolean success = false;
        try {
            success = blackListService.blockUser(uNo, blockedNo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // JSON 반환
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"success\":" + success + "}");
		
		
		
		
		
		
		
	}
	

}
