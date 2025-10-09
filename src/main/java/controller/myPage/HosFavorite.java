package controller.myPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.FavoriteDto;
import service.myPage.FavoriteService;
import service.myPage.FavoriteServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class HosFavorite
 */
@WebServlet("/hosFavorite")
public class HosFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosFavorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		String curPage = request.getParameter("page");
		if (uNo == null) {
		    request.setAttribute("err", "잘못된 접근입니다. 로그인 후 이용해주세요");
		    request.getRequestDispatcher("/myPage/myPageAlert.jsp").forward(request, response);
		    return;
		}
		try {
			PageInfo pageInfo = new PageInfo(Integer.parseInt(curPage));
			FavoriteService service = new FavoriteServiceImpl();
			List<FavoriteDto> favList = service.getList(pageInfo, uNo);
			request.setAttribute("favList", favList);
			request.getRequestDispatcher("/myPage/hosFavorite.jsp").forward(request, response);	
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
