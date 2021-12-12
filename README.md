# 🏵 Blooming Project 소개
>블루밍 서비스는 머신러닝 기반 우울증 극복 지원 웹 서비스입니다.  
>우울증을 검사하고, 우울증을 스스로 이겨낼 수 있도록 일기 작성, 상담 서비스, 극복 후기 공유 등의 서비스를 제공합니다.  
>서비스명 블루밍은 `우울(blue) + 꽃이 피는(blossom)`의 합성어로 `블루밍(blooming, 활짝 핀)`. 결국에는 활짝 필 꽃이라는 의미를 갖고 있습니다. 

</br>

## ⏱ 제작 기간 & 참여 인원
- 2020.10.20 ~ 2020.11.24
- 총 6명의 팀 프로젝트(프론트엔드 2명, 백엔드 2명, 머신러닝 2명)

</br>

## 💁‍♂️ Wiki
- [프로젝트 기획서]()
- [요구사항정의서]()
- [화면설계서]()
- [디렉토리 구조]()
- [테이블명세서]()
- [시스템테스트결과서]()
- [WBS]()
- [블루밍 시연 영상](https://www.youtube.com/watch?v=EmWq5_p0dwE)

</br>

## 👨‍🏫 서비스 소개

### 핵심 서비스 
- 전문가로부터 인증 받은 `우울증 진단 도구`를 활용하여, 간단한 우울증 자가 진단과 우울 극복 서비스 권유
- 일기 작성 후 `텍스트마이닝(Text Mining)`을 통한 텍스트 감성분석을 통해 날짜마다의 감정을 그래프로 시각화하여 보여주는 서비스
- 감정의 정도에 따른 나무의 성장 모습을 시각화하여 긍정적인 감정 변화로의 동기부여를 돕는 서비스
- 공인 받은 임상심리전문가가 진행하는 `집단상담 서비스`를 통해 병원에 방문하는 것을 두려워하는 사람들을 위한 익명성 보장 언택트 상담 서비스 제공
- 우울증 극복 후기 게시판을 통해 우울증을 극복했던 다양한 경험을 공유 할 수 있는 `극복 후기 서비스` 제공
- `지도 API를 활용`하여 회원 주변의 공인인증 상담센터의 정보를 제공하여 신뢰성과 전문성을 보장하는 서비스

<br>

### 서비스 흐름도
![서비스 흐름도](https://user-images.githubusercontent.com/70616657/117522771-256f6000-aff0-11eb-8b3f-d4cd107c9442.PNG)
  

<br>

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

<br>

블루밍 프로젝트의 핵심 개발 내용은 다음과 같습니다.  

<br>

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

<br>

<details>
<summary><b>핵심 기능 개발 설명 펼치기</b></summary>
<div markdown="1">

### 0️⃣ 전체 흐름
  
![image](https://user-images.githubusercontent.com/70616657/145711763-bdad77ab-5bbe-439e-b540-64a5ad2eab64.png)

<br>
  
__JSP와 Servlet을 기반으로 제작하였습니다.__  
- JSP를 활용하여 화면 출력 및 Servlet으로 데이터 전달.
- 매핑된 각 URL에 알맞는 Servlet에서 비즈니스 로직 처리
- DAO 패키지 class에는 DB연동 로직을 구현.
- Python Flask를 활용하여 Servlet과 Python 서버 간의 API 통신 구현.

<br>

### 1️⃣ 일기 기능

__`1. 일기 작성 기능`__  
- **데이터 입력 및 요청** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diaryWrite.jsp#L103-L144)
  - JSP에서 form에서 Flask 서버 주소로 작성한 일기 데이터를 전송합니다.  

- **Flask** :pushpin: [코드 확인]()
  - JSP로 부터 전송 받은 데이터를 학습한 모델로 가공 후, Servlet으로 return 합니다.  

- **Servlet** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/DiaryPost.java#L15)
  - Flask로 부터 받아온 데이터를 DB에 저장합니다.  
 
<br>

__`2. 일기 출력 기능`__  
- **날짜에 따른 일기 출력**  :pushpin: [조회 부분 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L247-L257) / [Ajax 부분 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L310-L340)
  - 사용자로 부터 날짜를 입력 받아 DB에서 해당 날짜에 해당하는 일기 데이터를 조회하여, 일기 제목을 출력해줍니다. 이 때, Ajax를 활용해 비동기화 출력을 구현했습니다.
  - 제목을 누르면, 일기 제목에 해당하는 구체적인 내용 값을 DB에서 조회하여 새 페이지에 출력해줍니다.


<br>

__`3. 이미지, 그래프 출력 기능`__  
- **그래프 출력** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L69-L116)
  - 구글 차트 API를 활용하여 그래프를 구현했습니다. 작성한 일기 점수에 따라 그래프 점수를 책정하여 출력해줍니다.  

- **나무 성장 이미지 출력** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/diary.jsp#L215-L235)
  - 일기 점수에 따라 출력할 이미지를 선택하여 출력해줍니다.  

<br>
  
### 2️⃣ 상담 예약 기능
  
__`1. 상담 신청`__  
- **상담 신청** :pushpin: [JSP 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/counsel.jsp#L246-L256) / [Servlet 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/ReserveRequest.java#L17)
  - 상담 신청 버튼을 누르면, 상담 게시글을 작성한 상담자를 받고, 세션에 저장되어 있는 접속한 사람의 이메일과 연관된 정보를 DB에서 조회 후, 해당 데이터를 예약 테이블 DB에 저장합니다. 이 때, 한글 데이터 깨짐 방지를 위해 encodeURI를 활용했습니다.

<br>

__`2. 상담 출력`__  
- **상담 게시글 출력** :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/counsel.jsp#L150-L201)
  - 세션에 저장된 이메일을 조회하여 회원, 상담사, 예약, 비예약 등 상황별로 출력문을 조정하여 상담 게시글 상태를 출력해줍니다. 

- **상담 예약 리스트 조회**  :pushpin: [코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/booking.jsp#L106-L181)
  - 세션에 저장된 이메일을 통해 접속한 사람과 연관된 상담 예약 현황을 예약 테이블 DB에서 조회하여 출력해줍니다.  

<br>

### 3️⃣ 지도API를 활용한 센터 찾기 기능
__`1. 지도 기능`__  
- **마커 표시 및 센터 찾기 기능** :pushpin: [JSP 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/contact.jsp#L107-L205) / [Ajax 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/contact.jsp#L311-L339) / [Servlet 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/CenterCheck.java#L19)
  - 카카오톡 지도 API를 활용하여 지도와 관련된 서비스 구현했습니다.
  - 마우스와 접촉한 데이터 문자열을 필요한 부분만 파싱 후, Ajax를 통해 파싱된 데이터를 DB에서 센터를 찾는 검색 조건으로 활용했습니다. 

<br>

### 4️⃣ 그 외 기능
- **로그인, 회원가입 기능** :pushpin: [로그인 Servlet 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/control/LoginService.java#L19) / [회원가입 Ajax 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/signup.html#L229-L289)
  - JSP으로 부터 받은 회원 정보와 DB 내의 회원 정보 일치여부 확인하여 로그인 기능을 구현했습니다.
  - 회원가입 시, Ajax를 통해 이메일, 닉네임 중복을 확인하는 기능을 구현했습니다.

- **극복 후기 페이지** :pushpin: [JSP 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/WebContent/comments.jsp#L111-L126) / [DAO 코드 확인](https://github.com/Jsim6342/blooming-project/blob/239e746c9e85225b3ef2ef651c77802622cb8453/Blooming/src/com/DAO/ReviewDAO.java#L212)
  - JSP와 DAO에 페이징 로직을 직접 계산하는 형태로 구현하여 페이징 기능을 구현하였습니다.

</div>
</details>

<br>

## 🌟 트러블 슈팅

<details>
<summary> 협업 문제 </summary>
<div markdown="1">
  
  - 짧은 기간 내에 아이디어 결정, ERD 설계, JSP & Servlet 개발, 머신러닝 개발 등 많은 업무를 해야했습니다.
  - 팀장으로서 제약된 시간에 업무를 모두 끝낼 수 있도록 팀원들이 선호하는 업무에 맞게 분업하여 프로젝트를 진행했습니다.
  - 보다 원활하게 협업할 수 있도록 Git과 Github를 활용하여 코드를 백업 및 공유하는 형태로 프로젝트를 진행하여 정해진 기간 내에 프로젝트 구현을 마칠 수 있었습니다.
   
</div>
</details> 

<br>

<details>
<summary> encoding 문제 </summary>
<div markdown="1">
  
  - JSP에서 Servlet으로 데이터를 보내는 과정에 한글데이터 깨짐 현상이 발생하였습니다.
  - 프로젝트 개발 iDE로 이클립스를 사용했는데, 보통 이클립스의 경우 초기 인코딩 설정이 EUC-KR, MS946 등으로 설정되어 있기 때문에 인코딩 과정에서 한글이 깨지는 현상이었습니다.
  - 기본적으로 이클립스 인코딩 설정을 UTF-8로 설정하였으며, JSP 파일, Javascript에서 Servlet으로 데이터를 보내는 부분, Servlet에서 request를 받는 부분 등에서 모두 UTF-8로 인코딩 설정을 해주어 해결하였습니다.
   
</div>
</details>

<br>

<details>
<summary> 동적 이미지 처리 문제 </summary>
<div markdown="1">
  
  - 일기 조회 페이지에서 사용자의 긍, 부정 점수에 맞게 나무 이미지를 다르게 보여줘야 하는 상황이었습니다.
  - 각각의 이미지를 이미지 경로에 저장하고, 로그인한 유저의 긍, 부정 점수를 DB에서 조회하여 해당 점수에 맞게 이미지를 출력되게 if-else 구문을 활용하여 구현하였습니다.
   
</div>
</details>

<br>

<details>
<summary> Json 데이터 변환 </summary>
<div markdown="1">
  
  - Ajax를 통해 비동기 통신을 구현하면서 Json 형태로 데이터를 주고받아야 하는 상황이 발생했습니다.
  - 자바 객체를 Json 형태로 바꿔주는 방법을 모색하다가 Gson을 발견하였고, Gson을 활용하여 자바 객체를 Json 형태로 변환할 수 있었습니다.
   
</div>
</details>

<br>

<details>
<summary> 극복 후기  </summary>
<div markdown="1">
  
  - 극복 후기를 출력하는 페이지에서 DB 데이터에 있는 모든 극복 후기를 내려주는 것이 아닌 페이지로 데이터를 나누어 보여주는 페이징 작업이 필요했습니다.
  - 시작 페이지 번호와 한 페이지에 출력할 데이터 갯수를 JSP에서 계산하고, 이를 Servlet으로 넘겨주어 해당 값을 바탕으로 DAO에서 페이지를 조회하는 형태로 페이징을 구현하였습니다.
   
</div>
</details>

<br>

<details>
<summary> 지도 API 활용 </summary>
<div markdown="1">
  
  - 카카오 지도 API를 활용하여 유저가 지도에 표시된 마커에 마우스를 대면 해당 마커와 관련된 데이터가 화면에 출력되는 기능을 구현해야 했습니다.
  - 카카오에서 제공하는 지도API Javascript 코드를 필요에 맞게 변형하였습니다.
  - 정보 제공이 필요한 상담소를 포지션 배열에 등록하고, 해당 배열에 마커를 생성하는 반복문 내에 마우스 이벤트 로직을 담당하는 makeOverListener 메서드에 매개변수 값을 조정(for문을 돌며 생성된 i 값을 추가함)하였습니다.
  - 마커에 마우스를 대면, 마우스 이벤트가 발생하고, makeOverListener함수의 매개변수로 넘어간 마커의 index 값으로 상담소 포지션 배열 값을 조회합니다.
  - 조회한 포지션 배열 이름(상담소 이름)을 .split() 메서드를 활용하여 필요한 문자열을 추출하여 Ajax 메서드의 매개변수에 담아 해당 상담소 이름과 일치하는 DB 내의 상담소 데이터를 조회하는 Ajax를 호출합니다.
   
</div>
</details>

