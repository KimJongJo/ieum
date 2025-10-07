package controller.hosManager;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;

/**
 * Servlet implementation class PastDiagnosis
 */
@WebServlet("/hosManager/pastDia")
public class PastDiagnosis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PastDiagnosis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer dNo = Integer.parseInt(request.getParameter("dNo"));
		
		DiagnosisService service = new DiagnosisServiceImpl();
		Map<String, Object> map = service.getDiaInfo(dNo);
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "과거 진단서 상세", map));
		
		response.getWriter().write(result);
		
		
	}

}
