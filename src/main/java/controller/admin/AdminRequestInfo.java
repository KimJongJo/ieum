package controller.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.otherDto.RequestInfoDto;
import dto.otherDto.ResponseDto;
import service.applicant.ApplicantService;
import service.applicant.ApplicantServiceImpl;

/**
 * Servlet implementation class AdminRequestInfo
 */
@WebServlet("/requestInfo")
public class AdminRequestInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRequestInfo() {
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
		
		ApplicantService appService = new ApplicantServiceImpl();
		Gson gson = new Gson();
		String result;
		try {
			RequestInfoDto requestDto = appService.getRequestInfo(hNo);
			/* hosReNo 가 null */
			// json으로 보내야함
			
			result = gson.toJson(new ResponseDto(true, "성공", requestDto));
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("병원정보, 신청자 정보를 불러오는 중 에러 발생");
			result = gson.toJson(new ResponseDto(false, "병원정보, 신청자 정보를 불러오는 중 에러 발생"));
		}
		
		response.getWriter().write(result);
		
		
		
	}

}
