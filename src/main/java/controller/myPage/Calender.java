package controller.myPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.DiaryDto;
import dto.MyCommunityDto;
import service.allCommunity.CommuEmpathyService;
import service.allCommunity.CommuEmpathyServiceImpl;
import service.myPage.CalenderService;
import service.myPage.CalenderServiceImpl;

/**
 * Servlet implementation class Calender
 */
@WebServlet("/calender")
public class Calender extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CalenderService calenderService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calender() {
        super();
        calenderService = new CalenderServiceImpl();
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
		
		int uNo = 6;
		try {
			List<DiaryDto> diaryList = calenderService.getAllByUser(uNo);
	        MyCommunityDto myComList = calenderService.getMyRecentCommunity(uNo);
	        
	        
	     // ✅ JSON 변환
            Gson gson = new Gson();
            String diaryJson = gson.toJson(diaryList);
            request.setAttribute("diaryJson", diaryJson);
	        

	        // ✅ 공감 여부 세팅
	        if(myComList != null) {
	            CommuEmpathyService commuEmpathyService = new CommuEmpathyServiceImpl();
	            boolean liked = commuEmpathyService.checkEmpathy(uNo, myComList.getCommuNo());
	            myComList.setLikedByUserCom(liked);
	        }

	        request.setAttribute("myComList", myComList);

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "최근 커뮤니티를 불러오는 중 오류가 발생했습니다.");
	    }

	    request.getRequestDispatcher("myPage/calender.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
