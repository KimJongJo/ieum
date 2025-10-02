package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.allCommunity.CommunityDao;
import dto.CommentWithMemberDto;
import dto.MyCommunityDto;
import service.allCommunity.CommentWithMemberService;
import service.allCommunity.CommentWithMemberServiceImpl;
import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;
import service.allCommunity.MyCommunityService;
import service.allCommunity.MyCommunityServiceImpl;

/**
 * Servlet implementation class MyCommunityList
 */
@WebServlet("/myCom")
public class MyCommunityList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCommunityList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uNo = 5; // 🔹 현재 로그인 유저 번호(세션에서 꺼내는게 좋음)
		MyCommunityService service = new MyCommunityServiceImpl();
		CommentWithMemberService commentWithMemberService = new CommentWithMemberServiceImpl();
		try {
			List<MyCommunityDto> myComList = service.getMyCommunityList(uNo);
			List<CommentWithMemberDto> myCommeList = commentWithMemberService.getMemWithCom(uNo);
			List<MyCommunityDto> myEmpathy = service.getSelectLikedCommunityList(uNo);
			request.setAttribute("myCommeList", myCommeList);
			request.setAttribute("myComList", myComList);
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
		String commuNo = request.getParameter("commu_no"); // 글 번호 받아오기
		response.sendRedirect("comDetail?no=" + commuNo); // ✅ 파라미터로 넘겨야 함
	}

}
