package controller.myPage;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;

/**
 * Servlet implementation class DiaListToCalendar
 */
@WebServlet("/myPage/diaList/event")
public class DiaListToCalendar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaListToCalendar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 풀캘린더에 전달할 값
		// id : 진단서 번호
		// title : 병원 이름
		// start : 진료 날짜
		// allDay : 하루 단위 이벤트인데 시간까지 필요없어서 true로 넣음
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		DiagnosisService service = new DiagnosisServiceImpl();
		HttpSession session = request.getSession();
		Integer uNo = (Integer)session.getAttribute("uNo");
		List<Map<String, Object>> listMap = service.selectAll(uNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(listMap);
		response.getWriter().write(result);
		
	}

}
