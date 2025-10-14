package controller.allCommunity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CommuCategoryDto;
import dto.CommunityDto;
import dto.MyCommunityDto;
import service.allCommunity.CategoryService;
import service.allCommunity.CategoryServiceImpl;
import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;

/**
 * Servlet implementation class CommunityDetailModify
 */
@WebServlet("/comDetailMo")
public class CommunityDetailModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityService communityService = new CommunityServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetailModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        Integer uNo = (Integer) session.getAttribute("uNo");

     // 로그인 안 했을 경우
        if (uNo == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('넌 수정할 수 없다 돌아가라');");
            out.println("history.back();"); // 이전 페이지로 돌아가기
            out.println("</script>");
            out.close();
            return;
        }
		
		
		String noStr = request.getParameter("no");
		if (noStr == null || noStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 전달되지 않았습니다.");
            return;
        }
		
		int commuNo = 0;
        try {
            commuNo = Integer.parseInt(noStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "게시글 번호가 올바르지 않습니다.");
            return;
        }
        
        
        CommunityService communityService = new CommunityServiceImpl();
        CategoryService categoryService = new CategoryServiceImpl();
               
        try {
        	
        	// 작성자 조회
            Integer authorNo = communityService.getCommunityAuthorNo(commuNo);
            if (authorNo == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "게시글이 존재하지 않습니다.");
                return;
            }

            // 세션 사용자와 작성자 비교
            if (!uNo.equals(authorNo)) {
            	response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('게시글 수정 권한이 없습니다.');");
                out.println("history.back();"); // 이전 페이지로 돌아가기
                out.println("</script>");
                out.close();
                return;
            }
        	
        	//1. 커뮤글 조회
            CommunityDto communityDto = communityService.selectByNo(commuNo);
            request.setAttribute("community", communityDto);
            
            
            //2. 카테고리 가져오기
            //System.out.println(categoryService.selectAll());
			request.setAttribute("categoryList", categoryService.selectAll());
           
            //3. 카테고리 조회
            CommuCategoryDto categoryDto = categoryService.selectByNo(communityDto.getCategoryNo());
            request.setAttribute("category", categoryDto);
            
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "게시글 조회 중 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
            return;
        }

		request.setAttribute("navPath", "/ieum/allComList");
		request.setAttribute("navPathName", "커뮤니티");
		request.setAttribute("navcurPage", "게시글 수정");
        
        request.getRequestDispatcher("allCommunity/communityWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
        HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		if (uNo == null) {
            // 로그인 안 했을 경우
            response.sendRedirect("login.jsp");
            return;
        }
		
		int commuNo = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String categoryNoStr = request.getParameter("categoryNo");
		
        if (categoryNoStr == null || categoryNoStr.isEmpty()) {
            request.setAttribute("err", "카테고리를 선택해주세요.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
            return;
        }
        
        int categoryNo = Integer.parseInt(categoryNoStr);
        
        try {
        	MyCommunityDto myCommunityDto = new MyCommunityDto(commuNo, title, content, categoryNo);;
        	
            communityService.updateCommunity(myCommunityDto);
            
            response.sendRedirect(request.getContextPath()+ "/comDetail?no=" + commuNo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "게시글 작성시 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
        }
	}

}
