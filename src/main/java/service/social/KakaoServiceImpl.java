package service.social;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import dto.MemberDto;
import dto.otherDto.KakaoMemberDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

public class KakaoServiceImpl implements KakaoService {
	
	MemberService service;
	
	public KakaoServiceImpl() {
		service = new MemberServiceImpl();
	}

	// 액세스 토큰 요청
	@Override
	public String getAccessToken(String code, String kakaoKey, String kakaoRedirectUrl) throws Exception{

		String tokenUrl = "https://kauth.kakao.com/oauth/token";
        String params = "grant_type=authorization_code"
                      + "&client_id=" + kakaoKey
                      + "&redirect_uri=" + kakaoRedirectUrl
                      + "&code=" + code;
        
        URL url = new URL(tokenUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true); // POST body 전송 가능하게
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

        try (OutputStream os = conn.getOutputStream()) {
            os.write(params.getBytes(StandardCharsets.UTF_8));
            os.flush();
       }

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        br.close();

        Gson gson = new Gson();
        Type type = new TypeToken<Map<String, Object>>() {}.getType();

        Map<String, Object> map = gson.fromJson(sb.toString(), type);

        String accessToken = (String) map.get("access_token");
		
		return accessToken;
		
	}

	// 사용자 정보 요청
	@Override
	public KakaoMemberDto getMemberDto(String token) throws Exception{
		
		String tokenUrl = "	https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(tokenUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setDoOutput(true); // POST body 전송 가능하게
	        conn.setRequestProperty("Authorization", " Bearer " + token);
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	        
	     // 2. 응답 읽기
            InputStream is = conn.getResponseCode() == 200 ? conn.getInputStream() : conn.getErrorStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
            conn.disconnect();

            Gson gson = new Gson();
            Type type = new TypeToken<Map<String, Object>>() {}.getType();
            Map<String, Object> map = gson.fromJson(sb.toString(), type);

            // id 가져오기
            Double idDouble = (Double) map.get("id");  // Gson은 숫자를 Double로 변환
            long id = idDouble.longValue();            // long으로 변환
            String idStr = String.valueOf(id);         // 필요 시 String으로

            // properties 가져오기 (타입 안전성 경고는 여전히 뜨지만 안전하게 캐스팅)
            Map<String, Object> prop = (Map<String, Object>) map.get("properties");
            String nickname = (String) prop.get("nickname");
            String profileImage = (String) prop.get("profile_image");
            
            MemberDto member = service.socialIdCheck(idStr);

            KakaoMemberDto kakaoDto = new KakaoMemberDto(idStr, nickname, profileImage, member);
            
            return kakaoDto;
            
            
            
            
	        
		}catch(Exception e) {
			e.printStackTrace();
			  throw new Exception("카카오 API 호출 중 오류 발생", e); // 예외를 상위로 던짐
		}
		
	}

}
