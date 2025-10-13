package controller.social;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.FileDto;
import dto.MemberDto;
import dto.otherDto.ResponseDto;
import service.file.FileService;
import service.file.FileServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class socialCheckPw
 */
@WebServlet("/social/checkPw")
public class socialCheckPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public socialCheckPw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		MemberService service = new MemberServiceImpl();
		
		boolean checkPw = service.checkPw(email, password);
		Gson gson = new Gson();
		String result;
		
		// 비밀번호가 일치하면 병합
		if(checkPw) {
			
			try {
				MemberDto memberDto = service.socialUpdate(email, id);
				HttpSession session = request.getSession();
				FileService fileService = new FileServiceImpl();
				
				FileDto fileDto = fileService.getFile(memberDto.getFileNo());
				String filePath = fileDto.getFilePath() + "/" + fileDto.getFileName();
				
				session.setAttribute("profile", filePath);
				session.setAttribute("uNo", memberDto.getuNo());
				result = gson.toJson(new ResponseDto(true, "계정 병합 완료"));
			}catch(Exception e) {
				result = gson.toJson(new ResponseDto(false, "병합하는중 오류 발생"));
			}
			
		}else { // 아니라면 비밀번호가 일치하지 않는다는 알림
			result = gson.toJson(new ResponseDto(false, "비밀번호가 일치하지 않습니다."));
		}
		
		response.getWriter().write(result);
		

	}

}
