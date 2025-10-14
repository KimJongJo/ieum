package controller.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AllCommunityDto;
import dto.NoticeDto;
import service.admin.NoticeService;
import service.admin.NoticeServiceImpl;
import service.allCommunity.AllCommunityService;
import service.allCommunity.AllCommunityServiceImpl;

/**
 * Servlet implementation class MainSearch
 */
@WebServlet("/search")
public class MainSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainSearch() {
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
		String keyword = request.getParameter("keyword");
		String tab = request.getParameter("tab");
		NoticeService nService = new NoticeServiceImpl();
		AllCommunityService cService = new AllCommunityServiceImpl();
		try {
			if (keyword == null) keyword = "";
			keyword = keyword.trim();
			// 공지사항
			List<NoticeDto> searchNoticeList = nService.getSearchList(keyword);
			Integer searchNoticeCnt = nService.getSearchCnt(keyword);
			request.setAttribute("noticeList", searchNoticeList);
			request.setAttribute("noticeCnt", searchNoticeCnt);
			// 커뮤니티
			List<AllCommunityDto> searchCommuList = cService.getSearchList(keyword);
			Integer searchCommuCnt = cService.getSearchCnt(keyword);
			request.setAttribute("commuList", searchCommuList);
			request.setAttribute("commuCnt", searchCommuCnt);

			request.setAttribute("allCnt", searchNoticeCnt + searchCommuCnt);
			request.setAttribute("keyword", keyword);
			request.setAttribute("tab", tab);			
			
			request.setAttribute("navPath", "/ieum/search");
			request.setAttribute("navPathName", "메인");
			request.setAttribute("navcurPage", "검색결과");
			request.getRequestDispatcher("common/main/mainSearch.jsp").forward(request, response);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
