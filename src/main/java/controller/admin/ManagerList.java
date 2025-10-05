package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ManagerPageResponseDto;
import dto.otherDto.ResponseDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class ManagerList
 */
@WebServlet("/managerList/page")
public class ManagerList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String keyword = request.getParameter("keyword");
		String filter = request.getParameter("filter");
		int requestPage = Integer.parseInt(request.getParameter("page"));
		Integer state = Integer.parseInt(request.getParameter("state"));
		String role = request.getParameter("role");
		
		
		MemberService service = new MemberServiceImpl();
		ManagerPageResponseDto pageDto;
		
		
		
		if(keyword != null && !keyword.isEmpty()) {
			pageDto = service.managerListByKeyword(requestPage, keyword, filter, state, role);
		}else {
			pageDto = service.managerList(requestPage, filter, state, role);
		}
		
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "요청 페이지를 담은 리스트", pageDto));
		response.getWriter().write(result);
	}

}
