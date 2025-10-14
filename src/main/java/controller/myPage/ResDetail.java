package controller.myPage;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializer;

import dto.MemberDto;
import dto.ReservationDto;
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
			
			request.setAttribute("navPath", "/ieum/calender");
			request.setAttribute("navPathName", "마이페이지");
			request.setAttribute("navPath2", "/ieum/myPage/reservation/list");
			request.setAttribute("navPathName2", "예약내역");
			request.setAttribute("navcurPage", "예약 상세");
			
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
			
		} else if ("resUpdate".equals(action)) {
			//예약 변경
			Integer rNo = Integer.parseInt(request.getParameter("rNo"));
			
			ReservationService rService = new ReservationServiceImpl();

			try {
				ReservationDto resd = rService.selectRes(rNo);
				Map<String, Object> resChage = new HashMap<>();
				resChage.put("mNo",resd.getmNo());
				resChage.put("rDate", resd.getrDate());
				resChage.put("rTime", resd.getrTime());
				resChage.put("rContent", resd.getrContent());

				Gson gson = new GsonBuilder()
						.registerTypeAdapter(LocalDate.class,
								(JsonSerializer<LocalDate>) (src, typeOfSrc,
										context) -> new JsonPrimitive(src.toString()))
						.registerTypeAdapter(LocalTime.class, (JsonSerializer<LocalTime>) (src, typeOfSrc,
								context) -> new JsonPrimitive(src.toString()))
						.create();

				String jsonStr = gson.toJson(resChage);
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().write(jsonStr);

			} catch (Exception e) {
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			}
		}
		
	}

}
