package controller.allCommunity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.allCommunity.CategoryDaoImpl;
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
		try {
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

		HttpSession session = request.getSession();
		Integer uNo = (Integer) session.getAttribute("uNo");
		
		if (uNo == null) {
            // 로그인 안 했을 경우
            response.sendRedirect("login.jsp");
            return;
        }

		
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        //추가됨
        String categoryNoStr = request.getParameter("categoryNo");
//        String categoryNoStr = request.getParameter("categoryNo");
//        if (categoryNoStr == null || categoryNoStr.isEmpty()) {
//            request.setAttribute("err", "카테고리를 선택해주세요.");
//            request.getRequestDispatcher("allCommunity/communityWrite.jsp").forward(request, response);
//            return;
//        }
        
     // 카테고리 선택 여부 확인
        if (categoryNoStr == null || categoryNoStr.isEmpty()) {
            request.setAttribute("err", "카테고리를 선택해주세요.");
            // 사용자가 작성한 값 유지
            request.setAttribute("inputTitle", title);
            request.setAttribute("inputContent", content);
            try {
                request.setAttribute("categoryList", categoryService.selectAll());
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("allCommunity/communityWrite.jsp").forward(request, response);
            return;
        }
        

        int categoryNo = Integer.parseInt(categoryNoStr);
        CommunityDto communityDto = new CommunityDto(uNo, title, content, categoryNo);

        try {
            int commuNo = communityService.insertCommunity(communityDto);
            response.sendRedirect(request.getContextPath()+ "/comDetail?no=" + commuNo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "게시글 작성시 오류가 발생했습니다.");
            request.getRequestDispatcher("allCommunity/error.jsp").forward(request, response);
        }
	}
}
