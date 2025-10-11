package controller.myPage;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.otherDto.ReservationInfoDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class ResDetail
 */
@WebServlet("/myPage/reservation/detail")
public class ResDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		Properties prop = new Properties();
		HttpSession session = request.getSession();
		Integer uNo = (Integer)session.getAttribute("uNo");
		Integer rNo = (Integer)session.getAttribute("rNo");
		String rStatus = (String) session.getAttribute("rStatus");
		String statusStr = "예약";
		
		if("WAITING".equals(rStatus)) {
			statusStr = "다가오는 예약";
		}else if ("COMPLETE".equals(rStatus)) {
			statusStr = "지난 예약";
		}
		
		ReservationService rService = new ReservationServiceImpl();
		MemberService mService = new MemberServiceImpl();
		
		try {
			ReservationInfoDto rid = rService.getResDetail(rNo);
			MemberDto md = mService.selectResUser(uNo);
			session.setAttribute("rid", rid);
			session.setAttribute("statusStr", statusStr);
			
			String actName = rid.getActName();
			String actTel = rid.getActTel();			
			if(actName == null || actName.trim().isEmpty()) {
				actName = md.getUsername();
			}		
			if(actTel == null || actTel.trim().isEmpty()) {
				actTel = md.getuTel();
			}
			
			request.setAttribute("actName", actName);
			request.setAttribute("actTel", actTel);
			
			try (InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
				// 지도 위한 카카오 앱 키
				prop.load(is);
				String kakaoKey = prop.getProperty("kakao.api.key");
				request.setAttribute("kakaoKey", kakaoKey);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("/myPage/resDetail.jsp").forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		
		if("getComResDetail".equals(action)||"getRecResDetail".equals(action)) {
			Integer rNo = Integer.parseInt(request.getParameter("rNo"));
			String rStatus = request.getParameter("rStatus");
			
			session.setAttribute("rNo", rNo);
			session.setAttribute("rStatus", rStatus);
			
			response.setStatus(HttpServletResponse.SC_OK);
			
		} 
		
	}

}
