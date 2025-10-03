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
		
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=UTF-8");

	    Integer uNo = 4; // 임시 로그인

	    Integer commuNo = Integer.parseInt(request.getParameter("commuNo"));
	    Integer commeNo = Integer.parseInt(request.getParameter("commeNo"));
	    Integer blockedNo = Integer.parseInt(request.getParameter("blockedNo"));

	    BlackListService blackListService = new BlackListServiceImpl();
	    BlackListDto dto = new BlackListDto();
	    dto.setuNo(uNo);
	    dto.setCommuNo(commuNo);
	    dto.setCommeNo(commeNo);
	    dto.setBlockedNo(blockedNo);

	    boolean success = false;
	    try {
	        success = blackListService.blockComment(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // JSON 응답
	    response.getWriter().write("{\"success\":" + success + "}");
	}
	

}
