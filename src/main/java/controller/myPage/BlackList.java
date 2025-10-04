package controller.myPage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BlackWithMemberDto;
import service.myPage.BlackListService;
import service.myPage.BlackListServiceImpl;

/**
 * Servlet implementation class BlackList
 */
@WebServlet("/black")
public class BlackList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer uNo = 4;
		BlackListService service = new BlackListServiceImpl();
		
		try {
			List<BlackWithMemberDto> blackMember = service.getBlackWithMember(uNo);
			// 중복 제거 (nickname 기준)
			Map<String, BlackWithMemberDto> uniqueMap = new LinkedHashMap<>();
			for(BlackWithMemberDto b : blackMember) {
			    uniqueMap.put(b.getNickname(), b); // key가 중복되면 나중 값이 덮어짐
			}
			List<BlackWithMemberDto> uniqueBlackMember = new ArrayList<>(uniqueMap.values());
			
			request.setAttribute("blackMember", uniqueBlackMember);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("myPage/blackList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer uNo = 4; // 로그인 세션에서 가져오기 가능
	    String blockedNoStr = request.getParameter("blockedNo");

	    BlackListService service = new BlackListServiceImpl();

	    try {
	        if(blockedNoStr != null && !blockedNoStr.isEmpty()) {
	            int blockedNo = Integer.parseInt(blockedNoStr);
	            boolean success = service.unblockUser(uNo, blockedNo);

	            if(success) {
	                request.setAttribute("msg", "차단 해제 완료!");
	            } else {
	                request.setAttribute("msg", "차단 해제 실패!");
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("msg", "서버 오류 발생!");
	    }

	    doGet(request, response); // 처리 후 목록 재조회
	}

}
