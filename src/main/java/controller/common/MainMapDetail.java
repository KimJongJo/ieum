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
@WebServlet("/map/detail")
public class MainMapDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainMapDetail() {
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
			String hNo = request.getParameter("hNo");
			MainHosDto mapHosInfo = service.getMapHosInfo(Integer.parseInt(hNo));
			Gson gson = new Gson();
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("mapHosInfo", mapHosInfo);
			String result = gson.toJson(resultMap);
			response.getWriter().write(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
