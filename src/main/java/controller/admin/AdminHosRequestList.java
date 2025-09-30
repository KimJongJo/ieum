package controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.HospitalDto;
import dto.otherDto.HospitalPageResponseDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class AdminHosSignUpList
 */
@WebServlet("/admin/hosRequestList")
public class AdminHosRequestList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHosRequestList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 병원 검색해서 들어온 경우, 또는 정렬이 있는 경우
		int curPage = 1;
		
		// 기본적으로 보여줄 화면
		
		HospitalService service = new HospitalServiceImpl();
		HospitalPageResponseDto pageDto = service.hosWaitList(curPage);
		request.setAttribute("listDto", pageDto);
		
		
		request.getRequestDispatcher("/admin/adminRequestList.jsp").forward(request, response);
	}


}
