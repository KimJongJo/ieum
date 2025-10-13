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

import org.apache.catalina.tribes.group.Response;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import dto.otherDto.ShowDIaListToUser;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;

/**
 * Servlet implementation class DiagnosisHistory
 */
@WebServlet("/myPage/diagnosisHistory")
public class DiagnosisHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiagnosisHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    HttpSession session = request.getSession();
	    Integer uNo = (Integer) session.getAttribute("uNo");

	    // 한 페이지에 보여줄 데이터 수
	    int limit = 3;
	    int currentPage = 1; // 첫 로딩 페이지

	    // offset 계산
	    int offset = (currentPage - 1) * limit;

	    // 서비스 호출
	    DiagnosisService service = new DiagnosisServiceImpl();
	    List<ShowDIaListToUser> diaList = service.getUserDiaList(uNo, offset, limit, "");

	    
	    // 총 데이터 수 가져오기
	    int totalCount = service.getTotalCount(uNo); // 새로 서비스 메소드 필요
	    boolean hasMore = totalCount > limit; // 더보기 버튼 표시 여부
	    
	    // request에 데이터 저장
	    request.setAttribute("diaList", diaList);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("limit", limit);
	    request.setAttribute("totalCount", totalCount);
	    request.setAttribute("hasMore", hasMore);
	    
		request.setAttribute("navPath", "/ieum/calender");
		request.setAttribute("navPathName", "마이페이지");
		request.setAttribute("navcurPage", "진단 기록");
	    
		request.getRequestDispatcher("/myPage/diagnosisHistory.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer diaNo = Integer.parseInt(request.getParameter("diaNo"));
		
		DiagnosisService service = new DiagnosisServiceImpl();
		ShowDIaListToUser diaInfo = service.getUserDiaDetail(diaNo);
		
		// 성별 '남','여'로 재정의
		if(diaInfo.getGender().equals("MALE")) {
			diaInfo.setGender("남");
		}else {
			diaInfo.setGender("여");
		}
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "진단서 내용", diaInfo));
		
		response.getWriter().write(result);
	}

}

