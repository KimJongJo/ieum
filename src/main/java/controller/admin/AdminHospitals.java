package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.otherDto.HosInfoDto;
import dto.otherDto.HospitalPageResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class AdminHospitals
 */
@WebServlet("/admin/adminHospitals")
public class AdminHospitals extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHospitals() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 모든 회원 목록 조회
		int curPage = 1;
		String filter = "none";
		String status = "ACTIVE";
		
		// 처음 기본값 -> 운영중인 병원 status가 ACTIVE 인 병원 목록
		HospitalService service = new HospitalServiceImpl();
		HospitalPageResponseDto<HosInfoDto> hosList = service.hosList(curPage, filter, status);
		request.setAttribute("hosList", hosList);
		
		request.getRequestDispatcher("/admin/adminHospitals.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
