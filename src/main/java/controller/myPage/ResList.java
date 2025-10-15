package controller.myPage;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.google.gson.GsonBuilder;

import dto.otherDto.ReservationInfoDto;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;
import util.LocalDateAdapter;
import util.LocalTimeAdapter;
import util.PageInfo;

/**
 * Servlet implementation class ResList
 */
@WebServlet("/myPage/reservation/list")
public class ResList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		ReservationService rService = new ReservationServiceImpl();

		try {
			List<ReservationInfoDto> comRes = rService.comResList(uNo);
			request.setAttribute("comRes", comRes);
			Integer comResCnt = comRes.size();
			request.setAttribute("comResCnt", comResCnt);
			Integer recResCnt = rService.recResListCnt(uNo, null, null);
			request.setAttribute("recResCnt", recResCnt);
			
			request.setAttribute("navPath", "/ieum/calender");
			request.setAttribute("navPathName", "마이페이지");
			request.setAttribute("navcurPage", "예약 내역");
			
			request.getRequestDispatcher("/myPage/resList.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");

		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		int curPage = 1;
		if(request.getParameter("page") != null) {
			curPage = Integer.parseInt(request.getParameter("page"));
		}
		
		PageInfo page = new PageInfo(curPage);
		
		ReservationService rService = new ReservationServiceImpl();

		try {
			List<ReservationInfoDto> recRes = rService.recResList(uNo, keyword, page, sort);
			
			Map<String, Object> json = new HashMap<>();
			json.put("recRes", recRes);
			json.put("curPage", page.getCurPage());
			json.put("allPage", page.getAllPage());
			json.put("startPage", page.getStartPage());
			json.put("endPage", page.getEndPage());

			response.setContentType("application/json;charset=utf-8");
			Gson gson = new GsonBuilder()
					.registerTypeAdapter(java.time.LocalDate.class, new LocalDateAdapter())
					.registerTypeAdapter(java.time.LocalTime.class, new LocalTimeAdapter())
					.create();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(json));
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

}
