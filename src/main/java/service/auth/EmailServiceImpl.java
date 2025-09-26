package service.auth;

import java.security.SecureRandom;
import java.util.Properties;

import dao.auth.EmailDao;
import dao.auth.EmailDaoImpl;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailServiceImpl implements EmailService {
	
	private static final SecureRandom secureRandom = new SecureRandom();
	private static final int CODE_LENGTH = 6;
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	private EmailDao emailDao;
	
	public EmailServiceImpl() {
		emailDao = new EmailDaoImpl();
	}
	

	@Override
	public void sendEmail(String email) throws Exception{
		// 1️⃣ Gmail 계정 정보
        final String username = "desk1614@gmail.com"; // 보내는 사람
        final String password = "dievyqoxsozoklch";          // Gmail 앱 비밀번호

        // 2️⃣ SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // TLS 사용
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // 3️⃣ 세션 생성
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
        	String code = generateCode();
        	Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("건강이음 이메일 인증 코드");

            String htmlContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<meta charset='UTF-8'>"
                    + "<title>이메일 인증</title>"
                    + "</head>"
                    + "<body style=\"font-family: 'Arial', sans-serif; background-color: #f4f4f4; margin:0; padding:0;\">"
                    + "<div style=\"max-width:500px; margin:50px auto; background-color:#fff; border-radius:8px; padding:30px; box-shadow:0 0 10px rgba(0,0,0,0.1);\">"
                    + "<h2 style=\"color:#2F80ED; text-align:center;\">건강이음 이메일 인증</h2>"
                    + "<p style=\"font-size:16px; color:#333;\">안녕하세요! 이메일 인증을 위해 아래 코드를 입력해주세요.</p>"
                    + "<span style=\"display:block; margin:20px auto; padding:15px 25px; font-size:28px; font-weight:bold; color:#fff; background-color:#2F80ED; border-radius:5px; text-align:center; letter-spacing:5px;\">" 
                    + code + "</span>"
                    + "<p style=\"font-size:16px; color:#333;\">유효 시간: 5분</p>"
                    + "<div style=\"font-size:12px; color:#888; text-align:center; margin-top:20px;\">이 메일은 발신 전용입니다. 회신하지 마세요.</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            message.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(message);

            System.out.println("메일 전송 성공!");
            
            emailDao.saveEmailCode(email, code);

        } catch (MessagingException e) {
            e.printStackTrace();
            throw new Exception();
        }
		
	}
	
	public String generateCode() {
        StringBuilder sb = new StringBuilder(CODE_LENGTH);

        for (int i = 0; i < CODE_LENGTH; i++) {
            int index = secureRandom.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(index));
        }

        return sb.toString();
    }

}
