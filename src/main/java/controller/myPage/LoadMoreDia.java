package controller.myPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import dto.otherDto.ShowDIaListToUser;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;

/**
 * Servlet implementation class LoadMoreDia
 */
@WebServlet("/myPage/loadMoreDia")
public class LoadMoreDia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadMoreDia() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
	    HttpSession session = request.getSession();
	    Integer uNo = (Integer) session.getAttribute("uNo");
	    if (uNo == null) {
	        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	        return;
	    }
	    
	    // offset, limit 파라미터 가져오기
	    int offset = 0;
	    int limit = 3; // 기본 3개
	    try {
	        offset = Integer.parseInt(request.getParameter("offset"));
	        limit = Integer.parseInt(request.getParameter("limit"));
	    } catch (NumberFormatException e) {
	        // 기본값 사용
	    }
	    
	    String date = request.getParameter("date");
	    
	    DiagnosisService service = new DiagnosisServiceImpl();
	    List<ShowDIaListToUser> diaList = service.getUserDiaList(uNo, offset, limit, date);
	    // 총 개수 구하기
	    int totalCount = service.getTotalCount(uNo);
	    
	    // hasMore 계산
	    boolean hasMore = (offset + diaList.size()) < totalCount;
	    
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("diaList", diaList);
	    resultMap.put("hasMore", hasMore);
	    
	    Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "진단서 내용", resultMap));
		
		response.getWriter().write(result);
	}

}
