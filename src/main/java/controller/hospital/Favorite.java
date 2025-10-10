package controller.hospital;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.hospital.FavoriteService;
import service.hospital.FavoriteServiceImpl;

/**
 * Servlet implementation class Favorite
 */
@WebServlet("/favorite/toggle")
public class Favorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Favorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer uNo = (Integer)session.getAttribute("uNo");
		Integer hNo = Integer.parseInt(request.getParameter("hNo"));
		System.out.println(uNo +"........" +hNo);
		
		if(uNo == null) {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return;
		}
		
		try {
			FavoriteService fService = new FavoriteServiceImpl();
			boolean isFavorite = fService.isFav(uNo, hNo);
			fService.toggleFav(uNo, hNo);
			
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().write("{\"favorite\":" + !isFavorite +"}");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
