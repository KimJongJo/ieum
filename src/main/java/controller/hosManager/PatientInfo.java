package controller.hosManager;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class PatientInfo
 */
@WebServlet("/hosManager/patientInfo")
public class PatientInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 예약 번호를 가져와서 각각 가져와야 할 정보
		
		// 환자 : 환자번호(uNo), 생년월일(birthDate), 연락처(uTel), 
		//        이름(username), 성별(gender), 주소(address)
		// 진단서 : 진단서번호(diagnosisNo)
		// 예약 : 진료일시(rDate)
		// 병원 : 병웜이름(hNm), 병원주소(hAddress)
		// 의사 : 의사이름(username), 전공(major)
		Integer rNo = Integer.parseInt(request.getParameter("rNo"));
		
		ReservationService service = new ReservationServiceImpl();
		Map<String, Object> map = service.selectDiaByRNo(rNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "진단서 내용 정보", map));
		
		response.getWriter().write(result);
		
	}

}
