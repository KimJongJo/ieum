package controller.myPage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import service.myPage.PassModifyService;
import service.myPage.PassModifyServiceImpl;
import service.myPage.ProfileInfoService;
import service.myPage.ProfileInfoServiceImpl;

/**
 * Servlet implementation class PassModify
 */
@WebServlet("/pModify")
public class PassModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("myPage/passModify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int uNo = 1; // 실제로는 세션에서 가져오는 것이 안전
        String currentId = request.getParameter("current-pass");
        String newPass = request.getParameter("new-pass");
        String confirmPass = request.getParameter("confirm-pass");
        String message = "";

        PassModifyService passModifyService = new PassModifyServiceImpl();
        ProfileInfoService profileService = new ProfileInfoServiceImpl();

        try {
            // 1. 입력된 아이디 확인
            boolean isIdMatch = passModifyService.checkCurrentId(uNo, currentId);

            if (!isIdMatch) {
                message = "아이디가 일치하지 않습니다.";
                request.setAttribute("message", message);
                request.getRequestDispatcher("myPage/passModify.jsp").forward(request, response);
            } else if (!newPass.equals(confirmPass)) {
                message = "신규 비밀번호와 확인 비밀번호가 일치하지 않습니다.";
                request.setAttribute("message", message);
                request.getRequestDispatcher("myPage/passModify.jsp").forward(request, response);
            } else {
                // 비밀번호 변경
                passModifyService.updatePassword(uNo, newPass);
                
                // 변경 후 회원 정보 다시 조회
                MemberDto memberDto = profileService.selectProfileView(uNo);
                request.getSession().setAttribute("member", memberDto);

	             // 메시지를 세션에 저장 후 profileInfo.jsp로 리다이렉트
	                HttpSession session = request.getSession();
	                session.setAttribute("message", "비밀번호가 정상적으로 변경되었습니다.");
	                response.sendRedirect(request.getContextPath() + "/pInfo");
	                return; // redirect 후 코드 실행 방지
            }

        } catch (Exception e) {
            e.printStackTrace();
            message = "오류가 발생했습니다.";
            request.setAttribute("message", message);
            request.getRequestDispatcher("myPage/passModify.jsp").forward(request, response);
        }
	}

}
