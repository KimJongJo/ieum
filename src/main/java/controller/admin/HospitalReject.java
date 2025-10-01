package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.ResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;


/**
 * Servlet implementation class HospitalApprove
 */
@WebServlet("/admin/reject")
public class HospitalReject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalReject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer hNo = Integer.parseInt(request.getParameter("hNo"));
		
		HospitalService service = new HospitalServiceImpl();
		service.reject(hNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "병원 거부"));
		response.getWriter().write(result);
		
	}

}
