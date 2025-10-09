package controller.hosManager;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
 * Servlet implementation class UpdateHospitalInfo
 */
@WebServlet("/hosManager/updateHospitalInfo")
public class UpdateHospitalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHospitalInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HospitalService service = new HospitalServiceImpl();
		Integer hNo = Integer.parseInt(request.getParameter("hNo"));
		String hLink = request.getParameter("hLink");
		String transferInfo = request.getParameter("transferInfo");
		String newsTitle = request.getParameter("newsTitle");
		String newsContent = request.getParameter("newsContent");
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("hNo", hNo);
		map.put("hLink", hLink);
		map.put("transferInfo", transferInfo);
		map.put("newsTitle", newsTitle);
		map.put("newsContent", newsContent);
		
		service.updateHosInfo(map);
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "성공"));
		response.getWriter().write(result);
		
		
	}

}
