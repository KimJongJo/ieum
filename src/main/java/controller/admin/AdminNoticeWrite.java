package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.file.FileDao;
import dao.file.FileDaoImpl;
import dto.FileDto;
import dto.NoticeDto;
import service.admin.NoticeService;
import service.admin.NoticeServiceImpl;
import service.file.FileService;
import service.file.FileServiceImpl;

/**
 * Servlet implementation class AdminNoticeWrite
 */
@WebServlet("/admin/notice/write")
@MultipartConfig
public class AdminNoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminNoticeWrite() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 멤버에서 로그인 사용자 이름 뽑아오기
		HttpSession session = request.getSession();
		// Integer uNo = (Integer) session.getAttribute("uNo");
		Integer uNo = 6;
		FileDao fDao = new FileDaoImpl();
		NoticeService service = new NoticeServiceImpl();
		String nNo = request.getParameter("nNo");
		setWriterAttribute(request, service, uNo);
		try {
			// 작성
			if (nNo == null) {
				setWriterAttribute(request, service, uNo);
				request.getRequestDispatcher("/admin/noticeWrite.jsp").forward(request, response);
				return;
			}
			// 수정
			NoticeDto notice = service.getDetail(Integer.parseInt(nNo));
			if (notice == null) {
			    request.setAttribute("err", "잘못된 접근입니다.");
			    request.getRequestDispatcher("/admin/noticeAlert.jsp").forward(request, response);
			    return;
			}
			setWriterAttribute(request, service, uNo);
			request.setAttribute("title", notice.getTitle());
			request.setAttribute("content", notice.getContent());
			request.setAttribute("nNo", nNo);
			request.setAttribute("topYn", notice.getIsPinned());

			Integer fNo = notice.getFileNo();
			if (fNo != null && fNo > 0) {
				FileDto fileDto = fDao.selectFileByFileNo(fNo);
				if (fileDto != null) {
					request.setAttribute("fileNm", fileDto.getFileName());
				}
			}
			request.getRequestDispatcher("/admin/noticeWrite.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String nNo = request.getParameter("nNo");
		HttpSession session = request.getSession();
		FileService fService = new FileServiceImpl();
		NoticeService service = new NoticeServiceImpl();
		try {
			// 작성
						
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			boolean isPinned = "on".equals(request.getParameter("topYn"));
			// Integer uNo = (Integer) session.getAttribute("uNo");
			Integer uNo = 6;
			Part filePart = request.getPart("file");
			Integer fileNo = null;
			if (filePart != null && filePart.getSize() > 0) {
				fileNo = fService.uploadFile(filePart, "noticeFile");
//				System.out.println("파일 업로드 완료, fileNo = " + fileNo);
			}
			NoticeDto notice = new NoticeDto(uNo, title, content, isPinned, fileNo);
			if (nNo == null) service.write(notice);
			else service.update(notice);
			request.setAttribute("msg", (nNo == null) ? "작성" : "수정");
			request.getRequestDispatcher("/admin/noticeAlert.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void setWriterAttribute(HttpServletRequest request, NoticeService service, Integer uNo) {
		try {
			String uNm = service.getUserNm(uNo);
			request.setAttribute("writer", uNm);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
