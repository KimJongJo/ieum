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

        // 임의 로그인 유저 번호 (테스트용)
        Integer uNo = 5;

        // 차단할 댓글 정보
        Integer commuNo = Integer.parseInt(request.getParameter("commuNo"));
        Integer commeNo = Integer.parseInt(request.getParameter("commeNo"));
        Integer blockedNo = Integer.parseInt(request.getParameter("blockedNo")); // 댓글 작성자 uNo

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

        if (success) {
            // 차단 성공 시, 차단된 댓글 목록 가져오기
            List<Integer> blockedList = null;
            try {
                blockedList = blackListService.getBlockedComments(uNo, commuNo);
            } catch (Exception e) {
                e.printStackTrace();
            }

            // 세션이나 request에 차단 목록 저장
            request.setAttribute("blockedList", blockedList);

            // 다시 커뮤니티 상세 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/comDetail?no=" + commuNo);
        } else {
            response.getWriter().write("차단 실패");
        }
	}

}
