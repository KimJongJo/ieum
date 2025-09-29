package controller.hosSignUp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.file.FileService;
import service.file.FileServiceImpl;

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
//		Part hosImg = request.getPart("hosImgFile");
//        Part hosReFile = request.getPart("hosFile");
//        
//        String hosImgFileName = hosImg.getSubmittedFileName();
//        String hosReFileName = hosReFile.getSubmittedFileName();
//		
//		FileService fileService = new FileServiceImpl();
//		Integer hosImgNo = fileService.uploadFile(hosImgFileName, "hosImg");
//		Integer hosReFileNo = fileService.uploadFile(hosReFileName, "hosReImg");
		
		String[] addArr = add.split(" ");
		
		// 시/도 
		String siDo = addArr[0];
		
		// 시/군/구
		StringBuilder sb = new StringBuilder();
		for(int i = 1; i < addArr.length - 2; i++ ){
			sb.append(addArr[i]).append(" ");
		}
		String siGunGu = sb.toString();
		
		// 도로명 주소
		String loadNameAdd = addArr[addArr.length - 2] + " " + addArr[addArr.length - 1];
		
		System.out.println("시/도 " + siDo);
		System.out.println("시/군/구 " + siGunGu);
		System.out.println("도로명주소 " + loadNameAdd);
		
		
	}

}
