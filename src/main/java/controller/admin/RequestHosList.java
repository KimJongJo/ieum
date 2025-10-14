package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.HospitalPageResponseDto;
import dto.otherDto.ResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class RequestHosList
 */
@WebServlet("/requestHos/page")
public class RequestHosList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestHosList() {
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
		int requestPage = 1;
		String page = request.getParameter("page");
		if (page != null && !page.isEmpty()) {
		    System.out.println("??");
		}

		HospitalService service = new HospitalServiceImpl();
		HospitalPageResponseDto pageDto;

		if(keyword != null && !keyword.isEmpty()) {
		    // 검색어가 있으면 검색용 메서드 호출
		    pageDto = service.hosWaitListByKeyword(requestPage, keyword, filter);
		} else {
		    // 검색어 없으면 전체 목록
		    pageDto = service.hosWaitList(requestPage, filter);
		}
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "요청 페이지를 담은 리스트", pageDto));
		response.getWriter().write(result);
		
	}

}
