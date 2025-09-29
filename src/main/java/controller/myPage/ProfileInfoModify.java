package controller.myPage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FileDto;
import dto.MemberDto;
import service.myPage.FileService;
import service.myPage.FileServiceImpl;
import service.myPage.ProfileInfoService;
import service.myPage.ProfileInfoServiceImpl;

/**
 * Servlet implementation class ProfileInfoModify
 */
@WebServlet("/pUpdate")
public class ProfileInfoModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileInfoModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uNo = 1; // 실제로는 세션에서 가져오는 것이 좋음

	    FileService fileService = new FileServiceImpl();
	    ProfileInfoService profileInfoService = new ProfileInfoServiceImpl();

	    try {
	        // 먼저 회원 정보 가져오기
	        MemberDto memberDto = profileInfoService.selectProfileView(uNo);
	        request.setAttribute("member", memberDto);

	        FileDto file = null;

	        // 회원에 fileNo가 있는 경우에만 파일 조회
	        if (memberDto.getFileNo() != null) {
	            file = fileService.getFileByFileNo(memberDto.getFileNo());
	        }

	        // 파일이 없으면 기본 이미지로 세팅
	        if (file == null || file.getFileName() == null || file.getFileName().isEmpty()) {
	            file = new FileDto();
	            file.setFilePath("img");                  // 기본 이미지 폴더
	            file.setFileName("계획대로야.jpg");       // 기본 이미지 전체 파일명
	        }

	        request.setAttribute("file", file);

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("err", "회원 정보를 불러오는 중 오류 발생");
	        request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
	        return; // 예외 발생 시 forward 후 추가 처리 방지
	    }

	    request.getRequestDispatcher("myPage/profileInfoModify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int uNo = 1;
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String uTel = request.getParameter("uTel");
		String uAddress = request.getParameter("uAddress");
		String gender = request.getParameter("gender");
		String diaryPrivate = request.getParameter("diaryPrivate");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setuNo(uNo);
	    memberDto.setNickName(nickName);
	    memberDto.setEmail(email);
	    memberDto.setId(id);
	    memberDto.setuTel(uTel);
	    memberDto.setuAddress(uAddress);
	    memberDto.setGender("male".equals(gender) ? "MALE" : "FEMALE");
	    memberDto.setDiaryPrivate("yes".equals(diaryPrivate));
	    
	    System.out.println(memberDto);
	    ProfileInfoService profileInfoService = new ProfileInfoServiceImpl();
	    
	    try {
	        profileInfoService.updateProfile(memberDto);
	        response.sendRedirect(request.getContextPath() + "/pInfo"); // 수정 완료 후 다시 내 정보 페이지
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("err", "회원 정보 수정 중 오류 발생");
	        request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
	    }
		
	}

}
