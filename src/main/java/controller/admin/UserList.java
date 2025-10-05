package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.MemberPageResponseDto;
import dto.otherDto.ResponseDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class userList
 */
@WebServlet("/userList/page")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String keyword = request.getParameter("keyword"); // 검색어 가져오기
		String filter = request.getParameter("filter"); // 정렬 조건 가져오기
		int requestPage = Integer.parseInt(request.getParameter("page"));
		Integer state = Integer.parseInt(request.getParameter("state"));

		MemberService service = new MemberServiceImpl();
		MemberPageResponseDto pageDto;

		if(keyword != null && !keyword.isEmpty()) {
		    // 검색어가 있으면 검색용 메서드 호출
		    pageDto = service.memberListByKeyword(requestPage, keyword, filter, state);
		} else {
		    // 검색어 없으면 전체 목록
		    pageDto = service.userList(requestPage, filter, state);
		}
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "요청 페이지를 담은 리스트", pageDto));
		response.getWriter().write(result);
	}

}
