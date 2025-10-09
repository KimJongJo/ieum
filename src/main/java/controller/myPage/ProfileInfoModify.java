package controller.myPage;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import service.file.FileService;
import service.file.FileServiceImpl;

import dto.MemberDto;
import dto.MemberProfileDto;
import service.myPage.ProfileInfoService;
import service.myPage.ProfileInfoServiceImpl;

/**
 * Servlet implementation class ProfileInfoModify
 */
@WebServlet("/pUpdate")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,    // 1MB
	    maxFileSize = 5 * 1024 * 1024,      // 5MB
	    maxRequestSize = 10 * 1024 * 1024   // 10MB
	)

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
		HttpSession session = request.getSession();
	    Integer uNo = (Integer) session.getAttribute("uNo");
	    
	    
	    
        ProfileInfoService profileService = new ProfileInfoServiceImpl();

        try {
        	//회원 정보 조회
        	MemberProfileDto member = profileService.selectMemberWithProFileImg(uNo);
        	System.out.println(member);
            request.setAttribute("member", member);
            
//            MemberProfileDto memberProfileDto = profileService.selectMemberWithProfile(uNo);
//            request.setAttribute("file", memberProfileDto);
//             
            request.getRequestDispatcher("myPage/profileInfoModify.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "회원 정보를 불러오는 중 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();
	    Integer uNo = (Integer) session.getAttribute("uNo");

        String nickName     = request.getParameter("nickName");
        String email        = request.getParameter("email");
        String id           = request.getParameter("id");
        String uTel         = request.getParameter("uTel");
        String uAddress     = request.getParameter("uAddress");
        String diaryPrivate = request.getParameter("diaryPrivate");
        Part proFile = request.getPart("profileFile");
        if (proFile == null) {
            System.out.println("❌ file 객체가 null 입니다. (폼 name 불일치 또는 enctype 누락 가능)");
        } else {
        	String fileName = proFile.getSubmittedFileName();
        	System.out.println("파일 크기: " + proFile.getSize());
        	System.out.println(fileName);
            System.out.println("✅ file 객체가 존재합니다.");
        }
        
        ProfileInfoService profileService = new ProfileInfoServiceImpl();
        
        
        
        try {
        	// 회원 기존 프로필 정보 조회
        	MemberProfileDto memberProfileDto = profileService.selectMemberWithProfile(uNo);
        	
        	//2. 회원 기본 정보 수정
            MemberDto member = new MemberDto();            
            member.setuNo(uNo);
            member.setNickName(nickName);
            member.setEmail(email);
            member.setId(id);
            member.setuTel(uTel);
            member.setuAddress(uAddress);
            member.setDiaryPrivate("yes".equals(diaryPrivate));
            
            
            profileService.updateProfile(member, proFile);
            
            
            
           
	     
            response.sendRedirect(request.getContextPath() + "/pInfo");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "회원 정보 수정 중 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
        }
	}

}
