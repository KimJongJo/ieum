package controller.hosSignUp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HosSignUp
 */
@WebServlet("/hosSignUp2")
public class HosSignUp2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosSignUp2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/hosSignUp/hosSignUp2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String hosName = request.getParameter("hosName");
		String hosCategory = request.getParameter("hosCategory");
		String add = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		String[] weekDay = request.getParameterValues("weekday");
		String[] services = request.getParameterValues("services");
		String service = request.getParameter("service"); // 실손24 서비스
		String requestNo1 = request.getParameter("requestNo1");
		String requestNo2 = request.getParameter("requestNo2");
		String requestNo3 = request.getParameter("requestNo3");
		String requestNo = requestNo1 + "-" + requestNo2 + "-" + requestNo3;
		
		// 병원사진하고 사업자 등록증만 받으면 됨
		
		System.out.println(hosName);
		System.out.println(hosCategory);
		System.out.println(add);
		System.out.println(addressDetail);
		System.out.println(tel);
		System.out.println(service);
		System.out.println(requestNo);
		if (weekDay != null) {
		    for(String value : weekDay) {
		        System.out.print(value + " ");
		    }
		} else {
		    System.out.println("선택된 휴무일이 없습니다.");
		}
		
		if (services != null) {
		    for(String value : services) {
		        System.out.print(value + " ");
		    }
		} else {
		    System.out.println("선택된 서비스가 없습니다.");
		}
		
		
	}

}
