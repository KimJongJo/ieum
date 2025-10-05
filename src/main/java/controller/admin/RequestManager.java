package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ManagerInfoDto;
import dto.otherDto.ResponseDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class RequestManager
 */
@WebServlet("/requestManager")
public class RequestManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestManager() {
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
		MemberService service = new MemberServiceImpl();
		ManagerInfoDto member = service.managerInfoAndFile(uNo);
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "병원관리자 정보", member));
		
		response.getWriter().write(result);
		
	}

}
