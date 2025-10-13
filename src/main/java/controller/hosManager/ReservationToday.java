package controller.hosManager;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;
import dto.otherDto.ResPageResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class ReservationToday
 */
@WebServlet("/hosManager/reservationToday")
public class ReservationToday extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationToday() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 모든 회원 목록 조회
		int curPage = 1;
		
		// 오늘 있는 예약의 리스트를 받아온다
		ReservationService resService = new ReservationServiceImpl();
		HospitalService hosService = new HospitalServiceImpl();
		// 회원 번호를 같이 보내서 service에서 의사인지 병원관리자인지를 확인
		HttpSession session = request.getSession();
		Integer uNo = (Integer)session.getAttribute("uNo");
		String hosName = hosService.getHosName(uNo);
		ResPageResponseDto resList = resService.todayReservationList(uNo, curPage);
		
		// 오늘 날짜 가져오기
        LocalDate today = LocalDate.now();

        // 원하는 포맷 만들기
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 포맷 적용
        String formattedDate = today.format(formatter);
		
        request.setAttribute("hosName", hosName);
        request.setAttribute("today", formattedDate);
		request.setAttribute("resList", resList);
		
		request.setAttribute("navPath", "/ieum/hosManager/reservationToday");
		request.setAttribute("navPathName", "예약관리");
		request.setAttribute("navcurPage", "오늘예약");
		
		request.getRequestDispatcher("/hosManager/reservationToday.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
