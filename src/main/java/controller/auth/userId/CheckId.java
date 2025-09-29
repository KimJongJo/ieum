package controller.auth.userId;

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
 * Servlet implementation class CheckId
 */
@WebServlet("/auth/checkId")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		MemberService service = new MemberServiceImpl();
		
		ResponseDto responseDto;
		boolean check = service.checkUserId(userId);
		
		if(check) {
			responseDto = new ResponseDto(false, "이미 존재하는 아이디 입니다.");
		}else {
			responseDto = new ResponseDto(true, "사용가능한 아이디 입니다.");
		}
		
		Gson gson = new Gson();
		String result = gson.toJson(responseDto);
		
		response.getWriter().write(result);
		
	}

}
