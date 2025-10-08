package controller.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.otherDto.MainCommuDto;
import dto.otherDto.MainDiagnosisDto;
import dto.otherDto.MainHosDto;
import dto.otherDto.MainNoticeDto;
import dto.otherDto.MainUserDto;
import service.common.MainService;
import service.common.MainServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Index() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		Properties prop = new Properties();
		MainService service = new MainServiceImpl();
		try (InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
			// 지도 위한 카카오 앱 키
			prop.load(is);
			String kakaoKey = prop.getProperty("kakao.api.key");
			request.setAttribute("kakaoKey", kakaoKey);

			// 병원 추천
			List<MainHosDto> mainHosList = service.getHostList();
			request.setAttribute("hosList", mainHosList);
			if (uNo != null) {// 로그인 정보
				MainUserDto userInfo = service.getLoginInfo(uNo);
				request.setAttribute("userInfo", userInfo);
				request.setAttribute("uNo", uNo);
			} else { // 자가진단
				List<MainDiagnosisDto> diagCateList = service.getDiagCate();
				request.setAttribute("diagCateList", diagCateList);
			}
			// 커뮤니티
			List<MainCommuDto> commuList = service.getCommuList();
			request.setAttribute("commuList", commuList);
			// 공지사항
			List<MainNoticeDto> topNoticeList = service.getTopNoticeList();
			List<MainNoticeDto> noticeList = service.getNoticeList();
			request.setAttribute("topNoticeList", topNoticeList);
			request.setAttribute("noticeList", noticeList);
			request.getRequestDispatcher("common/main/index.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
