package controller.myPage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import dto.otherDto.ShowDIaListToUser;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;

/**
 * Servlet implementation class SelectDiagnosis
 */
@WebServlet("/myPage/selectDia")
public class SelectDiagnosis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDiagnosis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer diaNo = Integer.parseInt(request.getParameter("diaNo"));
		
		DiagnosisService service = new DiagnosisServiceImpl();
		ShowDIaListToUser diaDto = service.selectDiaByNo(diaNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "번호에 해당하는 진단서", diaDto));
		response.getWriter().write(result);
		
	}

}
