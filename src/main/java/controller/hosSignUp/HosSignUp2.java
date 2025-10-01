package controller.hosSignUp;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dto.ApplicantDto;
import dto.HospitalDto;
import service.file.FileService;
import service.file.FileServiceImpl;
import service.hospital.HospitalService;
import service.hospital.HospitalServiceImpl;

/**
 * Servlet implementation class HosSignUp
 */
@WebServlet("/hosSignUp2")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 100   // 100MB
	)
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
		
		// Servlet
		Properties prop = new Properties();
		try(InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
		    prop.load(is);
		    String kakaoKey = prop.getProperty("kakao.api.key");
		    request.setAttribute("kakaoKey", kakaoKey);
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		request.getRequestDispatcher("/hosSignUp/hosSignUp2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String hosName = request.getParameter("hosName");
		String hosCategory = request.getParameter("hosCategory");
		Integer categoryNo = Integer.parseInt(hosCategory);
		String add = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String address = add + " " + addressDetail;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		String[] weekDay = request.getParameterValues("weekday");
		String[] services = request.getParameterValues("services"); // 편의 서비스
		String service = request.getParameter("service"); // 실손24 서비스
		String requestNo1 = request.getParameter("requestNo1");
		String requestNo2 = request.getParameter("requestNo2");
		String requestNo3 = request.getParameter("requestNo3");
		String requestNo = requestNo1 + "-" + requestNo2 + "-" + requestNo3;
		String hos_y = request.getParameter("hos_y");
		String hos_x = request.getParameter("hos_x");
		
		List<String> holidays = new ArrayList<>();
		String holiday;
		if(weekDay != null) {
			for(String day : weekDay) {
			    if(!day.equals("0") && !day.isEmpty()) { // 0 또는 빈 문자열 제외
			        holidays.add(day);
			    }
			}
			
			holiday = String.join(",", holidays);
		}else {
			holiday = "무휴 진료";
		}
		
		String hosService;
		if(services != null) {
			List<String> hosServices = new ArrayList<>();
			for(String day : services) {
			    if(!day.equals("0") && !day.isEmpty()) { // 0 또는 빈 문자열 제외
			    	hosServices.add(day);
			    }
			}
			hosService = String.join(",", hosServices);
		}else {
			hosService = "편의시설 없음";
		}
		
		boolean silson = service.equals("yes") ? true : false;
		
		
		// 병원사진하고 사업자 등록증만 받으면 됨
		Part hosImg = request.getPart("hosImgFile");
        Part hosReFile = request.getPart("hosFile");
        

		
		FileService fileService = new FileServiceImpl();
		Integer hosImgNo = fileService.uploadFile(hosImg, "hosImg");
		Integer hosReFileNo = fileService.uploadFile(hosReFile, "hosRe");
		
		String[] addArr = add.split(" ");
		
		// 시/도 
		String siDo = addArr[0];
		
		// 시/군/구
		StringBuilder addrSb = new StringBuilder();
		for(int i = 1; i < addArr.length - 2; i++ ){
			addrSb.append(addArr[i]).append(" ");
		}
		String siGunGu = addrSb.toString();
		
		// 도로명 주소
//		String loadNameAdd = addArr[addArr.length - 2] + " " + addArr[addArr.length - 1];
		
//		HospitalDto hosDto = new HospitalDto(hosName, categoryNo, address, hos_y, hos_x,
//				holiday, tel, hosImgNo, hosReFileNo, requestNo, siDo, siGunGu, hosService, silson);
//		
		// 병원 신청 페이지1 에서 저장한 세션에서 신청자 정보 가져오기
		
		ApplicantDto appDto = (ApplicantDto)session.getAttribute("appInfoDto");
		
		Map<String, Object> requestMap = new HashMap<String, Object>();
//		requestMap.put("hosDto", hosDto);
		requestMap.put("appDto", appDto);
		
		
		HospitalService hospitalService = new HospitalServiceImpl();
		hospitalService.addHospital(requestMap);
		
		// 세션 비워주기
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("tel");
		
		response.sendRedirect("hosSignUp3");
		
		
		
		
	}

}
