package controller.myPage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BlackWithMemberDto;
import service.myPage.BlackListService;
import service.myPage.BlackListServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class BlackList
 */
@WebServlet("/black")
public class BlackList extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackList() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      Integer uNo = (Integer) session.getAttribute("uNo");
      BlackListService service = new BlackListServiceImpl();
      
      String spage = request.getParameter("page"); 
      Integer page = 1; 
      if(spage != null) page=Integer.parseInt(spage); 
      PageInfo pageInfo = new PageInfo(page);
      
      
      
      
      try {
         List<BlackWithMemberDto> blackMember = service.listByPage(pageInfo, uNo);
         
         
         // 중복 제거 (nickname 기준)
         Map<String, BlackWithMemberDto> uniqueMap = new LinkedHashMap<>();
         for(BlackWithMemberDto b : blackMember) {
             uniqueMap.put(b.getNickname(), b); // key가 중복되면 나중 값이 덮어짐
         }
         List<BlackWithMemberDto> uniqueBlackMember = new ArrayList<>(uniqueMap.values());
         
         request.setAttribute("blackMember", uniqueBlackMember);
         request.setAttribute("pageInfo", pageInfo);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      request.setAttribute("navPath", "/ieum/calender");
      request.setAttribute("navPathName", "마이페이지");
      request.setAttribute("navcurPage", "차단목록");
      
      request.getRequestDispatcher("myPage/blackList.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      Integer uNo = (Integer) session.getAttribute("uNo");
      
      
        String blockedNoStr = request.getParameter("blockedNo");
        
       BlackListService blackListService = new BlackListServiceImpl();

        // POST 요청에서 차단 해제할 사용자 번호
        if (blockedNoStr == null || blockedNoStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/black"); // 에러시 블랙리스트 페이지로
            return;
        }
        
        

        int blockedNo = Integer.parseInt(blockedNoStr);
        System.out.println("uNo = " + uNo);
        System.out.println("blockedNo = " + blockedNo);
        try {
            boolean result = blackListService.unblockUser(uNo, blockedNo);
            if(result) {
                // 성공하면 블랙리스트 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/black");
            } else {
                // 실패 시 에러 메시지 페이지로 이동하거나 alert 띄우도록 처리 가능
                response.sendRedirect(request.getContextPath() + "/black?error=fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/black?error=exception");
        }

   }

}
