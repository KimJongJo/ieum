package controller.hosManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.PatientDto;
import dto.otherDto.ResponseDto;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;

/**
 * Servlet implementation class PatientMyDiaList
 */
@WebServlet("/hosManager/patientMyDiaList")
public class PatientMyDiaList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientMyDiaList() {
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
		
		// 환자 번호, 생년월일, 연락처, 이름, 성별, 주소
		// 상담내용
		// 진단기록 리스트
		// 다이어리 리스트(환자가 만약 다이어리 공개를 거부했을땐 가져오지 않음)
		DiagnosisService service = new DiagnosisServiceImpl();
		PatientDto patientDto = service.getPatientDtoByDiaNo(diaNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "환자 정보", patientDto));
		response.getWriter().write(result);
		
	}

}
