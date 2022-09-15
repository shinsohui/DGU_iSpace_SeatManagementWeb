# 소프트웨어공학개론 SEED 
## 동국대학교 iSPACE 좌석 관리 웹사이트

### 프로젝트 목적
동국대학교 원흥관 내 I.SPACE의 학부생 자율 이용이 가능해졌다. 이에 따라 시험 기간에 학생들의 출입 및 이용이 잦아질 것으로 예상한다. 
<br>
같은 층에 있는 “아리수”는 무인 매점이 있는 자율 이용 북카페이다. 
<br>
아리수는 좌석 관리 시스템이 없어 가방을 놓고 자리를 비우거나 소수 인원이 많은 자리를 차지하는 등 좌석 이용 효율이 떨어지는 문제가 있다. 
<br>
아직 활성화되지 않은 I.SPACE 또한 시간이 지남에 따라 아리수와 같은 양상을 보일 수 있을 것으로 예상된다. 
<br>
이를 방지하고 학생들의 원활한 I.SPACE 이용을 위해 좌석 관리 시스템을 개발하고자 한다.
<br>
<br>
<b>개발하고자 하는 것은 좌석 관리 시스템이다.</b>
<br>
좌석 관리를 위해서 입실, 퇴실 처리, 부재 처리, 좌석 현황 알림 등의 기능을 제공한다. 
<br>
I.SPACE는 “동국대학교의 학생들”만 이용할 수 있다. 
로그인, 회원가입 기능을 제공하여 동국대학교 학생임을 인증한 사용자만이 좌석 시스템에 접근할 수 있도록 한다.<br>
I.SPACE는 중앙도서관의 좌석 관리 시스템과 다르게 입/퇴실을 체크하는 출입구가 없으므로, 시스템의 목적이 달성되기 어려울 수 있다. 
<br>
따라서 입실 처리된 빈자리에 대한 신고 기능을 제공한다.  
<br>
쾌적한 공부 환경을 만들기 위해 건의 게시판 기능을 제공한다. 
<br>
커뮤니티 게시판 기능을 제공하여 공모전 팀원 모집, 스터디원 모집, 취업 정보 공유를 돕는다. 
<br>
학교 행사가 이뤄지는 시간을 공지하여 학생들의 이용 편의를 돕는다.
<br>

[시스템 설계 UML](https://github.com/shinsohui/DGU_iSpace_SeatManagementWeb/tree/master/UML)
<br>

### 시스템 동작
<b>1. 당일, 입실되어 있는 좌석이 없어 입실하는 경우 
<img width="1440" alt="1" src="https://user-images.githubusercontent.com/48276633/70257236-41544e00-17cd-11ea-8e59-ede7b224ee54.png">
2. 입실되어 있는 좌석을 비울 경우(1안:퇴실, 2안:부재)
<img width="1440" alt="2" src="https://user-images.githubusercontent.com/48276633/70257237-41544e00-17cd-11ea-8a77-d010994a3619.png">
3. 부재를 눌러 9번 좌석이 초록색으로 바뀌는 경우
<img width="1440" alt="3" src="https://user-images.githubusercontent.com/48276633/70257238-41544e00-17cd-11ea-838a-8d2cc25c23af.png">
4. 타인의 좌석(7번)을 눌러 신고하는 경우
<img width="1440" alt="4" src="https://user-images.githubusercontent.com/48276633/70257239-41544e00-17cd-11ea-8942-d8610d6b0644.png">
5. 부재한 뒤 30분 이내에 다시 돌아와서 재입실 하는 경우
<img width="1440" alt="5" src="https://user-images.githubusercontent.com/48276633/70257240-41ece480-17cd-11ea-9130-f56cd847a1fa.png">
6. 분실물 게시판에서 사진 파일이 업로드 되어 있는 경우
<img width="1440" alt="6" src="https://user-images.githubusercontent.com/48276633/70257241-41ece480-17cd-11ea-8d61-1050b2632504.png">
7. 분실물 게시판의 해당 글의 수정한 경우 </b>
<img width="1440" alt="7" src="https://user-images.githubusercontent.com/48276633/70257242-41ece480-17cd-11ea-9a5e-18761cd98f54.png">
