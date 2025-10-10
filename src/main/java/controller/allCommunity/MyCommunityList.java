package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.allCommunity.CommunityDao;
import dto.CommentDto;
import dto.CommentWithMemberDto;
import dto.CommunityDto;
import dto.MyCommunityDto;
import service.allCommunity.CommentEmpathyService;
import service.allCommunity.CommentEmpathyServiceImpl;
import service.allCommunity.CommentWithMemberService;
import service.allCommunity.CommentWithMemberServiceImpl;
import service.allCommunity.CommuEmpathyService;
import service.allCommunity.CommuEmpathyServiceImpl;
import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;
import service.allCommunity.MyCommunityService;
import service.allCommunity.MyCommunityServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class MyCommunityList
 */
@WebServlet("/myCom")
public class MyCommunityList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommuEmpathyService commuEmpathyService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCommunityList() {
        super();
        commuEmpathyService = new CommuEmpathyServiceImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 사용자 번호 (임시)
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		String spage = request.getParameter("page");
		Integer page = 1;
		if(spage != null) page=Integer.parseInt(spage);
		
		PageInfo pageInfo = new PageInfo(page);
		
		
		
		MyCommunityService service = new MyCommunityServiceImpl();
		CommentWithMemberService commentWithMemberService = new CommentWithMemberServiceImpl();
		CommuEmpathyService commuEmpathyService = new CommuEmpathyServiceImpl();
		CommentEmpathyService commentEmpathyService = new CommentEmpathyServiceImpl();
		//추가됨
		CommentDto commentDto = new CommentDto();
		CommunityDto communityDto = new CommunityDto();
		try {
			List<MyCommunityDto> myComList = service.getMyCommunityList(uNo);
			List<CommentWithMemberDto> myCommeList = commentWithMemberService.getMemWithCom(uNo);
			List<MyCommunityDto> myEmpathy = service.getSelectLikedCommunityList(uNo);
			
			// 게시물 좋아요 여부 세팅
	        for(MyCommunityDto community : myComList) {
	            boolean liked = commuEmpathyService.checkEmpathy(uNo, community.getCommuNo());
	            community.setLikedByUserCom(liked);
	        }
			
	        
	        // 댓글 좋아여 여부 세팅
	        for (CommentWithMemberDto comment : myCommeList) {
                boolean likedByUserCom = commentEmpathyService.checkEmpathy(uNo, comment.getCommeNo());
                comment.setLikedByUserCom(likedByUserCom); // DTO에 필드 있어야 함
            }
	        
			
			//작성한 게시판
			request.setAttribute("myComList", myComList);
			
			// 댓글 작성한곳
			request.setAttribute("myCommeList", myCommeList);
		
			//좋아요 누른 게시판
			request.setAttribute("myEmpathy", myEmpathy);
			
			
			
           
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		request.getRequestDispatcher("allCommunity/myCommunityList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
