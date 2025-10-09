package controller.allCommunity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.allCommunity.CommentEmpathyService;
import service.allCommunity.CommentEmpathyServiceImpl;

/**
 * Servlet implementation class CommentEmpathy
 */
@WebServlet("/commeEmpathy")
public class CommentEmpathy extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentEmpathyService commentEmpathyService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentEmpathy() {
        super();
        commentEmpathyService = new CommentEmpathyServiceImpl();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");  // 추가
		
		int uNo = 6;
		
		String commeNoStr = request.getParameter("commeNo");
		if (commeNoStr == null || commeNoStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "댓글 번호 필요");
            return;
        }
		
		 int commeNo = 0;
		 try {
			 commeNo = Integer.parseInt(commeNoStr);
		 } catch (NumberFormatException e) {
	         response.sendError(HttpServletResponse.SC_BAD_REQUEST, "댓글 번호가 올바르지 않음");
	         return;
	     }
		 
		 try {
		 	 //좋아요 토클
			 boolean liked = commentEmpathyService.commentEmpathy(uNo, commeNo);
			 
			 
			 //최신 공감 수 가져오기
			 int newCount = commentEmpathyService.getCommentEmpathyCount(commeNo);
			 
			 
			 
			 // JSON 반환
	         response.setContentType("application/json;charset=UTF-8");
	         response.getWriter().write("{\"newCount\": " + newCount + ", \"liked\": " + liked + "}");
		} catch (Exception e) {
			e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

}
