package controller.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.otherDto.HospitalDocDto;
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
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		ReservationService rService = new ReservationServiceImpl();
		MemberService mService = new MemberServiceImpl();
		
		try {
			Integer rNo = rService.getLastRes(uNo);
			ReservationInfoDto resDetail = rService.getResDetail(rNo);
			MemberDto resUser = mService.selectResUser(uNo);
			
			request.setAttribute("resDetail", resDetail);
			request.setAttribute("resUser", resUser);
			
			String actName = resDetail.getActName();
			String actTel = resDetail.getActTel();			
			if(actName == null || actName.trim().isEmpty()) {
				actName = resUser.getUsername();
			}		
			if(actTel == null || actTel.trim().isEmpty()) {
				actTel = resUser.getuTel();
			}
			
			request.setAttribute("actName", actName);
			request.setAttribute("actTel", actTel);
			
			request.getRequestDispatcher("/reservation/resSummary.jsp").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
