package controller.myPage;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Part;

import org.apache.ibatis.reflection.SystemMetaObject;

import dto.FileDto;
import dto.MemberDto;
import dto.MemberProfileDto;
import service.myPage.FileService;
import service.myPage.FileServiceImpl;
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
		int uNo = 4; // 테스트용

        ProfileInfoService profileService = new ProfileInfoServiceImpl();
        FileService fileService = new FileServiceImpl();

        try {
        	//회원 정보 조회
            MemberDto member = profileService.selectProfileView(uNo);
            request.setAttribute("member", member);
            
            MemberProfileDto memberProfileDto = profileService.selectMemberWithProfile(uNo);
            request.setAttribute("file", memberProfileDto);
            System.out.println(memberProfileDto.toString());
             
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
	    int uNo = 4;

        String nickName     = request.getParameter("nickName");
        String email        = request.getParameter("email");
        String id           = request.getParameter("id");
        String uTel         = request.getParameter("uTel");
        String uAddress     = request.getParameter("uAddress");
        String diaryPrivate = request.getParameter("diaryPrivate");

        ProfileInfoService profileService = new ProfileInfoServiceImpl();
        FileService fileService = new FileServiceImpl();

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
            profileService.updateProfile(member);
           
            
            // 3️⃣ 프로필 이미지 업로드 처리
            Part filePart = request.getPart("profileFile");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = new File(filePart.getSubmittedFileName()).getName();
                String savePath = getServletContext().getRealPath("/img");
                File saveDir = new File(savePath);
                if (!saveDir.exists()) saveDir.mkdirs();

                filePart.write(savePath + File.separator + fileName);

                // 4️⃣ DB 업데이트 또는 insert
                Integer existingFileNo = memberProfileDto.getFileNo();
                FileDto fileDto = new FileDto();
                fileDto.setFileName(fileName);
                fileDto.setFilePath("img");
                fileDto.setFileCategory("userProfile");

                boolean fileExists = false;
                if (existingFileNo != null && existingFileNo > 0) {
                    try {
                        fileExists = fileService.getFileByFileNo(existingFileNo) != null;
                    } catch (Exception e) {
                        fileExists = false;
                    }
                }

                if (fileExists) {
                    fileDto.setFileNo(existingFileNo);
                    fileService.updateFile(fileDto); // 존재하면 update
                } else {
                    fileService.insertFile(fileDto); // 없으면 insert
                }
            }
            System.out.println(memberProfileDto.getFileNo());
            
            response.sendRedirect(request.getContextPath() + "/pInfo");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "회원 정보 수정 중 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
        }
	}

}
