package service.auth;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;

import dao.auth.EmailDao;
import dao.auth.EmailDaoImpl;
import dto.EmailAuthDto;
import dto.MemberDto;
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
	private static final int KEY_LENGTH = 10;
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	
	
	private EmailDao emailDao;
	private String smtpUser;
    private String smtpPassword;
    private String smtpHost;
    private int smtpPort;
	
    public EmailServiceImpl (ServletContext context) {
        emailDao = new EmailDaoImpl();

        Properties prop = new Properties();
        try (InputStream is = context.getResourceAsStream("/WEB-INF/config.properties")) {
            if (is != null) {
                prop.load(is);
                smtpUser = prop.getProperty("mail.smtp.user");
                smtpPassword = prop.getProperty("mail.smtp.password");
                smtpHost = prop.getProperty("mail.smtp.host");
                smtpPort = Integer.parseInt(prop.getProperty("mail.smtp.port"));
            } else {
                throw new RuntimeException("config.properties를 찾을 수 없습니다.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	

	@Override
	public void sendEmail(String email, String type) {

		sendEmail(email, type, null);

	}
	
	public void sendEmail(String email, String type, Integer hNo) {
		String code;
		String htmlContent;
		String subject;
		// 일반 이메일 전송 요청일때
		if("common".equals(type) && hNo == null) {
			subject = "건강이음 이메일 인증 코드";
			code = generateCode();
			htmlContent = "<!DOCTYPE html>"
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
			EmailAuthDto emailAuthDto = new EmailAuthDto(email, code);
			emailDao.saveEmailCode(emailAuthDto);
			
			
		}else { // 병원 인증코드 전송 요청일때
			subject = "건강이음 병원 인증 코드";
			code = generateHosCode();
			htmlContent = "<!DOCTYPE html>"
			        + "<html>"
			        + "<head>"
			        + "<meta charset='UTF-8'>"
			        + "<title>병원 등록 승인</title>"
			        + "</head>"
			        + "<body style=\"font-family: 'Arial', sans-serif; background-color: #f4f4f4; margin:0; padding:0;\">"
			        + "<div style=\"max-width:500px; margin:50px auto; background-color:#fff; border-radius:8px; padding:30px; box-shadow:0 0 10px rgba(0,0,0,0.1);\">"
			        + "<p style=\"font-size:16px; color:#333;\">안녕하세요. 건강이음입니다.</p>"
			        + "<p style=\"font-size:16px; color:#333;\">귀하의 병원 등록 신청이 승인되었습니다.<br>"
			        + "병원은 즉시 등록되었으며, 아래 인증 코드를 사용하여 병원 관리자 계정 생성 시 최종 인증을 진행해 주세요.</p>"
			        + "<p style=\"display:block; margin:20px auto; padding:15px 25px; font-size:28px; font-weight:bold; color:#fff; background-color:#2F80ED; border-radius:5px; text-align:center; letter-spacing:5px;\">"
			        + code + "</p>"
			        + "<p style=\"font-size:12px; color:#888; text-align:center; margin-top:20px;\">※ 본 메일은 발신 전용입니다.</p>"
			        + "</div>"
			        + "</body>"
			        + "</html>";
			
			Map<String, Object> hosMap = new HashMap<>();
			hosMap.put("hNo", hNo);
			hosMap.put("hCode", code);
			emailDao.saveHosCode(hosMap);

		}
		
		sendMessage(email, htmlContent, subject);
	}
	
	// 메세지를 보내는 로직
	public void sendMessage(String email, String htmlContent, String subject) {
		
        // 1 SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);
        
        // 2 세션 생성
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(smtpUser, smtpPassword);
            }
        });
        
        try {
        	Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(smtpUser));
            message.setRecipients(
                    Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(subject);

            message.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(message);

            System.out.println("메일 전송 성공!");
            

        } catch (MessagingException e) {
            e.printStackTrace();
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
	
	public String generateHosCode() {
        StringBuilder sb = new StringBuilder(CODE_LENGTH);

        for (int i = 0; i < KEY_LENGTH; i++) {
            int index = secureRandom.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(index));
        }

        return sb.toString();
    }


	@Override
	public int checkEmail(String email, String code) {
		
		EmailAuthDto check = emailDao.checkEmailCode(email);
		
	    if(check == null || !check.getCode().equals(code)) {
	        return 0; // 이메일과 코드가 일치하지 않음
	        
	    }
	    
	    Timestamp expiryTime = check.getExpiredAt(); // 만료 시간

	    long nowMillis = System.currentTimeMillis(); // 현재 시간
	    
//	    System.out.println("현재시간" + nowMillis);
//	    System.out.println("만료시간" + expiryTime.getTime());

	    if(expiryTime.getTime() < nowMillis) {
	        return 1; // 만료된 코드
	    } else {
	        return 2; // 인증 성공
	    }
	}


	@Override
	public boolean useEmail(String email) {
		
		MemberDto check = emailDao.useEmail(email);
		
		if(check == null) {
			return false;
		}else {
			return true;
		}
	}


	@Override
	public boolean pwToEmail(String userId, String email) {
		
		Map<String, Object> pwMail = new HashMap<String, Object>();
		pwMail.put("userId", userId);
		pwMail.put("email", email);
		
		Map<String, Object> check = emailDao.CheckIdAndEmail(pwMail);
		
		if(check == null) { // 존재하지 않은 정보
			return false;
		}else { // 이메일 전송하기
			try {
				sendEmail(email, "common");
				return true;
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}
			
		}
		
	}



	@Override
	public void sendHosKey(Integer hNo, String email) {
		
		sendEmail(email, "admin", hNo);
		
	}



}
