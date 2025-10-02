package controller.auth.hospitalCodt;

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
 * Servlet implementation class HospitalAuthCode
 */
@WebServlet("/auth/hospitalAuth")
public class HospitalAuthCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalAuthCode() {
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
		String hosAuthCode = request.getParameter("authCode");
		
		HospitalService service = new HospitalServiceImpl();
		boolean checkAuth = service.checkHosAuthCode(hNo, hosAuthCode);
		
		Gson gson = new Gson();
		String result;
		
		// 인증이 되었을 때
		if(checkAuth) {
			result = gson.toJson(new ResponseDto(true, "인증되었습니다."));
		}else {
			result = gson.toJson(new ResponseDto(false, "인증코드가 일치하지 않습니다."));
		}
		
		response.getWriter().write(result);
		
	}

}
