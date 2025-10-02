package controller.myPage;

import java.io.IOException;
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
@WebServlet("/myPage/diary/update")
public class DiaryUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		DiaryService service = new DiaryServiceImpl();
		HttpSession session = request.getSession();
	    Integer uNo = (Integer)session.getAttribute("uNo");
		String title = request.getParameter("title");
		Integer dNo = Integer.parseInt(request.getParameter("dNo"));
		try {
			if (title == null) {				
				DiaryDto diary = service.getDetail(dNo);
				request.setAttribute("diary", diary);
				Boolean hisYn = service.getHisYn(uNo);
				request.setAttribute("recentHistory", hisYn);
				request.getRequestDispatcher("/myPage/diaryUpdate.jsp").forward(request, response);
			} else {
				String content = request.getParameter("content");
				String emoji = request.getParameter("emoji");
				DiaryDto diary = new DiaryDto(title, content, emoji, dNo);
				service.update(diary);
				session.setAttribute("dNo", dNo);
				request.setAttribute("msg", "수정");
				request.getRequestDispatcher("/myPage/diarySucc.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
