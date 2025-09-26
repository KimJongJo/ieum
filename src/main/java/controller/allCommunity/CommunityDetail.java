package controller.allCommunity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CommunityDto;
import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;

/**
 * Servlet implementation class CommunityDetail
 */
@WebServlet("/comDetail")
public class CommunityDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityService communityService = new CommunityServiceImpl();   
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String no = request.getParameter("no");
		try {
            CommunityDto communityDto = communityService.selectByNo(Integer.parseInt(no));
            request.setAttribute("community", communityDto);
            request.getRequestDispatcher("allCommunity/communityDetail.jsp").forward(request, response);
        } catch(Exception e) {
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
