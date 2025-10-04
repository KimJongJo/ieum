package controller.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.HospitalDto;
import dto.otherDto.MainHosDto;
import service.common.MainService;
import service.common.MainServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Index() {
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
		try {
			// 병원 추천
			MainService service = new MainServiceImpl();
			List<MainHosDto> mainHosList  = service.getHostList();
			request.setAttribute("hosList", mainHosList);
			request.getRequestDispatcher("common/main/index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
