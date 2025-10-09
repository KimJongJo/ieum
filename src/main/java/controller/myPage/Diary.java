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
		response.setCharacterEncoding("utf-8");
		// 세션에서 로그인 uNo 가져오기
		HttpSession session = request.getSession();
	    Integer uNo = (Integer)session.getAttribute("uNo");
	    if (uNo == null) {
		    request.setAttribute("err", "잘못된 접근입니다. 로그인 후 이용해주세요");
		    request.getRequestDispatcher("/myPage/myPageAlert.jsp").forward(request, response);
		    return;
		}
		Integer dNo = (Integer) session.getAttribute("dNo");
		String curPage = request.getParameter("page");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		DiaryService service = new DiaryServiceImpl();
		try {
			 boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
			// 목록
			if (curPage != null) {
				PageInfo pageInfo = new PageInfo(Integer.parseInt(curPage));
				List<DiaryDto> diaryList = service.getList(uNo, keyword, sort, pageInfo);
				if (isAjax) {
                    response.setContentType("application/json; charset=UTF-8");
                    
                    Gson gson = new Gson();
                    Map<String, Object> resultMap = new HashMap<>();
                    resultMap.put("diaryList", diaryList);
                    resultMap.put("pageInfo", pageInfo); 
                    String result = gson.toJson(resultMap);
                    response.getWriter().write(result);
                    return;
                }
				request.setAttribute("diaryList", diaryList);
				request.setAttribute("pageInfo", pageInfo);
				Boolean hisYn = service.getHisYn(uNo);
				request.setAttribute("recentHistory", hisYn);
				request.getRequestDispatcher("/myPage/diaryList.jsp").forward(request, response);
			// 수정 -> 상세
			} else {
				DiaryDto diary = service.getDetail(dNo);
				request.setAttribute("diary", diary);
				Boolean hisYn = service.getHisYn(uNo);
				request.setAttribute("recentHistory", hisYn);
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
		HttpSession session = request.getSession();
	    Integer uNo = (Integer)session.getAttribute("uNo");
		Integer dNo = Integer.parseInt(request.getParameter("dNo"));
		try {
			session.setAttribute("dNo", dNo);
			DiaryDto diary = service.getDetail(dNo);
			request.setAttribute("diary", diary);
			Boolean hisYn = service.getHisYn(uNo);
			request.setAttribute("recentHistory", hisYn);
			request.getRequestDispatcher("/myPage/diaryDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
