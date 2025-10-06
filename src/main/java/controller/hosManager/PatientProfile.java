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
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class PatientProfile
 */
@WebServlet("/hosManager/patientProfile")
public class PatientProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer rNo = Integer.parseInt(request.getParameter("rNo"));
		
		ReservationService service = new ReservationServiceImpl();
		Map<String, Object> map = service.patientProfile(rNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "환자 프로필", map));
		
		response.getWriter().write(result);		
		
		
	}

}
