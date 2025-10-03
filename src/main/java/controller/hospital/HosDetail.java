package controller.hospital;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

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
		Integer hNo = (Integer) session.getAttribute("hNo");

		HospitalService hosService = new HospitalServiceImpl();
		MemberService mService = new MemberServiceImpl();

		try {
			request.setAttribute("hNo", hNo);
			HosDetailDto hosd = hosService.getDetail(hNo);
			request.setAttribute("hosd", hosd);
			List<MemberDto> docList = mService.DoclistBy2(hNo);
			request.setAttribute("docList", docList);

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

		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		System.out.println("받은 action: " + action);
		
		
		if ("goHosDetail".equals(action)) {
			// 병원 디테일		
			Integer uNo = (Integer) session.getAttribute("uNo");
			Integer hNo = Integer.parseInt(request.getParameter("hNo"));
			
			session.setAttribute("uNo", uNo);
			session.setAttribute("hNo", hNo);

			response.setStatus(HttpServletResponse.SC_OK);
		
		} else if ("getResDate".equals(action)) {
			// 예약하기			
			Integer mNo = Integer.parseInt(request.getParameter("mNo"));
			String rDate = request.getParameter("rDate");
			
			System.out.println("mNo>>>>"+mNo);
			System.out.println("rDate>>>>"+rDate);
			ReservationService rService = new ReservationServiceImpl();

			try {
				List<ReservationDto> getTimeFromRes = rService.getTimeFromRes(mNo, rDate);
				System.out.println("comtroller>>>>>"+getTimeFromRes);
				
				Gson gson = new Gson();
				String jsonStr = gson.toJson(getTimeFromRes);
				
				response.setContentType("application/json; charset=UTF-8");
				response.setCharacterEncoding("urf-8");
				response.getWriter().write(jsonStr);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
