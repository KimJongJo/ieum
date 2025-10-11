package controller.exam;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamScore
 */
@WebServlet("/exam/score")
public class ExamScore4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamScore4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int total = 0;
		int count = 0;
		
		try {
			
			Enumeration<String> quesName = request.getParameterNames();
			
			while (quesName.hasMoreElements()) {
				String name = quesName.nextElement();
				String value = request.getParameter(name);
				
				try {
					total += Integer.parseInt(value);
					count++;
				}catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
			
			double average = (double) total/count;
			
			request.setAttribute("total", total);
			request.setAttribute("average", String.format("%.2f", average)); //소수점 둘째 자리까지
			
			request.getRequestDispatcher("/exam/result").forward(request, response);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
