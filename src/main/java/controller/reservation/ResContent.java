package controller.reservation;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.ReservationDto;
import dto.otherDto.HosDetailDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class ResContent
 */
@WebServlet("/reservation/content")
public class ResContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResContent() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/reservation/resContent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		Integer hNo = (Integer) session.getAttribute("hNo");
//		Integer uNo = 6;
//		Integer hNo = 20;
		
		System.out.println("회원번호 : " + uNo);
		System.out.println("병원번호 : " + hNo);
		
		String action = request.getParameter("action");
		System.out.println("resContent 받은 action: " + action);
		
		if ("doReservation".equals(action)) {
			Integer mNo = Integer.parseInt(request.getParameter("mNo"));
			String rDate = request.getParameter("rDate");
			LocalDate rDates = LocalDate.parse(rDate);
			String rTimeStr = request.getParameter("rTime");
			LocalTime rTime = LocalTime.parse(rTimeStr);
			String rDay = request.getParameter("rDay");
			String rContent = request.getParameter("rContent");
			
			System.out.println("살려줘>>>"+mNo+rDay+uNo);
			
			HospitalService hosService = new HospitalServiceImpl();
			MemberService mService = new MemberServiceImpl();
			
			try {
				HosDetailDto hosd = hosService.getDetail(hNo);
				request.setAttribute("hosd", hosd);
				MemberDto memd = mService.selectResUser(uNo);
				request.setAttribute("memd", memd);				
				request.setAttribute("mNo", mNo);
				request.setAttribute("rDate", rDate);
				request.setAttribute("rTime", rTime);
				request.setAttribute("rDay", rDay);
				request.setAttribute("rContent", rContent);
				
				request.getRequestDispatcher("/reservation/resContent.jsp").forward(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}


		} else if ("ResInsert".equals(action)) {

		    Integer mNo = Integer.parseInt(request.getParameter("mNo"));
		    LocalDate rDate = LocalDate.parse(request.getParameter("rDate"));
		    LocalTime rTime = LocalTime.parse(request.getParameter("rTime"));
		    String rDay = request.getParameter("rDay");
		    String rContent = request.getParameter("rContent");
		    String actName = request.getParameter("actName");
		    String actTel = request.getParameter("actTel");			
			
			String rStatus = "WAITING";
			

			ReservationService rService = new ReservationServiceImpl();

			try {
				ReservationDto doRes = new ReservationDto(uNo,hNo,mNo,rDate,rTime,rContent,actName,actTel,rStatus,rDay);
				rService.doReservation(doRes);
			
			    response.getWriter().write("success");
			} catch (Exception e) {
				e.printStackTrace();

			}

		}

	}
}
