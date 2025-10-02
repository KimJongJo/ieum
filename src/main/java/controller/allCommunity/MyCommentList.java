package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CommentWithMemberDto;
import service.allCommunity.CommentWithMemberService;
import service.allCommunity.CommentWithMemberServiceImpl;

/**
 * Servlet implementation class MyCommentList
 */
@WebServlet("/myComList")
public class MyCommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCommentList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int uNo = 5;
//		CommentWithMemberService commentWithMemberService = new CommentWithMemberServiceImpl();
//		try {
//			List<CommentWithMemberDto> myCommeList = commentWithMemberService.getMemWithCom(uNo);
//			request.setAttribute("myCommeList", myCommeList);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		request.getRequestDispatcher("allCommunity/myCommunityList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
