package controller.hospital;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import dto.otherDto.HospitalDetailDto;
import dto.otherDto.HospitalListDto;
import dto.otherDto.HospitalSearchDto;
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
		response.setCharacterEncoding("utf-8");
		String jsonParam = request.getParameter("param");
		
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		try {
			JSONParser parser = new JSONParser();
			JSONObject jobj = (JSONObject)parser.parse(jsonParam);
			String keyword = (String)jobj.get("keyword");
			String city = (String)jobj.get("city");
			String gungu = (String)jobj.get("gungu");
			Long page = (Long)jobj.get("page");

			JSONArray categoryNoObj = (JSONArray) jobj.get("categoryNo");
			List<String> categoryNo = new ArrayList<>();
			for(int i=0; i<categoryNoObj.size(); i++) {
				categoryNo.add((String)categoryNoObj.get(i));
			}
		
			HospitalSearchDto search = new HospitalSearchDto();
			search.setKeyword(keyword);
			search.setCategoryName(categoryNo);
			search.setCity(city);
			search.setGungu(gungu);			
			PageInfo pageInfo = new PageInfo((int)page.longValue());
			HospitalService hService = new HospitalServiceImpl();
			List<HospitalDetailDto> hoslist = hService.listByFilter(search,pageInfo);
			
			HospitalListDto hosld = new HospitalListDto();
			hosld.setPageInfo(pageInfo);
			hosld.setHospitalDetailDto(hoslist);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(hosld);
			
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(jsonStr);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
