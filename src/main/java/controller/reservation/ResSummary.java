package controller.reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.ReservationDto;
import dto.otherDto.ReservationInfoDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class ResSummary
 */
@WebServlet("/reservation/summary")
public class ResSummary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResSummary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
//		Integer uNo = (Integer) session.getAttribute("uNo");
		Integer uNo = 6;
		
		ReservationService rService = new ReservationServiceImpl();
		MemberService mService = new MemberServiceImpl();
		
		try {
			Integer rNo = rService.getLastRes(uNo);
			ReservationInfoDto nowRes = rService.getNowRes(uNo, rNo);
			Integer mNo = rService.getDocMno(rNo);
			MemberDto resDoc = mService.getresDoc(mNo);
			
			request.setAttribute("nowRes", nowRes);
			request.setAttribute("resDoc", resDoc);
			
			request.getRequestDispatcher("/reservation/resSummary.jsp").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
