package controller.hospital;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
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

import dto.ReservationDto;
import dto.otherDto.HospitalDetailDto;
import dto.otherDto.HospitalDocDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import service.reservation.ReservationService;
import service.reservation.ReservationServiceImpl;

/**
 * Servlet implementation class HosDetail
 */
@WebServlet("/hospital/detail")
public class HosDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HosDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		Integer hNo = Integer.parseInt(request.getParameter("hNo"));
		session.setAttribute("hNo", hNo);
		
		Properties prop = new Properties();
		
		HospitalService hosService = new HospitalServiceImpl();
		MemberService mService = new MemberServiceImpl();

		try {
			HospitalDetailDto hosDetail = hosService.getDetail(hNo, uNo);
			request.setAttribute("hosDetail", hosDetail);
			List<HospitalDocDto> docList = mService.DoclistBy2(hNo);
			request.setAttribute("docList", docList);
			
			try (InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
				// 지도 위한 카카오 앱 키
				prop.load(is);
				String kakaoKey = prop.getProperty("kakao.api.key");
				request.setAttribute("kakaoKey", kakaoKey);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("/hospital/hosDetail.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		
		if ("getResDate".equals(action)) {
			// 예약하기
			Integer mNo = Integer.parseInt(request.getParameter("mNo"));
			String rDate = request.getParameter("rDate");
			ReservationService rService = new ReservationServiceImpl();

			try {
				List<ReservationDto> getTimeFromRes = rService.getTimeFromRes(mNo, rDate);
				
				Gson gson = new GsonBuilder()
			            .registerTypeAdapter(LocalDate.class, 
			                (JsonSerializer<LocalDate>) (src, typeOfSrc, context) -> new JsonPrimitive(src.toString()))
			            .registerTypeAdapter(LocalTime.class, 
			                (JsonSerializer<LocalTime>) (src, typeOfSrc, context) -> new JsonPrimitive(src.toString()))
			            .create();
				
				String jsonStr = gson.toJson(getTimeFromRes);
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().write(jsonStr);
			
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
