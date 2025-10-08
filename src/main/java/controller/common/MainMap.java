package controller.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.DiaryDto;
import dto.otherDto.MainHosDto;
import service.common.MainService;
import service.common.MainServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/map")
public class MainMap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainMap() {
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
		response.setContentType("application/json; charset=UTF-8");
		MainService service = new MainServiceImpl();
		try {
//			 지도 - 병원 리스트
			String userLocY = request.getParameter("userLocY"); // 위도
			String userLocX = request.getParameter("userLocX"); // 경도
			List<MainHosDto> mapHosList = service.getMapHosList(userLocX, userLocY);
			List<Map<String, Object>> results = new ArrayList<>();
			for (MainHosDto hos : mapHosList) {
				Map<String, Object> res = new HashMap<>();
				res.put("hNo", hos.gethNo());
				res.put("hNm", hos.gethNm());
				res.put("lat", hos.gethLocationY());
				res.put("lng", hos.gethLocationX());
				results.add(res);
			}
			String json = new Gson().toJson(results);
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
