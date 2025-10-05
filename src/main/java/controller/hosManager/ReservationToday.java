package controller.hosManager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ReservationDto;
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
		
		// 오늘 있는 예약의 리스트를 받아온다
		ReservationService resService = new ReservationServiceImpl();
		List<ReservationDto> resList = resService.todayReservationList();
		
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
