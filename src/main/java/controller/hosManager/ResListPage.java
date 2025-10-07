package controller.hosManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResPageResponseDto;
import dto.otherDto.ResponseDto;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class ResListPage
 */
@WebServlet("/resList/page")
public class ResListPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResListPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer page = Integer.parseInt(request.getParameter("page"));
		String keyword = request.getParameter("keyword");
		Integer uNo = Integer.parseInt(request.getParameter("uNo"));
		
		
		
		ReservationService service = new ReservationServiceImpl();
		ResPageResponseDto pageDto;
		
		if(keyword != null && !keyword.isEmpty()) {
		    // 검색어가 있으면 검색용 메서드 호출
		    pageDto = service.todayReservationByKeywordList(page, keyword, uNo);
		} else {
		    // 검색어 없으면 전체 목록
		    pageDto = service.todayReservationList(uNo, page);
		}
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "요청 페이지를 담은 리스트", pageDto));
		response.getWriter().write(result);
		
		
		
	}

}
