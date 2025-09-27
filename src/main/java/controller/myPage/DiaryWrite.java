package controller.myPage;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.DiaryDto;
import service.myPage.DiaryService;
import service.myPage.DiaryServiceImpl;

/**
 * Servlet implementation class DiaryWrite
 */
@WebServlet("/myPage/diary/write")
public class DiaryWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryWrite() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		try {
			LocalDateTime now = LocalDateTime.now();
			String formattedNow = now.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
			request.setAttribute("todayDt", formattedNow);
			request.getRequestDispatcher("/myPage/diaryWrite.jsp").forward(request, response);
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
		DiaryService service = new DiaryServiceImpl();
		try {
			// 한국 시간대의 현재 시각을 ZonedDateTime 객체로 가져옵니다.
			ZonedDateTime now = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
			Instant instant = now.toInstant();
			// Instant를 java.util.Date 객체로 변환합니다.
			Date utilDate = Date.from(instant);
			HttpSession session = request.getSession();
//			String uNo = (String)session.getAttribute("uNo");
			String uNo = "123";
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String emoji = request.getParameter("emoji");
			DiaryDto diary = new DiaryDto(Integer.valueOf(uNo), utilDate, title, content, emoji);
//			System.out.println(diary.toString());
			service.write(diary);
			request.getRequestDispatcher("/myPage/diaryList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
