package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class UserState
 */
@WebServlet("/userState")
public class UserState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserState() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer uNo = Integer.parseInt(request.getParameter("uNo"));
		Integer stateCode = Integer.parseInt(request.getParameter("stateCode"));
		
		MemberService service = new MemberServiceImpl();
		service.userState(uNo, stateCode);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "회원 상태 변경 완료"));
		response.getWriter().write(result);
		
		
	}

}
