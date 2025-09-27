package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CommuCategoryDto;
import dto.CommunityDto;
import service.allCommunity.CategoryService;
import service.allCommunity.CategoryServiceImpl;
import service.allCommunity.CommunityService;
import service.allCommunity.CommunityServiceImpl;

/**
 * Servlet implementation class CommunityWrite
 */
@WebServlet("/write")
public class CommunityWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private CommunityService communityService = new CommunityServiceImpl();
	private CategoryService categoryService = new CategoryServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("들어옴");
		
		try {
			System.out.println("카테고리 목록 조회 전");
			List<CommuCategoryDto> list = categoryService.selectAll();
			System.out.println("카테고리 목록 조회 후");
			System.out.println(list);
			
			request.setAttribute("categoryList", categoryService.selectAll());
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("allCommunity/communityWrite.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String categoryNostr = request.getParameter("categoryNo");
		// 간단한 유효성 체크
		if(title == null || title.isBlank() || content == null || content.isBlank()) {
			response.sendRedirect("write"); // null 이거나  블랙크 즉,  비어있으면 다시 작성 페이지로 이동
			return;
		}
		
		response.sendRedirect("comDetail");
		
		
		CommunityDto communityDto = new CommunityDto();
		communityDto.setCommuTitle(title);
		communityDto.setCommuContent(content);
		communityDto.setCategoryNo(Integer.parseInt(categoryNostr));
		
		
		try {
			Integer commuNO = communityService.insertCommunity(communityDto);
			
			//작성쇤 글의 상세보기로 이동(쿼리 파라미터로 글 번호 전달)
			response.sendRedirect("comDatial?no=" + commuNO);
			
		}catch (Exception e){
			e.printStackTrace();
			
			response.sendRedirect("write");
		}
	}
}
