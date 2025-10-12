package controller.myPage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.allCommunity.CommentService;
import service.allCommunity.CommentServiceImpl;

/**
 * Servlet implementation class Declaration
 */
@WebServlet("/declaration")
public class Declaration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Declaration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		CommentService commentService = new CommentServiceImpl();
		
		if (uNo == null) { // 로그인 안 한 경우
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('로그인이 필요합니다.'); location.href='" 
                + request.getContextPath() + "/login';</script>");
            return;
        }
        
        String commeNoStr = request.getParameter("commeNo");
        if (commeNoStr == null || commeNoStr.isEmpty()) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('잘못된 요청입니다.'); history.back();</script>");
            return;
        }

        int commeNo = Integer.parseInt(commeNoStr);

        try {
        	int commentAuthorNo = commentService.getCommentWriter(commeNo); // CommentService에 메서드 필요
        	if (uNo == commentAuthorNo) {
        	    out.println("{\"success\":false, \"message\":\"자신의 댓글은 신고할 수 없습니다.\"}");
        	    return;
        	}
        	
        	
            // 신고 처리 및 삭제 여부 확인
        	// 신고 처리
        	boolean deleted = commentService.reportComment(commeNo);
        	if (deleted) {
        	    out.println("{\"success\":true, \"deleted\":true, \"message\":\"신고 누적 5회로 댓글이 삭제되었습니다.\"}");
        	} else {
        	    out.println("{\"success\":true, \"deleted\":false, \"message\":\"신고가 접수되었습니다.\"}");
        	}

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('서버 오류 발생'); history.back();</script>");
        }
        
        
		
	}

}
