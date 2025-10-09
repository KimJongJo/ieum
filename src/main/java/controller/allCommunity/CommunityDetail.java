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
import service.allCommunity.CommentEmpathyService;
import service.allCommunity.CommentEmpathyServiceImpl;
import service.allCommunity.CommentService;
import service.allCommunity.CommentServiceImpl;
import service.allCommunity.CommuEmpathyService;
import service.allCommunity.CommuEmpathyServiceImpl;
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
		
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
        String noStr = request.getParameter("no");
        if (noStr == null || noStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 전달되지 않았습니다.");
            return;
        }
        
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
        CommuEmpathyService commuEmpathyService = new CommuEmpathyServiceImpl();
        CommentEmpathyService commentEmpathyService = new CommentEmpathyServiceImpl();
        BlackListService blackListService = new BlackListServiceImpl();
        CommentDto commentDto = new CommentDto();
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
//            request.setAttribute("comments", commentList);
            

         // 로그인 사용자가 차단한 사용자 목록 가져오기
            
            List<Integer> blockedUsers = blackListService.getBlockedUsers(uNo);
            Set<Integer> blockedSet = blockedUsers != null ? new HashSet<>(blockedUsers) : new HashSet<>();

            // 댓글 필터링: 댓글 작성자가 차단 대상이면 제거
            commentList.removeIf(comment -> blockedSet.contains(comment.getuNo()));
            request.setAttribute("comments", commentList);
            request.setAttribute("blockedList", blockedSet); // JSP에서 참조 가능하도록 설정
            
            //8.공감 유지
            boolean likedByUser = commuEmpathyService.checkEmpathy(uNo, commuNo);
            communityDto.setLikedByUser(likedByUser);
            request.setAttribute("community", communityDto);

            //9 공감 유지
            for (CommentDto comment : commentList) {
                boolean likedByUserCom = commentEmpathyService.checkEmpathy(uNo, comment.getCommeNo());
                comment.setLikedByUserCom(likedByUserCom); // DTO에 필드 있어야 함
            }
            request.setAttribute("comment", commentList);
            
            
            
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
		
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
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
