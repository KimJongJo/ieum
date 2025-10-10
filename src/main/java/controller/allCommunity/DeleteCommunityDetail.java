package controller.allCommunity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;

/**
 * Servlet implementation class DeleteCommunityDetail
 */
@WebServlet("/delComDetail")
public class DeleteCommunityDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommunityDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 사용자 번호 (임시)
        HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		if (uNo == null) {
            // 로그인 안 했을 경우
            response.sendRedirect("login.jsp");
            return;
        }

		
		CommunityService communityService = new CommunityServiceImpl();
		
		int commuNo = Integer.parseInt(request.getParameter("commuNo"));
        try {
        	
        	// 게시글 작성자 번호 조회
        	Integer authorNo = communityService.getCommunityAuthorNo(commuNo);
        	if (authorNo == null) {
        		response.sendError(HttpServletResponse.SC_NOT_FOUND, "게시글이 존재하지 않습니다.");
        	return;
        }

        	// 작성자가 아니면 삭제 불가
        	if (authorNo.intValue() != uNo) { // 안전하게 비교
        	    response.sendError(HttpServletResponse.SC_FORBIDDEN, "삭제 권한이 없습니다.");
        	    return;
        	}
        	
        
        		communityService.deleteCommunityWithComments(commuNo);
        		response.sendRedirect("myCom");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "삭제 중 오류 발생");
		}
        
	}

}


