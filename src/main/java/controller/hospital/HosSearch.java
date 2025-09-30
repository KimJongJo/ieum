package controller.hospital;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import dto.otherDto.HospitalListDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;
import util.PageInfo;

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/hospital/hosSearch.jsp").forward(request, response);
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String jsonParam = request.getParameter("param");
		
		try {
			System.out.println(jsonParam);
			JSONParser parser = new JSONParser();
			JSONObject jobj = (JSONObject)parser.parse(jsonParam);
			String keyword = (String)jobj.get("keyword");
			String city = (String)jobj.get("city");
			String gungu = (String)jobj.get("gungu");
			Long page = (Long)jobj.get("page");

			JSONArray categoryNameObj = (JSONArray) jobj.get("categoryName");
			List<String> categoryNo = new ArrayList<>();
			for(int i=0; i<categoryNameObj.size(); i++) {
				categoryNo.add((String)categoryNameObj.get(i));
			}

			System.out.println("==== Request Parameters ====");
			System.out.println("keyword: " + keyword);
			System.out.println("categoryName: " + categoryNo);
			System.out.println("city: " + city);
			System.out.println("gungu: " + gungu);
			
			HosSearchDto hsd = new HosSearchDto();
			hsd.setKeyword(keyword);
			hsd.setCategoryName(categoryNo);
			hsd.setCity(city);
			hsd.setGungu(gungu);			
			PageInfo pageInfo = new PageInfo((int)page.longValue());
			HospitalService hService = new HospitalServiceImpl();
			List<HosSearchListDto> hoslist = hService.listByFilter(hsd,pageInfo);
			
			HospitalListDto hospitalListDto = new HospitalListDto();
			hospitalListDto.setPageInfo(pageInfo);
			hospitalListDto.setHosSearchDto(hoslist);
			
			
			System.out.println("hoslist.size(): " + hoslist.size());
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(hospitalListDto);
			
			response.setContentType("application/json; charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(jsonStr);			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
