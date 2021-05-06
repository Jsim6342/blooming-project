# :pushpin: Blooming Project
>머신러닝 기반 우울증 극복 지원 웹 서비스 

</br>

## 1. 제작 기간 & 참여 인원
- 2020.10.20 ~ 2020.11.24
- 팀 프로젝트

</br>

## 2. 서비스 소개

__서비스 동작 영상__


__핵심 서비스__  
- 전문가로부터 인증 받은 ‘우울증 진단 도구’를 활용하여, 간단한 우울증 자가 진단과 우울 극복 서비스 권유
- 일기 작성 후 텍스트마이닝(Text Mining)을 통한 텍스트 감성분석을 통해 날짜마다의 감정을 그래프로 시각화하여 보여주는 서비스
- 감정의 정도에 따른 나무의 성장 모습을 시각화하여 긍정적인 감정 변화로의 동기부여를 돕는 서비스
- 공인 받은 임상심리전문가가 진행하는 집단상담 서비스를 통해 병원에 방문하는 것을 두려워하는 사람들을 위한 익명성 보장 언택트 상담 서비스 제공
- 우울증 극복 후기 게시판을 통해 우울증을 극복했던 다양한 경험을 공유 할 수 있는 후기 서비스 제공
- 지도 API를 활용하여 회원 주변의 공인인증 상담센터의 정보를 제공하여 신뢰성과 전문성을 보장하는 서비스

__서비스 흐름도__
![서비스 흐름도](https://user-images.githubusercontent.com/70616657/117236699-34c1a280-ae64-11eb-90fb-21ed948893ce.png)
  

</br>

## 3. 사용 기술Java 8
#### `Back-end`
  - Java 8
  - Servlet
  - JSP
  - SQL
  - Python
#### `Front-end`
  - HTML
  - CSS
  - Javascript

</br>

## 4. ERD 설계
![image](https://user-images.githubusercontent.com/70616657/117235987-bf090700-ae62-11eb-869a-003342bd51a4.png)



## 5. 프로젝트 개발 내용
__Text Mining을 이용한 일기의 감정 진단과 점수화__
- 일상에서 쓰는 다양한 문장에 대해 형태소로 분리하여 감정 분석을 할 수 있는 알고리즘 제작, 회원이 작성한 일기를 해당 알고리즘을 통해 Text Mining을 실시, 그에 따라 긍, 부정을 분류하고 점수를 부여
__감정 분석을 통한 나무의 성장과정, 그래프의 시각화__
- 감정 분석을 통해 얻은 일기 점수를 활용하여 긍정적일수록 나무가 성장하는 모습을 시각적으로 보여줌
- 일기의 작성 날짜별로 긍정,부정의 정도를 그래프로 시각화하여 감정의 변화과정을 한 눈에 알아볼 수 있도록 제시
__집단상담 서비스__
- 상담사의 상담회기 등록, 회원의 예약 기능을 통한 실시간 예약서비스 구현
__지도API를 이용한 상담 센터 위치 및 매칭된 정보 출력__
- 지도에서 표시되어 있는 전문상담센터의 위치에 마킹되어 있는 PIN에 마우스를 가져가면 센터이름, 주소, 번호, 영업시간 등 클릭한 센터에 매칭되는 정보 제공
__극복후기 커뮤니티 개설__
- 비회원은 글을 열람하는 것만 가능, 회원들에 한해서만 게시글을 작성할 수 있도록 구현, 페이지에 9개의 게시글이 넘어가면 다음 페이지로 넘어가는 페이징 기법 적용

<details>
<summary><b>핵심 기능 개발 설명 펼치기</b></summary>
<div markdown="1">

### 5.1. 전체 흐름
![image](https://user-images.githubusercontent.com/70616657/117235753-4b66fa00-ae62-11eb-9995-bab7b4a26955.png)

__MVC 모델을 기반으로 제작__
- Model: DB 테이블을 기반으로한 자바 class를 만들어 구현
- View: JSP 활용
- Controller: Servlet과 JSP를 활용
- DAO class를 통해 DB와 연동
- Python Flask를 활용하여 클라이언트로 부터 받은 데이터를 머신러닝으로 가공 후, Servlet에 반환.


### 5.2. 일기 기능
__일기 작성 기능__
![image](https://user-images.githubusercontent.com/70616657/117237466-0218a980-ae66-11eb-8c28-a68f27722238.png)
- **데이터 입력 및 요청** :pushpin: [코드 확인]
  - JSP에서 form에서 Flask 서버 주소로 작성한 일기 데이터를 전송합니다.

![image](https://user-images.githubusercontent.com/70616657/117237808-a7338200-ae66-11eb-9b9f-89cda20b8ef1.png)
- **Flask** :pushpin: [코드 확인]()
  - JSP로 부터 전송 받은 데이터를 학습한 모델로 가공 후, Servlet으로 return 합니다.

![image](https://user-images.githubusercontent.com/70616657/117238038-1f9a4300-ae67-11eb-856a-0214fc8885b1.png)
- **Servlet** :pushpin: [코드 확인]()
  - Flask로 부터 받아온 데이터를 DB에 저장합니다.

__일기 출력 기능__
![image](https://user-images.githubusercontent.com/70616657/117238166-5ff9c100-ae67-11eb-90fd-d6af9ae4b988.png)
![image](https://user-images.githubusercontent.com/70616657/117238325-9e8f7b80-ae67-11eb-806d-44f633b03f32.png)
- **날짜에 따른 일기 출력** :pushpin: [코드 확인]
  - 사용자로 부터 날짜를 입력 받아 DB에서 해당 날짜에 해당하는 일기 데이터를 조회하여, 일기 제목을 출력해줍니다. 이 때, Ajax를 활용해 비동기화 출력을 구현했습니다.
  - 제목을 누르면, 일기 제목에 해당하는 구체적인 내용 값을 DB에서 조회하여 새 페이지에 출력해줍니다.

__이미지, 그래프 출력 기능__
![image](https://user-images.githubusercontent.com/70616657/117238541-08a82080-ae68-11eb-9b9b-c55edf3f1714.png)
- **그래프 출력** :pushpin: [코드 확인]
  - 구글 차트 API를 양식을 활용하여 그래프를 구현했습니다. 작성한 일기 점수에 따라 그래프 점수를 책정하여 출력해줍니다.

![image](https://user-images.githubusercontent.com/70616657/117238690-5cb30500-ae68-11eb-8493-5866d522c279.png)
![image](https://user-images.githubusercontent.com/70616657/117238694-5de43200-ae68-11eb-8863-018935fac1a5.png)
- **나무 성장 이미지 출력** :pushpin: [코드 확인]
  - 일기 점수에 따라 출력할 이미지를 선택하여 출력해줍니다.

### 5.3. 상담 예약 기능
__상담 신청__
![image](https://user-images.githubusercontent.com/70616657/117238884-ad2a6280-ae68-11eb-9af8-70d495b36540.png)
- **상담 신청** :pushpin: [코드 확인]
  - 상담 신청 버튼을 누르면, 상담 게시글을 작성한 상담자를 받고, 세션에 저장되어 있는 접속한 사람의 이메일과 연관된 정보를 DB에서 조회 후, 해당 데이터를 예약 테이블 DB에 저장합니다. 이 때, encodeURI를 활용했습니다.
  - 
__상담 출력__
![image](https://user-images.githubusercontent.com/70616657/117239343-8b7dab00-ae69-11eb-87a9-c3b82282ff67.png)
- **상담 게시글 출력** :pushpin: [코드 확인]
  - 세션에 저장된 이메일을 조회하여 회원, 상담사, 예약, 비예약 등 상황별로 출력문을 조정하여 상담 게시글 상태를 출력해줍니다.
  - 
![image](https://user-images.githubusercontent.com/70616657/117239187-422d5b80-ae69-11eb-8462-4bfcb2d0d265.png)
- **상담 예약 리스트 조회** :pushpin: [코드 확인]
  - 세션에 저장된 이메일을 통해 접속한 사람과 연관된 상담 예약 현황을 예약 테이블 DB에서 조회하여 출력해줍니다.


### 5.4. 지도, 센터 찾기 기능
__지도 기능__
![image](https://user-images.githubusercontent.com/70616657/117239520-e2838000-ae69-11eb-98b5-4b1202c7d956.png)
- **마커 표시** :pushpin: [코드 확인]
  - 카카오톡 지도 API를 활용하여 지도와 관련된 서비스 구현했습니다.

![image](https://user-images.githubusercontent.com/70616657/117239557-fe872180-ae69-11eb-99a1-cdc1ad1aa2e6.png)
![image](https://user-images.githubusercontent.com/70616657/117239565-00e97b80-ae6a-11eb-92fe-ba2bca3e1c2e.png)
- **센터 찾기 기능** :pushpin: [코드 확인]
  - 마우스와 접촉한 데이터 문자열을 필요한 부분만 파싱 후, Ajax를 통해 파싱된 데이터를 DB에서 센터를 찾는 검색 조건으로 활용했습니다.

### 5.5. 로그인 기능
![image](https://user-images.githubusercontent.com/70616657/117239719-41e19000-ae6a-11eb-9149-7fde4fb11e48.png)
- **로그인 기능** :pushpin: [코드 확인]
  - JSP form으로 부터 받은 회원 정보와 DB 내의 회원 정보 일치여부 확인하여 로그인 기능을 구현했습니다.

</div>
</details>

</br>

## 6. 회고 / 느낀점 / 성과물
