package controller.hosManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.HospitalDto;
import dto.otherDto.HospitalDetailDto;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class HospitalInfo
 */
@WebServlet("/hosManager/hospitalInfo")
public class HospitalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Integer uNo = (Integer)session.getAttribute("uNo");
		
		HospitalService service = new HospitalServiceImpl();
		HospitalDetailDto hospital = service.getHosInfo(uNo);
		
		String filePath = hospital.getFilePath().replace("\\", "/");
		hospital.setFilePath(filePath);
		request.setAttribute("hospital", hospital);
		
		request.getRequestDispatcher("/hosManager/hospitalInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
