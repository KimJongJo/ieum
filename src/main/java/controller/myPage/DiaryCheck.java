package controller.myPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.DiaryDto;
import service.myPage.DiaryService;
import service.myPage.DiaryServiceImpl;

/**
 * Servlet implementation class Diary
 */
@WebServlet("/myPage/diary/check")
public class DiaryCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryCheck() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=UTF-8"); 
		DiaryService service = new DiaryServiceImpl();
		HttpSession session = request.getSession();
		try {
			String date = request.getParameter("date");
			 Integer uNo = (Integer) session.getAttribute("uNo");
			DiaryDto diary = service.getDate(uNo, date);			
			Gson gson = new Gson();
			Map<String, Object> result = new HashMap<>();
            if (diary != null) {
                result.put("exists", true);
                result.put("diary", diary);
            } else {
                result.put("exists", false);
                result.put("diary", null);
            }
			String json = gson.toJson(result);
			
//			System.out.println("Diary" + diary.toString());
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
