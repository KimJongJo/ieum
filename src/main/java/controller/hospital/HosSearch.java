package controller.hospital;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.HospitalDto2;
import dto.otherDto.HosSearchDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class HosSearch
 */
@WebServlet("/hospital/search")
public class HosSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String keyword = request.getParameter("keyword");
		String[] categoryArr = request.getParameterValues("categoryName");
		List<String> categoryName = categoryArr !=null? Arrays.asList(categoryArr): new ArrayList<>();
		String city = request.getParameter("city");
		String gungu = request.getParameter("gungu");
		int offset = 0;
		int limit = 8;
		try {
			offset = Integer.parseInt(request.getParameter("offset"));
		}catch (Exception e) {}
		
		try {
			limit = Integer.parseInt(request.getParameter("limit"));
		}catch (Exception e) {}
		
		HosSearchDto hsd = new HosSearchDto();
		hsd.setKeyword(keyword);
		hsd.setCategoryName(categoryName);
		hsd.setCity(city);
		hsd.setGungu(gungu);
		hsd.setOffset(offset);
		hsd.setLimit(limit);
		
		try {
			
			HospitalService hService = new HospitalServiceImpl();
			List<HospitalDto2> hoslist = hService.listByFilter(hsd);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(hoslist);
			
			response.setContentType("application/json; charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(jsonStr);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("eeeeee");
		}
		
		
		
	}


}
