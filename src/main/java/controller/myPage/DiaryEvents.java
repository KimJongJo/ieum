package controller.myPage;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import dto.DiaryDto;
import service.myPage.DiaryService;
import service.myPage.DiaryServiceImpl;

/**
 * Servlet implementation class Diary
 */
@WebServlet("/myPage/diary/event")
public class DiaryEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryEvents() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=UTF-8");
		DiaryService service = new DiaryServiceImpl();
		HttpSession session = request.getSession();
//		Integer uNo = (Integer)session.getAttribute("uNo");
		Integer uNo = 123;
		try {
			String sDate = request.getParameter("start");
			String eDate = request.getParameter("end");
			if (sDate != null && eDate != null) {
				sDate = sDate.substring(0, 19).replace("T", " ");
				eDate = eDate.substring(0, 19).replace("T", " ");
			}
			List<DiaryDto> diaryList = service.getCalList(uNo, sDate, eDate);
			List<Map<String, Object>> events = new ArrayList<>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (DiaryDto diary : diaryList) {
				Map<String, Object> ev = new HashMap<>();
				ev.put("title", diary.getTitle());
				ev.put("start", sdf.format(diary.getTargetDt()));
				ev.put("allDay", true); // FullCalendar에 하루 종일 이벤트로 표시
				events.add(ev);
			}
			String json = new Gson().toJson(events);
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
