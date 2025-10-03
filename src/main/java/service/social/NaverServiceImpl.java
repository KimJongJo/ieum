package service.social;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import dto.MemberDto;
import dto.otherDto.NaverMemberDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

public class NaverServiceImpl implements NaverService {

	MemberService service;
	
	public NaverServiceImpl() {
		service = new MemberServiceImpl();
	}

	// 액세스 토큰 요청
	@Override
	public String getAccessToken(String clientId, String clientSecret, String code, String state) throws Exception {
		String tokenUrl = "https://nid.naver.com/oauth2.0/token";
        String params = "grant_type=authorization_code"
                      + "&client_id=" + clientId
                      + "&client_secret=" + clientSecret
                      + "&code=" + code
                      + "&state=" + state;
        
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
	public NaverMemberDto getMemberDto(String token) throws Exception{
		String tokenUrl = "	https://openapi.naver.com/v1/nid/me";
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
            Map<String, Object> profile = (Map<String, Object>) map.get("response");
            
            String id = (String)profile.get("id");
            
            MemberDto member = service.socialIdCheck(id);
            
            
            String profileImage = (String)profile.get("profile_image");
            String gender = ((String)profile.get("gender")).equals("M") ? "MALE" : "FEMALE";
            String email = (String)profile.get("email");
            String tel = (String)profile.get("mobile");
            String birthDate = (String)profile.get("birthyear") + "-" + (String)profile.get("birthday");
            NaverMemberDto memberDto = new NaverMemberDto(member, id, profileImage, gender, email, tel, birthDate);
            
            return memberDto; 
            
            
            
            
	        
		}catch(Exception e) {
			e.printStackTrace();
			  throw new Exception("네이버 API 호출 중 오류 발생", e); // 예외를 상위로 던짐
		}
	}

	// 계정은 없지만 이미 사용중인 네이버 계정이 있는지
	@Override
	public MemberDto emailCheck(String email) {

		return service.emailCheck(email);
	}
	
	


}
