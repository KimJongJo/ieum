package controller.myPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

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
		if (uNo == null) {
			request.setAttribute("loginErr", "로그인 후 이용해주세요");
		    String pageName = request.getRequestURI(); // 현재 페이지 경로
		    String queryString = request.getQueryString(); // 현재 페이지 queryString
		    request.setAttribute("redirect", pageName +"?"+queryString);
		    request.getRequestDispatcher("/common/errAlert.jsp").forward(request, response);
		    return;
		}
		
		request.setAttribute("navPath", "/ieum/calender");
		request.setAttribute("navPathName", "마이페이지");
		request.setAttribute("navcurPage", "즐겨찾는병원");
		
		request.getRequestDispatcher("/myPage/hosFavorite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		String curPage = request.getParameter("page");
		try {
			PageInfo pageInfo = new PageInfo(Integer.parseInt(curPage));
			FavoriteService service = new FavoriteServiceImpl();
			List<FavoriteDto> favList = service.getList(pageInfo, uNo);
			 response.setContentType("application/json; charset=UTF-8");             
             Gson gson = new Gson();
             Map<String, Object> resultMap = new HashMap<>();
             resultMap.put("favList", favList);
             resultMap.put("pageInfo", pageInfo); 
             String result = gson.toJson(resultMap);
             response.getWriter().write(result);
             return;
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
