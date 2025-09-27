package controller.common.findPw;

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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/auth/changePw")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
		String password = request.getParameter("password");
		
		MemberService service = new MemberServiceImpl();
		boolean change = service.changePw(userId, password);
		Gson gson = new Gson();
		ResponseDto resDto;
		String result;
		
		if(change) { // 비밀번호 변경함
			resDto = new ResponseDto(true, "비밀번호가 변경되었습니다.");
		}else { // 기존 사용 한 비밀번호
			resDto = new ResponseDto(false, "현재 사용중인 비밀번호입니다.");
		}
		result = gson.toJson(resDto);
		
		response.getWriter().write(result);
		
	}

}
