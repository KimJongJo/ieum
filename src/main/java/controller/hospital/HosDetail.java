package controller.hospital;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.otherDto.HosDetailDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Integer hNo = (Integer) session.getAttribute("hNo");
		HospitalService hosService = new HospitalServiceImpl();
		
		try {
			HosDetailDto hosd = hosService.getDetail(hNo);
			request.setAttribute("hosd", hosd);
			
			request.getRequestDispatcher("/hospital/hosDetail.jsp").forward(request, response);
		}catch (Exception e) {
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
		Integer uNo = (Integer)session.getAttribute("uNo");
		Integer hNo = Integer.parseInt(request.getParameter("hNo"));
		
		//세션에 저장
		session.setAttribute("uNo", uNo);
		session.setAttribute("hNo", hNo);
		
		//같은 컨트롤러의 get으로 이동
		response.sendRedirect(request.getContextPath()+"/hospital/detail");
		
	}

}
