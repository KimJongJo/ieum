package controller.myPage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import service.myPage.ProfileInfoService;
import service.myPage.ProfileInfoServiceImpl;

/**
 * Servlet implementation class ProfileInfo
 */
@WebServlet("/pInfo")
public class ProfileInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
        Integer uNo = (Integer) session.getAttribute("uNo");
		ProfileInfoService service = new ProfileInfoServiceImpl();
		try {
			MemberDto memberDto = service.selectProfileView(uNo);
			System.out.println(memberDto);
			request.setAttribute("member", memberDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("myPage/profileInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("pInfo");
	}

}
