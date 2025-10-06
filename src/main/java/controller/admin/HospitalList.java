package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.HosInfoDto;
import dto.otherDto.HospitalPageResponseDto;
import dto.otherDto.ResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class HospitalList
 */
@WebServlet("/hospitalList/page")
public class HospitalList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer page = Integer.parseInt(request.getParameter("page"));
		String keyword = request.getParameter("keyword");
		String filter = request.getParameter("filter");
		String status = request.getParameter("status");
		
		HospitalService service = new HospitalServiceImpl();
		HospitalPageResponseDto<HosInfoDto> hosList;
		
		// 키워드가 있을때
		if(keyword != null && !keyword.isEmpty()) {
			hosList = service.hosListByKeyword(page, keyword, filter, status);
		}else {
			hosList = service.hosList(page, filter, status);
		}
		
		Gson gson = new Gson();
		String result = gson.toJson(new ResponseDto(true, "요청 페이지를 담은리스트", hosList));
		
		response.getWriter().write(result);
		
		
		
	}

}
