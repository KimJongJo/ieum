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
		NoticeService service = new NoticeServiceImpl();
		NoticeDao noticeDao = new NoticeDaoImpl();
		try {
			boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
			if (curPage != null) {
				PageInfo pageInfo = new PageInfo(Integer.parseInt(curPage));
				List<NoticeDto> topList = service.getList(uNo, keyword, sort, pageInfo, 1);
				List<NoticeDto> noticeList = service.getList(uNo, keyword, sort, pageInfo, 0);
				if (isAjax) {
					response.setContentType("application/json; charset=UTF-8");
					Gson gson = new Gson();
					Map<String, Object> resultMap = new HashMap<>();
					resultMap.put("topList", topList);
					resultMap.put("noticeList", noticeList);
					resultMap.put("loginUNo", uNo);
					String result = gson.toJson(resultMap);
					response.getWriter().write(result);
					return;
				}
				request.setAttribute("topList", topList);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("loginUNo", uNo);
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
				request.getRequestDispatcher("/admin/adminNoticeDetail.jsp").forward(request, response);
			}
		} catch (Exception e) {

		}

	}

}
