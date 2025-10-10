package controller.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MyCommunityDto;
import dto.otherDto.ShowDIaListToUser;
import service.allCommunity.CommuEmpathyService;
import service.allCommunity.CommuEmpathyServiceImpl;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;
import service.myPage.CalenderService;
import service.myPage.CalenderServiceImpl;

/**
 * Servlet implementation class Calender
 */
@WebServlet("/calender")
public class Calender extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CalenderService calenderService;
	DiagnosisService diagnosisService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calender() {
        super();
        calenderService = new CalenderServiceImpl();
        diagnosisService = new DiagnosisServiceImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		 // 캐시 방지 헤더 추가
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	    response.setDateHeader("Expires", 0); // Proxies
		
	    HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		
		if (uNo == null) {
            // 로그인 안 했을 경우
            response.sendRedirect("login.jsp");
            return;
        }
		
		try {
	        MyCommunityDto myComList = calenderService.getMyRecentCommunity(uNo);
	        

	        // ✅ 공감 여부 세팅
	        if(myComList != null) {
	            CommuEmpathyService commuEmpathyService = new CommuEmpathyServiceImpl();
	            boolean liked = commuEmpathyService.checkEmpathy(uNo, myComList.getCommuNo());
	            myComList.setLikedByUserCom(liked);
	        }

	        request.setAttribute("myComList", myComList);
	        
	        
	        
	        ShowDIaListToUser showDIaListToUser = diagnosisService.getLatestDiagnosis(uNo);
	        request.setAttribute("showDIaListToUser", showDIaListToUser);

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "최근 커뮤니티를 불러오는 중 오류가 발생했습니다.");
	    }

	    request.getRequestDispatcher("myPage/calender.jsp").forward(request, response);
	}

}
