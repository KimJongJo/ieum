package controller.allCommunity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // 로그인 사용자 번호 (임시)
//        int uNo = 5;
//
//        // 게시글 번호 확인
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
//            // 좋아요 토글
//            boolean liked = commuEmpathyService.commuEmpathy(uNo, commuNo);
//
//            // 최신 공감 수 가져오기
//            int newCount = commuEmpathyService.getEmpathyCount(commuNo);
//
//            // JSON 반환
//            response.setContentType("application/json;charset=UTF-8");
//			/* response.getWriter().write("{\"newCount\": " + newCount + "}"); */
//            response.getWriter().write("{\"newCount\": " + newCount + ", \"liked\": " + liked + "}");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        }
		
        int uNo = 5; // 고정된 유저 번호
        int commuNo = Integer.parseInt(request.getParameter("commuNo"));

        response.setContentType("application/json;charset=UTF-8");
        JSONObject json = new JSONObject();

        try {
            int newCount = commuEmpathyService.toggleEmpathy(uNo, commuNo);
            boolean liked = commuEmpathyService.hasEmpathy(uNo, commuNo);

            json.put("newCount", newCount);
            json.put("liked", liked); // ❤️ 빨강/🤍 표시용

        } catch(Exception e) {
            json.put("error", "서버 오류");
            e.printStackTrace();
        }

        response.getWriter().print(json.toString());
	}

}
