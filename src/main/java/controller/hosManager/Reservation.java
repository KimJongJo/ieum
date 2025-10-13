package controller.hosManager;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.otherDto.ResPageResponseDto;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/hosManager/reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 모든 회원 목록 조회
		int curPage = 1;
		HttpSession session = request.getSession();
		Integer uNo = (Integer)session.getAttribute("uNo");
		
		// 과거 자신이(의사) 진단했던 기록들을 불러오기
		DiagnosisService diaService = new DiagnosisServiceImpl();
		HospitalService hosService = new HospitalServiceImpl();
		
		String hosName = hosService.getHosName(uNo);
		ResPageResponseDto resList = diaService.myDianosisList(uNo, curPage, "");
        request.setAttribute("hosName", hosName);
		request.setAttribute("resList", resList);
		
		request.setAttribute("navPath", "/ieum/hosManager/reservation");
		request.setAttribute("navPathName", "예약관리");
		request.setAttribute("navcurPage", "예약기록");
		
		request.getRequestDispatcher("/hosManager/reservation.jsp").forward(request, response);
		
	}

}
