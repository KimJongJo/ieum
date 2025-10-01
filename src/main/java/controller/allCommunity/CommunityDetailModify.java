package controller.allCommunity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        request.getRequestDispatcher("allCommunity/communityWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
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
        System.out.println(commuNo);
        System.out.println(categoryNo);
        System.out.println(title);
        System.out.println(content);
        
        MyCommunityDto myCommunityDto = new MyCommunityDto(commuNo, title, content, categoryNo);;
        
        try {
            communityService.updateCommunity(myCommunityDto);
            response.sendRedirect(request.getContextPath()+ "/comDetail?no=" + commuNo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "게시글 작성시 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
        }
	}

}
