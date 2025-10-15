package controller.hosManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class DiaCompleted
 */
@WebServlet("/hosManager/diaCompleted")
public class DiaCompleted extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaCompleted() {
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
		ReservationService resService = new ReservationServiceImpl();
		
		Integer rNo = service.getResNo(dNo);
		
		service.diaCompleted(dNo);
		resService.resCompleted(rNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "진료 완료"));
		
		response.getWriter().write(result);
		
		
	}

}
