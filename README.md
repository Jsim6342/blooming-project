# :pushpin: Blooming Project
>블루밍 서비스는 머신러닝 기반 우울증 극복 지원 웹 서비스입니다.
>우울증을 검사하고, 우울증을 스스로 이겨낼 수 있도록 일기 작성, 상담 서비스, 극복 후기 공유 등의 서비스를 제공합니다.
>서비스명 블루밍은 우울(blue) + 꽃이 피는(blossom)의 합성어로 블루밍(blooming, 활짝 핀). 결국에는 활짝 필 꽃이라는 의미를 갖고 있습니다. 

</br>

## ⏱ 제작 기간 & 참여 인원
- 2020.10.20 ~ 2020.11.24
- 총 6명의 팀 프로젝트(프론트엔드 2명, 백엔드 2명, 머신러닝 2명)

</br>

## 💁‍♂️ Wiki
- 프로젝트 기획서
- 요구사항정의서
- 화면설계서
- 디렉토리 구조
- 테이블명세서
- 시스템테스트결과서
- WBS
- [블루밍 시연 영상](https://www.youtube.com/watch?v=EmWq5_p0dwE)

</br>

## 👨‍🏫서비스 소개

__핵심 서비스__  
- 전문가로부터 인증 받은 `우울증 진단 도구`를 활용하여, 간단한 우울증 자가 진단과 우울 극복 서비스 권유
- 일기 작성 후 `텍스트마이닝(Text Mining)`을 통한 텍스트 감성분석을 통해 날짜마다의 감정을 그래프로 시각화하여 보여주는 서비스
- 감정의 정도에 따른 나무의 성장 모습을 시각화하여 긍정적인 감정 변화로의 동기부여를 돕는 서비스
- 공인 받은 임상심리전문가가 진행하는 `집단상담 서비스`를 통해 병원에 방문하는 것을 두려워하는 사람들을 위한 익명성 보장 언택트 상담 서비스 제공
- 우울증 극복 후기 게시판을 통해 우울증을 극복했던 다양한 경험을 공유 할 수 있는 `극복 후기 서비스` 제공
- `지도 API를 활용`하여 회원 주변의 공인인증 상담센터의 정보를 제공하여 신뢰성과 전문성을 보장하는 서비스

__서비스 흐름도__
![서비스 흐름도](https://user-images.githubusercontent.com/70616657/117522771-256f6000-aff0-11eb-8b3f-d4cd107c9442.PNG)
  

</br>

## 🛠 사용 기술
#### `Back-end`
  - Java 8
  - Servlet
  - JSP
  - Oracle
  - Python
#### `Front-end`
  - HTML
  - CSS
  - Javascript

</br>

## 📦 ERD 설계
![image](https://user-images.githubusercontent.com/70616657/117235987-bf090700-ae62-11eb-869a-003342bd51a4.png)



## 🔎 프로젝트 개발 내용  

- __Text Mining을 이용한 일기의 감정 진단과 점수화__  
일상에서 쓰는 다양한 문장에 대해 형태소로 분리하여 감정 분석을 할 수 있는 알고리즘 제작, 회원이 작성한 일기를 해당 알고리즘을 통해 Text Mining을 실시, 그에 따라 긍, 부정을 분류하고 점수를 부여  
- __감정 분석을 통한 나무의 성장과정, 그래프의 시각화__  
감정 분석을 통해 얻은 일기 점수를 활용하여 긍정적일수록 나무가 성장하는 모습을 시각적으로 보여줌  
일기의 작성 날짜별로 긍정,부정의 정도를 그래프로 시각화하여 감정의 변화과정을 한 눈에 알아볼 수 있도록 제시  
- __집단상담 서비스__  
상담사의 상담회기 등록, 회원의 예약 기능을 통한 실시간 예약서비스 구현  
- __지도API를 이용한 상담 센터 위치 및 매칭된 정보 출력__  
지도에서 표시되어 있는 전문상담센터의 위치에 마킹되어 있는 PIN에 마우스를 가져가면 센터이름, 주소, 번호, 영업시간 등 클릭한 센터에 매칭되는 정보 제공  
- __극복후기 커뮤니티 개설__  
비회원은 글을 열람하는 것만 가능, 회원들에 한해서만 게시글을 작성할 수 있도록 구현, 페이지에 9개의 게시글이 넘어가면 다음 페이지로 넘어가는 페이징 기법 적용  

<details>
<summary><b>핵심 기능 개발 설명 펼치기</b></summary>
<div markdown="1">

### 0️⃣ 전체 흐름
  
![image](https://user-images.githubusercontent.com/70616657/145711763-bdad77ab-5bbe-439e-b540-64a5ad2eab64.png)

__JSP와 Servlet을 기반으로 제작__
- JSP를 활용하여 화면 출력 및 Servlet으로 데이터 전달.
- 매핑된 각 URL에 알맞는 Servlet에서 비즈니스 로직 처리
- DAO 패키지 class에는 DB연동 로직을 구현.
- Python Flask를 활용하여 Servlet과 Python 서버 간의 API 통신 구현.


<details>
<summary><b>일기 기능 펼치기</b></summary>
<div markdown="1">
  
### 1️⃣ 일기 기능

__일기 작성 기능__  
- **데이터 입력 및 요청** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diaryWrite.jsp#L103-L144)
  - JSP에서 form에서 Flask 서버 주소로 작성한 일기 데이터를 전송합니다.  

</br>

- **Flask** :pushpin: [코드 확인]()
  - JSP로 부터 전송 받은 데이터를 학습한 모델로 가공 후, Servlet으로 return 합니다.  

</br>

- **Servlet** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/DiaryPost.java#L15)
  - Flask로 부터 받아온 데이터를 DB에 저장합니다.  
 

</br>
</br>

__일기 출력 기능__  
- **날짜에 따른 일기 출력** 
  - 사용자로 부터 날짜를 입력 받아 DB에서 해당 날짜에 해당하는 일기 데이터를 조회하여, 일기 제목을 출력해줍니다. 이 때, Ajax를 활용해 비동기화 출력을 구현했습니다.
  - 제목을 누르면, 일기 제목에 해당하는 구체적인 내용 값을 DB에서 조회하여 새 페이지에 출력해줍니다.
  - :pushpin: [조회 부분 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L247-L257)
  - :pushpin: [Ajax 부분 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L310-L340)

</br>
</br>

__이미지, 그래프 출력 기능__  
- **그래프 출력** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L69-L116)
  - 구글 차트 API를 활용하여 그래프를 구현했습니다. 작성한 일기 점수에 따라 그래프 점수를 책정하여 출력해줍니다.  

</br>

- **나무 성장 이미지 출력** 
  - 일기 점수에 따라 출력할 이미지를 선택하여 출력해줍니다.  
  - :pushpin: [움직이는 해 이미지 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L17-L39)
  - :pushpin: [점수에 따라 변하는 나무 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L215-L235)

</div>
</details>

</br>

<details>
<summary><b>상담 예약 기능 펼치기</b></summary>
<div markdown="1">
  
### 2️⃣ 상담 예약 기능
  
__상담 신청__  
- **상담 신청** 
  - 상담 신청 버튼을 누르면, 상담 게시글을 작성한 상담자를 받고, 세션에 저장되어 있는 접속한 사람의 이메일과 연관된 정보를 DB에서 조회 후, 해당 데이터를 예약 테이블 DB에 저장합니다. 이 때, 한글 데이터 깨짐 방지를 위해 encodeURI를 활용했습니다.
- :pushpin: [JSP 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/counsel.jsp#L246-L256)
- :pushpin: [Servlet 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/ReserveRequest.java#L17)

</br>
</br>

__상담 출력__  
- **상담 게시글 출력** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/counsel.jsp#L150-L201)
  - 세션에 저장된 이메일을 조회하여 회원, 상담사, 예약, 비예약 등 상황별로 출력문을 조정하여 상담 게시글 상태를 출력해줍니다. 

</br>

- **상담 예약 리스트 조회**  :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/booking.jsp#L106-L181)
  - 세션에 저장된 이메일을 통해 접속한 사람과 연관된 상담 예약 현황을 예약 테이블 DB에서 조회하여 출력해줍니다.  

</div>
</details>

</br>

<details>
<summary><b>지도, 센터 찾기 기능 펼치기</b></summary>
<div markdown="1">

### 3️⃣ 지도API를 활용한 센터 찾기 기능
__지도 기능__  
- **마커 표시 및 센터 찾기 기능** 
  - 카카오톡 지도 API를 활용하여 지도와 관련된 서비스 구현했습니다.
  - 마우스와 접촉한 데이터 문자열을 필요한 부분만 파싱 후, Ajax를 통해 파싱된 데이터를 DB에서 센터를 찾는 검색 조건으로 활용했습니다. 
  - :pushpin: [JSP 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/contact.jsp#L107-L205)
  - :pushpin: [Ajax 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/contact.jsp#L311-L339)
  - :pushpin: [Servlet 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/CenterCheck.java#L19)

</br>

</div>
</details>

</br>

<details>
<summary><b>로그인 기능 펼치기</b></summary>
<div markdown="1">

### 4️⃣ 그 외 기능
- **로그인, 회원가입 기능** 
  - JSP으로 부터 받은 회원 정보와 DB 내의 회원 정보 일치여부 확인하여 로그인 기능을 구현했습니다.
  - 회원가입 시, Ajax를 통해 이메일, 닉네임 중복을 확인하는 기능을 구현했습니다.
  - :pushpin: [로그인 Servlet 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/LoginService.java#L19)
  - :pushpin: [회원가입 Ajax 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/signup.html#L229-L289)
  
  </br>
  
  - **극복 후기 페이지** 
  - JSP와 DAO에 페이징 로직을 직접 계산하는 형태로 구현하여 페이징 기능을 구현하였습니다.
  - :pushpin: [JSP 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/comments.jsp#L111-L126)
  - :pushpin: [DAO 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/DAO/ReviewDAO.java#L212)


</div>
</details>

</br>

</div>
</details>

</br>

## 🌟 트러블 슈팅

<details>
<summary> 협업 문제 </summary>
<div markdown="1">
  
  - 역할 분배 및 git을 통한 협업 활성화
   
</div>
</details> 

<details>
<summary> encoding, decoding 문제 </summary>
<div markdown="1">
  
  - 한글 데이터 인코딩 문제 해결
   
</div>
</details>

<details>
<summary> 동적 이미지 처리 문제 </summary>
<div markdown="1">
  
  - 로테이션 함수 사용 및 if-else를 활용하여 데이터에 적합한 이미지 출력 처리
   
</div>
</details>

<details>
<summary> Json 데이터 변환 </summary>
<div markdown="1">
  
  - Ajax 통신 간, JSON 데이터 변환. Gson 사용
   
</div>
</details>

<details>
<summary> 극복 후기  </summary>
<div markdown="1">
  
  - 문자열 파싱 및 제공된 함수 변형
   
</div>
</details>

<details>
<summary> 지도 API 활용 </summary>
<div markdown="1">
  
  - 문자열 파싱 및 제공된 함수 변형
   
</div>
</details>

