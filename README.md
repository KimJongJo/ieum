# 건강이음
```
정신건강 상담을 위한 온라인 예약 시스템인 
건강이음의 프로젝트 레포지토리입니다.

코로나19이후, 정신건강에 어려움을 겪는 사람들이 증가했다는 뉴스를 접했고,
정신질환자가 급증함에 따라 의료시설을 이용하는 사람들이 많아질 것으로 예상했지만,
온라인 예약이 가능한 공공 의료시설이 그리 많지 않다는 사실을 알게되었습니다.
공공 의료시설에서 온라인 예약 시스템을 도입한다면 훨씬 더 편리할 것 같다는 생각이 들었습니다.
그래서 정신건강 상담을 위한 온라인 예약 시스템인'건강이음'을 개발하게되었습니다.

Kakao Map, Login(Kakao, Google, Naver), FullCalendar.js를 사용했습니다.

환자, 의사, 병원관리자, 사이트관리자라는 액터로 나뉩니다.
환자 - 자가검진, 병원조회/예약, 커뮤니티, 병원등록신청
의사 - 환자이력 조회, 진료 및 기록 관리, 진단서 작성
병원관리자 - 공지사항 관리, 병원 관리
사이트관리자 - 회원/병원 관리, 병원 신청 관리

인원 : 4명
프로젝트 기간 : 2024/09/22 ~ 2024/10/17
맡은 역할 : 로그인, 회원가입, 아이디/비밀번호 찾기, 사이트관리자(회원관리, 병원관리, 병원신청목록), 병원관리자(대기열 관리, 진단서 관리)
```

---

Table
<img width="2290" height="1214" alt="image" src="https://github.com/user-attachments/assets/7a1269e4-0840-4bcb-8cba-ff52f8b48843" />


<details>
<summary>
개발 환경
</summary>

  
| Environment | Detail |
| --- | --- |
| 환경 | Windows |
| 언어 | Java, Javascript, HTML5, CSS3, JavaScript, jQuery, MySQL |
| 프레임워크 / 라이브러리|  FullCalendar.js |
| 데이터베이스 | Mybatis | 
| 툴 | eclipse, HeidiSQL, Postman |
| WAS | Apache Tomcat 9.0 |
| API | Kakao Map, Login(Kakao, Google, Naver) |
| 협업 | Github, Notion, ERD Cloud, Draw.io, Figma |

  
</details>

## 회원/비회원
### 로그인(소셜로그인)/회원가입
<img width="1586" height="819" alt="로그인" src="https://github.com/user-attachments/assets/f0fab992-977f-4ac8-a33a-13759224d81d" />


<img width="1265" height="864" alt="회원가입1" src="https://github.com/user-attachments/assets/8770c050-788a-40d3-931e-b7a451893876" />
<img width="1264" height="826" alt="회원가입2" src="https://github.com/user-attachments/assets/04160dce-ce41-4a64-b544-cb21eef0d67f" />
<img width="1265" height="826" alt="회원가입3" src="https://github.com/user-attachments/assets/1a49ebbb-7a47-42a0-8b2f-3cede235ecbb" />
<img width="1263" height="825" alt="회원가입4" src="https://github.com/user-attachments/assets/2f2b09a1-e48e-4549-b631-540bfbaf0ed5" />
<img width="1266" height="503" alt="회원가입5" src="https://github.com/user-attachments/assets/1cdcc892-fd5a-4eaf-958b-dfacbfb27bed" />


### 아이디/비밀번호 찾기
<img width="1521" height="823" alt="비밀번호 찾기" src="https://github.com/user-attachments/assets/0e2b5d10-eb31-41a0-9a95-d9f690d26f0d" />

### 병원등록신청
<img width="1267" height="588" alt="병원등록신청1" src="https://github.com/user-attachments/assets/d1fe5490-975c-4036-b7fb-56da195e7071" />
<img width="1267" height="821" alt="병원등록신청2" src="https://github.com/user-attachments/assets/38de550a-e0b0-4425-aa42-0a9c2dcfada2" />
<img width="1263" height="618" alt="병원등록신청3" src="https://github.com/user-attachments/assets/334430f4-7e0e-41b7-9d89-5a7ccbe4522b" />

### 마이페이지-진단이력
<img width="1423" height="796" alt="진단이력" src="https://github.com/user-attachments/assets/3a6bbee6-4b8b-42d0-b476-0e633e5a647e" />

<hr>

## 의사
### 오늘예약
<img width="1517" height="684" alt="오늘예약" src="https://github.com/user-attachments/assets/55885bfd-d00c-4558-8069-f7bd6ea1c105" />

### 예약기록
<img width="1424" height="745" alt="예약기록" src="https://github.com/user-attachments/assets/ca574884-f2dd-4818-b6b8-4c90105ff283" />

### 진단서 관리
<img width="1554" height="844" alt="진단서관리" src="https://github.com/user-attachments/assets/0917f470-ad00-44c2-b6a3-7e7e268636de" />

<hr>

## 병원관리자
### 병원정보수정
<img width="1515" height="784" alt="병원정보수정" src="https://github.com/user-attachments/assets/5ec426c0-a626-45d9-9071-2f245c56402b" />

<hr>

## 사이트관리자
### 회원/병원관리
<img width="1237" height="808" alt="회원관리" src="https://github.com/user-attachments/assets/8f0a7866-eeb7-42d2-bed2-850a6f827f2b" />
<img width="1176" height="805" alt="의사관리" src="https://github.com/user-attachments/assets/f0334f3b-0723-4517-8f71-abc554d08bb1" />
<img width="1186" height="811" alt="병원관리" src="https://github.com/user-attachments/assets/c9f61018-18d4-457f-bf3d-0ed416071114" />

### 병원등록신청목록
<img width="1155" height="810" alt="병원등록신청" src="https://github.com/user-attachments/assets/de6cce9c-0cf0-4e1d-9a50-5bbf357be9e2" />







