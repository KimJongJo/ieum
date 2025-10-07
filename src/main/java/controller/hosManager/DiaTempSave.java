package controller.hosManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.DiagnosisHistoryDto;
import dto.otherDto.ResponseDto;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;

/**
 * Servlet implementation class DiaTempSave
 */
@WebServlet("/hosManager/temp-save")
public class DiaTempSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaTempSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer dNo = Integer.parseInt(request.getParameter("dNo")); // 진단서 번호
		String diaName = request.getParameter("diaName"); // 진단명
		String sym = request.getParameter("sym"); // 증상
		String summary = request.getParameter("summary"); // 검사 내용 및 결과
		String treatment = request.getParameter("treatment"); // 처치/수술내용
		String pre = request.getParameter("pre"); // 처방전
		String docComment = request.getParameter("docComment"); // 의사의말
		String type = request.getParameter("type"); // 저장 타입
		
		DiagnosisService service = new DiagnosisServiceImpl();
		DiagnosisHistoryDto diaDto = new DiagnosisHistoryDto(dNo, diaName, sym, summary, treatment, pre, docComment);
		//임시 저장
		service.tempSave(diaDto, type);
		
		Gson gson = new Gson();
		String result;
		if("temp-save".equals(type)){
			result = gson.toJson(new ResponseDto(true, "임시저장 완료"));
		}else {
			result = gson.toJson(new ResponseDto(true, "저장 완료"));
		}
		response.getWriter().write(result);
		
	}

}
