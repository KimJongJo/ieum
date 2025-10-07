package controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.HosInfoDto;
import dto.otherDto.ResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class RequestHospital
 */
@WebServlet("/requestHos")
public class RequestHospital extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestHospital() {
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
		HosInfoDto hosInfo = service.hosInfo(hNo);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "병원 정보", hosInfo));
		
		response.getWriter().write(result);
		
	}

}
