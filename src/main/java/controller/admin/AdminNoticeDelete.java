package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.admin.NoticeService;
import service.admin.NoticeServiceImpl;

/**
 * Servlet implementation class DiaryWrite
 */
@WebServlet("/admin/notice/delete")
public class AdminNoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminNoticeDelete() {
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
		NoticeService service = new NoticeServiceImpl ();
		String nNO = request.getParameter("nNo");
		try {
			boolean delYn = service.delete(Integer.parseInt(nNO));
			if (delYn) {
				request.setAttribute("msg", "삭제");
				request.getRequestDispatcher("/admin/noticeAlert.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
