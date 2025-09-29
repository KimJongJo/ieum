package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AllCommunityDto;
import service.allCommunity.AllCommunityService;
import service.allCommunity.AllCommunityServiceImpl;

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
		
		AllCommunityService service = new AllCommunityServiceImpl();
		List<AllCommunityDto> allComList = service.getAllCommunity();
		System.out.println(allComList);

	    request.setAttribute("allComList", allComList);
		request.getRequestDispatcher("allCommunity/allCommunityList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("comDetail");
	}

}
