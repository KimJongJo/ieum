package controller.allCommunity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;

/**
 * Servlet implementation class DeleteCommunityDetail
 */
@WebServlet("/delComDetail")
public class DeleteCommunityDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommunityDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommunityService communityService = new CommunityServiceImpl();
		
		int commuNo = Integer.parseInt(request.getParameter("commuNo"));
        try {
			communityService.deleteCommunityWithComments(commuNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("myCom");
	}

}


