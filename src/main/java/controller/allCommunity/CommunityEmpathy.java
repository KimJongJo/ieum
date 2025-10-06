package controller.allCommunity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dto.CommunityDto;
import service.allCommunity.CommuEmpathyService;
import service.allCommunity.CommuEmpathyServiceImpl;

/**
 * Servlet implementation class CommunityEmpathy
 */
@WebServlet("/comEmpathy")
public class CommunityEmpathy extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommuEmpathyService commuEmpathyService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityEmpathy() {
        super();
        commuEmpathyService = new CommuEmpathyServiceImpl();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("application/json;charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        
//        int uNo = 4; // 로그인 사용자 (임시)
//
//        String commuNoStr = request.getParameter("commuNo");
//        if (commuNoStr == null || commuNoStr.isEmpty()) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호 필요");
//            return;
//        }
//
//        int commuNo = 0;
//        try {
//            commuNo = Integer.parseInt(commuNoStr);
//        } catch (NumberFormatException e) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 올바르지 않음");
//            return;
//        }
//
//        try {
//            boolean likedByUser  = commuEmpathyService.checkEmpathy(uNo, commuNo);
//            int newCount = commuEmpathyService.getEmpathyCount(commuNo);
//
//            response.getWriter().write("{\"newCount\": " + newCount + ", \"likedByUser \": " + likedByUser  + "}");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        }
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");  // 추가
		
		// 로그인 사용자 번호 (임시)
        int uNo = 3;

        // 게시글 번호 확인
        String commuNoStr = request.getParameter("commuNo");
        if (commuNoStr == null || commuNoStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호 필요");
            return;
        }

        int commuNo = 0;
        try {
            commuNo = Integer.parseInt(commuNoStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 올바르지 않음");
            return;
        }

        try {
        	
        	// 로그인 사용자가 이미 공감했는지 체크
            boolean likedByUser = commuEmpathyService.checkEmpathy(uNo, commuNo);
            
        	
            // 좋아요 토글
            boolean liked = commuEmpathyService.commuEmpathy(uNo, commuNo);

            // 최신 공감 수 가져오기
            int newCount = commuEmpathyService.getEmpathyCount(commuNo);

            // JSON 반환
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"newCount\": " + newCount + ", \"liked\": " + liked + "}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
	}

}
