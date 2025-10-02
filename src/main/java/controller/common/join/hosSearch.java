package controller.common.join;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.HospitalDto;
import dto.otherDto.ResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class hosSearch
 */
@WebServlet("/join/hosList")
public class hosSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hosSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		
		HospitalService service = new HospitalServiceImpl();
		List<HospitalDto> hosList = service.joinSearchHosName(keyword);
		
		Gson gson = new Gson();
		String result;
		// 비어있을때
		if(hosList == null) {
			result = gson.toJson(new ResponseDto(false, "검색결과가 없음", hosList));
		}else {
			result = gson.toJson(new ResponseDto(true, keyword + "에 대한 검색결과", hosList));
		}
		
		response.getWriter().write(result);
		
		
		
		
	}

}
