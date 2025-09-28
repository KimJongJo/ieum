package controller.myPage;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.DiaryDto;
import service.myPage.DiaryService;
import service.myPage.DiaryServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class Diary
 */
@WebServlet("/myPage/diary")
public class Diary extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Diary() {
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
		String dNo = request.getParameter("dNo");
		DiaryService service = new DiaryServiceImpl();
		try {
			// 목록
			if (dNo == null || dNo.trim().equals("")) {
				// 세션에서 로그인 uNo 가져오기
				HttpSession session = request.getSession();
//			    Integer uNo = Integer.parseInt((String)session.getAttribute("uNo"));	
				Integer uNo = 123;
				// 페이지
				Integer curPage = Integer.parseInt(request.getParameter("page"));
				PageInfo pageInfo = new PageInfo(curPage);
				List<DiaryDto> diaryList = service.getList(uNo, pageInfo);
				request.setAttribute("diaryList", diaryList);
				request.setAttribute("pageInfo", pageInfo);
				request.getRequestDispatcher("/myPage/diaryList.jsp").forward(request, response);
			} else {
				request.setAttribute("dNo", dNo);
				request.getRequestDispatcher("/myPage/diaryDetail.jsp").forward(request, response);
			}
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
			Integer dNo = Integer.parseInt(request.getParameter("dNo"));
			DiaryDto diary = service.getDetail(dNo);
			request.setAttribute("diary", diary);
			Boolean hisYn = service.getHisYn(123);
			request.setAttribute("recentHistory", hisYn);
			request.getRequestDispatcher("/myPage/diaryDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
