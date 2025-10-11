package controller.notice;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FileDto;
import service.file.FileService;
import service.file.FileServiceImpl;

@WebServlet("/notice/download")
public class NoticeDownload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String fileNo = request.getParameter("no");
        if (fileNo == null) {
           System.out.println("다운받을 파일 번호 없음");
           return;
        }

        FileService service = new FileServiceImpl();
        FileDto file = service.getFile(Integer.parseInt(fileNo));

        if (file == null || file.getFileName() == null) {
        	 System.out.println("다운받을 파일 존재하지 않음");
        	 return;
        }

        Path filePath = Paths.get(
                getServletContext().getRealPath("/file/notice"),
                file.getFileName()
        );

        if (!Files.exists(filePath) || Files.isDirectory(filePath)) {
        	 System.out.println("다운받을 파일 존재하지 않음");
        	 return;
        }

        // 브라우저 호환 인코딩
        String encodedName = URLEncoder.encode(file.getFileName(), "UTF-8").replaceAll("\\+", "%20");

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedName);
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setContentLengthLong(Files.size(filePath));

        // try-with-resources로 안전하게 스트림 처리
        try (var out = response.getOutputStream()) {
            Files.copy(filePath, out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
