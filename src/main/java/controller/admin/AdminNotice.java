package controller.admin;

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

import dao.admin.NoticeDao;
import dao.admin.NoticeDaoImpl;
import dto.NoticeDto;
import dto.otherDto.OtherNoticeDto;
import service.admin.NoticeService;
import service.admin.NoticeServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class AdminNotice
 */
@WebServlet("/admin/notice")
public class AdminNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminNotice() {
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
		String nNo = request.getParameter("nNo");
		String curPage = request.getParameter("page");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		if (uNo == null) {
		    request.setAttribute("loginErr", "로그인 후 이용해주세요");
		    String pageName = request.getRequestURI(); // 현재 페이지 경로
		    String queryString = request.getQueryString(); // 현재 페이지 queryString
		    request.setAttribute("redirect", pageName +"?"+queryString);
		    request.getRequestDispatcher("/common/errAlert.jsp").forward(request, response);
		    return;
		}
		NoticeService service = new NoticeServiceImpl();
		NoticeDao noticeDao = new NoticeDaoImpl();
		try {
			boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
			if (curPage != null) {
				PageInfo pageInfo = new PageInfo(Integer.parseInt(curPage));
				List<NoticeDto> topList = service.getTopList(uNo, keyword, sort);
				List<NoticeDto> noticeList = service.getList(uNo, keyword, sort, pageInfo);
				if (isAjax) {
					response.setContentType("application/json; charset=UTF-8");
					Gson gson = new Gson();
					Map<String, Object> resultMap = new HashMap<>();
					resultMap.put("topList", topList);
					resultMap.put("noticeList", noticeList);
					resultMap.put("loginUNo", uNo);
					resultMap.put("pageInfo", pageInfo);
					resultMap.put("keyword", keyword);
					resultMap.put("sort", sort);
					String result = gson.toJson(resultMap);
					response.getWriter().write(result);
					return;
				}
				request.setAttribute("topList", topList);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("loginUNo", uNo);
				String pageName = request.getRequestURI(); // 현재 페이지 경로
				request.setAttribute("pageName", pageName);
				request.getRequestDispatcher("/admin/adminNoticeList.jsp").forward(request, response);
				
			} else {
				Integer no = Integer.parseInt(nNo);
				NoticeDto notice = service.getDetail(no);				
				request.setAttribute("notice", notice);
				String uNm = noticeDao.selectUserNm(notice.getuNo());
				OtherNoticeDto prev = service.getOtherNo(no, uNo, "prev");
				OtherNoticeDto next = service.getOtherNo(no, uNo, "next");
				request.setAttribute("writer", uNm);
				request.setAttribute("loginUNo", uNo);
				request.setAttribute("prev", prev);
				request.setAttribute("next", next);
				String pageName = request.getRequestURI(); // 현재 페이지 경로
				request.setAttribute("pageName", pageName);
				request.getRequestDispatcher("/admin/adminNoticeDetail.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "목록 조회 중 오류가 발생했습니다.");
			request.getRequestDispatcher("/admin/noticeAlert.jsp").forward(request, response);
		}

	}

}
