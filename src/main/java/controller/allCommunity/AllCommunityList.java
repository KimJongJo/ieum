package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.AllCommunityDto;
import dto.MyCommunityDto;
import service.allCommunity.AllCommunityService;
import service.allCommunity.AllCommunityServiceImpl;
import service.allCommunity.CommuEmpathyService;
import service.allCommunity.CommuEmpathyServiceImpl;
import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class AllCommunityList
 */
@WebServlet("/allComList")
public class AllCommunityList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllCommunityList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		// 댓글 수 업데이트
	    CommunityService communityService = new CommunityServiceImpl();
	    try {
	        communityService.updateCommentCount();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		String spage = request.getParameter("page"); 
		Integer page = 1; 
		if(spage != null) page=Integer.parseInt(spage); 
		PageInfo pageInfo = new PageInfo(page);
		
		//2줄 추가됨
		String sort = request.getParameter("sort"); // 최신, 공감, 조회
        if(sort == null) sort = "latest"; // 기본값 최신순
        
        String category = request.getParameter("category");
        if (category == null) category = "all"; // 기본값
		
		AllCommunityService service = new AllCommunityServiceImpl();
		CommuEmpathyService commuEmpathyService = new CommuEmpathyServiceImpl();
		try {
			List<AllCommunityDto> allComList = service.listByPage(pageInfo, sort, category);
			request.setAttribute("allComList", allComList); 
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("sort", sort);// 추가됨
			request.setAttribute("category", category);
			
			// 게시물 좋아요 여부 세팅
	        for(AllCommunityDto community : allComList) {
	            boolean liked = commuEmpathyService.checkEmpathy(uNo, community.getCommuNo());
	            community.setLikedByUserCom(liked);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("navPath", "/ieum/allComList");
		request.setAttribute("navPathName", "커뮤니티");
		request.setAttribute("navcurPage", "게시글 목록");
	    
		request.getRequestDispatcher("allCommunity/allCommunityList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commuNo = request.getParameter("commu_no"); // 글 번호 받아오기
		response.sendRedirect("comDetail?no=" + commuNo); // ✅ 파라미터로 넘겨야 함
	}

}
