# :pushpin: Blooming Project
>머신러닝 기반 우울증 극복 지원 웹 서비스 

</br>

## 1. 제작 기간 & 참여 인원
- 2020.10.20 ~ 2020.11.24
- 팀 프로젝트

</br>

## 2. 서비스 소개

__서비스 동작 영상__  

[블루밍 시연 영상](https://www.youtube.com/watch?v=EmWq5_p0dwE)



__핵심 서비스__  
- 전문가로부터 인증 받은 ‘우울증 진단 도구’를 활용하여, 간단한 우울증 자가 진단과 우울 극복 서비스 권유
- 일기 작성 후 텍스트마이닝(Text Mining)을 통한 텍스트 감성분석을 통해 날짜마다의 감정을 그래프로 시각화하여 보여주는 서비스
- 감정의 정도에 따른 나무의 성장 모습을 시각화하여 긍정적인 감정 변화로의 동기부여를 돕는 서비스
- 공인 받은 임상심리전문가가 진행하는 집단상담 서비스를 통해 병원에 방문하는 것을 두려워하는 사람들을 위한 익명성 보장 언택트 상담 서비스 제공
- 우울증 극복 후기 게시판을 통해 우울증을 극복했던 다양한 경험을 공유 할 수 있는 후기 서비스 제공
- 지도 API를 활용하여 회원 주변의 공인인증 상담센터의 정보를 제공하여 신뢰성과 전문성을 보장하는 서비스

__서비스 흐름도__
![서비스 흐름도](https://user-images.githubusercontent.com/70616657/117522771-256f6000-aff0-11eb-8b3f-d4cd107c9442.PNG)
  

</br>

## 3. 사용 기술
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

## 4. ERD 설계
![image](https://user-images.githubusercontent.com/70616657/117235987-bf090700-ae62-11eb-869a-003342bd51a4.png)



## 5. 프로젝트 개발 내용  

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

### 5.1. 전체 흐름
![image](https://user-images.githubusercontent.com/70616657/117235753-4b66fa00-ae62-11eb-9995-bab7b4a26955.png)

__JSP와 Servlet을 기반으로 제작__
- Servlet과 JSP를 활용하여 화면과 내부 로직을 구현
- DAO class를 통해 DB와 연동
- Python Flask를 활용하여 클라이언트로 부터 받은 데이터를 머신러닝으로 가공 후, Servlet에 반환.


<details>
<summary><b>일기 기능 펼치기</b></summary>
<div markdown="1">
  
### 5.2. 일기 기능
__5.2.1. 일기 작성 기능__  
- **데이터 입력 및 요청** 
  - JSP에서 form에서 Flask 서버 주소로 작성한 일기 데이터를 전송합니다.  
>![image](https://user-images.githubusercontent.com/70616657/117237466-0218a980-ae66-11eb-8c28-a68f27722238.png)

</br>

- **Flask** 
  - JSP로 부터 전송 받은 데이터를 학습한 모델로 가공 후, Servlet으로 return 합니다.  
> ![image](https://user-images.githubusercontent.com/70616657/117237808-a7338200-ae66-11eb-9b9f-89cda20b8ef1.png)

</br>

- **Servlet** 
  - Flask로 부터 받아온 데이터를 DB에 저장합니다.  
>![image](https://user-images.githubusercontent.com/70616657/117238038-1f9a4300-ae67-11eb-856a-0214fc8885b1.png)

</br>
</br>

__5.2.2. 일기 출력 기능__  
- **날짜에 따른 일기 출력** 
  - 사용자로 부터 날짜를 입력 받아 DB에서 해당 날짜에 해당하는 일기 데이터를 조회하여, 일기 제목을 출력해줍니다. 이 때, Ajax를 활용해 비동기화 출력을 구현했습니다.
  - 제목을 누르면, 일기 제목에 해당하는 구체적인 내용 값을 DB에서 조회하여 새 페이지에 출력해줍니다.
>![image](https://user-images.githubusercontent.com/70616657/117238166-5ff9c100-ae67-11eb-90fd-d6af9ae4b988.png)
>![image](https://user-images.githubusercontent.com/70616657/117238325-9e8f7b80-ae67-11eb-806d-44f633b03f32.png)

</br>
</br>

__5.2.3. 이미지, 그래프 출력 기능__  
- **그래프 출력** 
  - 구글 차트 API를 양식을 활용하여 그래프를 구현했습니다. 작성한 일기 점수에 따라 그래프 점수를 책정하여 출력해줍니다.  
>![image](https://user-images.githubusercontent.com/70616657/117238541-08a82080-ae68-11eb-9b9b-c55edf3f1714.png)

</br>

- **나무 성장 이미지 출력** 
  - 일기 점수에 따라 출력할 이미지를 선택하여 출력해줍니다.  
>![image](https://user-images.githubusercontent.com/70616657/117238690-5cb30500-ae68-11eb-8493-5866d522c279.png)
>![image](https://user-images.githubusercontent.com/70616657/117238694-5de43200-ae68-11eb-8863-018935fac1a5.png)


</div>
</details>

</br>

<details>
<summary><b>상담 예약 기능 펼치기</b></summary>
<div markdown="1">
  
### 5.3. 상담 예약 기능
__5.3.1. 상담 신청__  
- **상담 신청** 
  - 상담 신청 버튼을 누르면, 상담 게시글을 작성한 상담자를 받고, 세션에 저장되어 있는 접속한 사람의 이메일과 연관된 정보를 DB에서 조회 후, 해당 데이터를 예약 테이블 DB에 저장합니다. 이 때, encodeURI를 활용했습니다.
>![image](https://user-images.githubusercontent.com/70616657/117238884-ad2a6280-ae68-11eb-9af8-70d495b36540.png)

</br>
</br>

__5.3.2. 상담 출력__  
- **상담 게시글 출력** 
  - 세션에 저장된 이메일을 조회하여 회원, 상담사, 예약, 비예약 등 상황별로 출력문을 조정하여 상담 게시글 상태를 출력해줍니다. 
>![image](https://user-images.githubusercontent.com/70616657/117239343-8b7dab00-ae69-11eb-87a9-c3b82282ff67.png)

</br>

- **상담 예약 리스트 조회**   
  - 세션에 저장된 이메일을 통해 접속한 사람과 연관된 상담 예약 현황을 예약 테이블 DB에서 조회하여 출력해줍니다.  
>![image](https://user-images.githubusercontent.com/70616657/117239187-422d5b80-ae69-11eb-8462-4bfcb2d0d265.png)


</div>
</details>

</br>

<details>
<summary><b>지도, 센터 찾기 기능 펼치기</b></summary>
<div markdown="1">

### 5.4. 지도, 센터 찾기 기능
__5.4.1. 지도 기능__  
- **마커 표시** 
  - 카카오톡 지도 API를 활용하여 지도와 관련된 서비스 구현했습니다.
>![image](https://user-images.githubusercontent.com/70616657/117239520-e2838000-ae69-11eb-98b5-4b1202c7d956.png)

</br>

- **센터 찾기 기능**   
  - 마우스와 접촉한 데이터 문자열을 필요한 부분만 파싱 후, Ajax를 통해 파싱된 데이터를 DB에서 센터를 찾는 검색 조건으로 활용했습니다.  
>![image](https://user-images.githubusercontent.com/70616657/117239557-fe872180-ae69-11eb-99a1-cdc1ad1aa2e6.png)
>![image](https://user-images.githubusercontent.com/70616657/117239565-00e97b80-ae6a-11eb-92fe-ba2bca3e1c2e.png)


</div>
</details>

</br>

<details>
<summary><b>로그인 기능 펼치기</b></summary>
<div markdown="1">

### 5.5. 로그인 기능
- **로그인 기능** 
  - JSP form으로 부터 받은 회원 정보와 DB 내의 회원 정보 일치여부 확인하여 로그인 기능을 구현했습니다.
>![image](https://user-images.githubusercontent.com/70616657/117239719-41e19000-ae6a-11eb-9149-7fde4fb11e48.png)


</div>
</details>

</br>

</div>
</details>

</br>

## 6. 회고 / 느낀점 / 성과물

-__성과__  
'최종 프로젝트 발표회'에서 2등을 수상하였습니다.

-__서비스 개발에 대한 흥미__  
블루밍 프로젝트는 처음으로 아이디어 기획 부터 서비스 개발까지 모두 참여한 프로젝트입니다.
평소 아이디어가 많아서 떠오른 아이디어를 구현해보고 싶다는 생각을 많이 했습니다.
실제로 블루밍 프로젝트를 수행하면서, 만들고 싶은 아이디어를 직접 구현하며 개발에 대한 흥미와 보람을 느낄 수 있었습니다.

-__IT 서비스 개발의 전반적인 흐름 파악__  
블루밍 프로젝트를 진행하면서 팀장 역할을 맡았습니다.
그렇기에 프로젝트의 전체적인 부분을 기획하는 일이 많았습니다.
기획과 개발을 함께 하다 보니, IT 서비스 개발에 대한 전체적인 흐름을 접해볼 수 있는 좋은 기회가 되었다고 생각합니다.
특히, 개발 초기 부분의 ER다이어그램과 DB 테이블을 구성하는 것이 개발의 전체적인 구조를 좌우하기 때문에 DB 설계의 중요성에 대해 알게 되었습니다.

-__메모&트러블슈팅의 중요성__  
프로젝트 이후, 포트폴리오를 만들면서 메모의 중요성에 대해 깨달았습니다.
프로젝트를 진행하면서는 개발에 급급하여, 따로 프로젝트와 관련된 내용을 깊이 있게 정리하지 못했습니다.
프로젝트의 메모는 차후에 일어날 프로젝트의 유지, 보수성에도 중요하며, 함께 업무를 진행할 다른 사람들을 위해서도 필요하다고 생각했습니다.
개발하면서 접한 오류 해결과정, 트러블 슈팅 등은 차후에도 똑같이 발생할 수 있기 때문에 메모를 통해 좋은 참고 지식으로 쌓아둘 필요가 있겠다고 생각했습니다.

-__아이디어 회의에 대한 고찰__  
처음 아이디어 회의에서 다양한 아이디어가 있다보니, 아이디어를 설정하는데 있어서 많은 어려움이 있었습니다.
이러한 갈등 속에서 주된 갈등 원인을 파악해보니, 주관적일 수도 있는 내용을 객관적으로 말하다보니 생기는 오류가 많았습니다.
따라서, 회의를 이끄는 입장에서 '아이디어의 다양성'과 '주장의 객관성'에 초점을 두어야겠다고 생각했습니다.

