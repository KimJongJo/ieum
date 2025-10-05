package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AllCommunityDto;
import dto.MyCommunityDto;
import service.allCommunity.AllCommunityService;
import service.allCommunity.AllCommunityServiceImpl;
import service.allCommunity.CommuEmpathyService;
import service.allCommunity.CommuEmpathyServiceImpl;
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
		int uNo = 4;
		String spage = request.getParameter("page"); 
		Integer page = 1; 
		if(spage != null) page=Integer.parseInt(spage); 
		PageInfo pageInfo = new PageInfo(page);
		
		
		AllCommunityService service = new AllCommunityServiceImpl();
		CommuEmpathyService commuEmpathyService = new CommuEmpathyServiceImpl();
		try {
			List<AllCommunityDto> allComList = service.listByPage(pageInfo);
			request.setAttribute("allComList", allComList); 
			request.setAttribute("pageInfo", pageInfo);
			
			
			// 게시물 좋아요 여부 세팅
	        for(AllCommunityDto community : allComList) {
	            boolean liked = commuEmpathyService.checkEmpathy(uNo, community.getCommuNo());
	            community.setLikedByUserCom(liked);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}   
		
		
		
		
		
	    
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
