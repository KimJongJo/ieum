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
 * Servlet implementation class diaHistory
 */
@WebServlet("/myPage/diaHistoryDate")
public class DiaHistoryDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaHistoryDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String date = request.getParameter("date");
        String offsetStr = request.getParameter("offset");
        String limitStr = request.getParameter("limit");

        int offset = (offsetStr != null) ? Integer.parseInt(offsetStr) : 0;
        int limit = (limitStr != null) ? Integer.parseInt(limitStr) : 3;

        HttpSession session = request.getSession();
        Integer uNo = (Integer)session.getAttribute("uNo");

        DiagnosisService service = new DiagnosisServiceImpl();
        List<ShowDIaListToUser> diaList = service.getUserDiaList(uNo, offset, limit, date);
        
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("date", date);
        paramMap.put("uNo", uNo);
        paramMap.put("offset", offset);
        paramMap.put("limit", limit);
        int totalCount = service.getTotalCountByDate(paramMap); // 총 데이터 수 가져오기

        // 더보기 버튼 표시 여부 계산
        boolean hasMore = (offset + diaList.size()) < totalCount;

        // 응답 객체 생성
        Map<String, Object> resMap = new HashMap<>();
        resMap.put("diaList", diaList);
        resMap.put("hasMore", hasMore);

        Gson gson = new Gson();
        String result = gson.toJson(new ResponseDto(true, "해당 날짜에 대한 진단서 목록", resMap));
        response.getWriter().write(result);
		
	}

}
