package controller.allCommunity;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.allCommunity.CommentDao;
import dto.CommentDto;
import dto.CommuCategoryDto;
import dto.CommunityDto;
import dto.MemberDto;
import service.allCommunity.CategoryService;
import service.allCommunity.CategoryServiceImpl;
import service.allCommunity.CommentService;
import service.allCommunity.CommentServiceImpl;
import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import service.myPage.BlackListService;
import service.myPage.BlackListServiceImpl;

/**
 * Servlet implementation class CommunityDetail
 */
@WebServlet("/comDetail")
public class CommunityDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
        String noStr = request.getParameter("no");
        if (noStr == null || noStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 전달되지 않았습니다.");
            return;
        }
        int uNo = 5; // 테스트용, 실제 로그인 세션 값으로 교체 필요
        int commuNo = 0;
        try {
            commuNo = Integer.parseInt(noStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 올바르지 않습니다.");
            return;
        }

        CommunityService communityService = new CommunityServiceImpl();
        CategoryService categoryService = new CategoryServiceImpl();
        MemberService memberService = new MemberServiceImpl();
        CommentService commentService = new CommentServiceImpl();
        try {
                	
        	// 조회수 증가
        	communityService.updateViews(commuNo);
        	//1. 커뮤글 조회
            CommunityDto communityDto = communityService.selectByNo(commuNo);
            request.setAttribute("community", communityDto);
           
            //2 카테고리 조회
            CommuCategoryDto categoryDto = categoryService.selectByNo(communityDto.getCategoryNo());
            request.setAttribute("category", categoryDto);
            
            //3.  커뮤 작성자 정보조회
            MemberDto memberDto = memberService.selectByNickName(communityDto.getuNo());
            request.setAttribute("member", memberDto);
            
            //4. 댓글 목록 조회
            List<CommentDto> commentList = commentService.getCommentsByCommuNo(commuNo);
            request.setAttribute("comments", commentList);
            
         // ✅ 5. 로그인한 사용자가 차단한 댓글 목록 가져오기
            BlackListService blackListService = new BlackListServiceImpl();
            List<Integer> blockedList = null;
            try {
                blockedList = blackListService.getBlockedComments(uNo, commuNo);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("blockedList", blockedList);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "게시글 조회 중 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
            return;
        }

        request.getRequestDispatcher("allCommunity/communityDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//댓글 등록
		request.setCharacterEncoding("utf-8");
		
		int uNo = 5; //로그인된 사용자 번호
		
		//게시글 번호 확인
		String commuNoStr = request.getParameter("commuNo");
		
		if (commuNoStr == null || commuNoStr.isEmpty()) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 필요합니다.");
	        return;
	    }
		// 댓글 내용 확인
		String content = request.getParameter("content");
		if (content == null || content.trim().isEmpty()) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "댓글 내용이 필요합니다.");
	        return;
	    }
		
		
		int commuNo = 0;
		try {
            commuNo = Integer.parseInt(commuNoStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 올바르지 않습니다.");
            return;
        }

		
		CommentDto commentDto = new CommentDto(uNo, commuNo, content);
		CommentService service = new CommentServiceImpl();
		try {
			service.insertComment(commentDto);
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		response.sendRedirect(request.getContextPath() + "/comDetail?no=" + commuNo);
		
	}

}
