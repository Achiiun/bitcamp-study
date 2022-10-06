-- 예약
DROP TABLE IF EXISTS Reservation RESTRICT;

-- 복식 경기
DROP TABLE IF EXISTS D_Match RESTRICT;

-- 단식 경기
DROP TABLE IF EXISTS S_Match RESTRICT;

-- 테니스장
DROP TABLE IF EXISTS Court RESTRICT;

-- 회원
DROP TABLE IF EXISTS Member RESTRICT;

-- 지역
DROP TABLE IF EXISTS Local RESTRICT;

-- 동호회
DROP TABLE IF EXISTS Club RESTRICT;

-- 대회
DROP TABLE IF EXISTS Conpetition RESTRICT;

-- 회원 레벨
DROP TABLE IF EXISTS TABLE9 RESTRICT;

-- 경기 리뷰
DROP TABLE IF EXISTS Review RESTRICT;

-- 레슨
DROP TABLE IF EXISTS Lesson RESTRICT;

-- 전적
DROP TABLE IF EXISTS Record RESTRICT;

-- 사업
DROP TABLE IF EXISTS Business RESTRICT;

-- 게시글
DROP TABLE IF EXISTS Board RESTRICT;

-- 댓글
DROP TABLE IF EXISTS Comment RESTRICT;

-- 새 테이블2
DROP TABLE IF EXISTS TABLE RESTRICT;

-- 매칭
DROP TABLE IF EXISTS TABLE2 RESTRICT;

-- 회원예약
DROP TABLE IF EXISTS Member_Reservation RESTRICT;

-- 새 테이블
DROP TABLE IF EXISTS TABLE3 RESTRICT;

-- 테니스장예약
DROP TABLE IF EXISTS Court_Reservation RESTRICT;

-- 주소
DROP TABLE IF EXISTS Address RESTRICT;

-- 매칭
DROP TABLE IF EXISTS match RESTRICT;

-- 회원_동호회
DROP TABLE IF EXISTS member_club RESTRICT;

-- 신고
DROP TABLE IF EXISTS Report RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS TABLE4 RESTRICT;

-- 예약
CREATE TABLE Reservation (
  id         <데이터 타입 없음> NOT NULL, -- 예약번호
  res_start  <데이터 타입 없음> NULL,     -- 시작시간
  res_end    <데이터 타입 없음> NULL,     -- 종료시간
  status     <데이터 타입 없음> NULL,     -- 상태
  res_number <데이터 타입 없음> NULL      -- 인원수
);

-- 예약
ALTER TABLE Reservation
  ADD CONSTRAINT PK_Reservation -- 예약 기본키
    PRIMARY KEY (
      id -- 예약번호
    );

-- 복식 경기
CREATE TABLE D_Match (
  id           <데이터 타입 없음> NOT NULL, -- 경기번호
  player_one   <데이터 타입 없음> NOT NULL, -- 선수1
  player_two   <데이터 타입 없음> NOT NULL, -- 선수2
  player_three <데이터 타입 없음> NOT NULL, -- 선수3
  player_four  <데이터 타입 없음> NOT NULL  -- 선수4
);

-- 복식 경기
ALTER TABLE D_Match
  ADD CONSTRAINT PK_D_Match -- 복식 경기 기본키
    PRIMARY KEY (
      id -- 경기번호
    );

-- 단식 경기
CREATE TABLE S_Match (
  id         <데이터 타입 없음> NOT NULL, -- 경기번호
  player_one <데이터 타입 없음> NOT NULL, -- 선수1
  player_two <데이터 타입 없음> NOT NULL  -- 선수2
);

-- 단식 경기
ALTER TABLE S_Match
  ADD CONSTRAINT PK_S_Match -- 단식 경기 기본키
    PRIMARY KEY (
      id -- 경기번호
    );

-- 테니스장
CREATE TABLE Court (
  id         <데이터 타입 없음> NOT NULL, -- 코트 번호
  rental_fee <데이터 타입 없음> NOT NULL, -- 대여비
  visit      <데이터 타입 없음> NOT NULL, -- 방문횟수
  location   <데이터 타입 없음> NOT NULL, -- 실내,실외
  local_id   <데이터 타입 없음> NULL,     -- 지역번호
  address_id <데이터 타입 없음> NULL      -- 주소번호
);

-- 테니스장
ALTER TABLE Court
  ADD CONSTRAINT PK_Court -- 테니스장 기본키
    PRIMARY KEY (
      id -- 코트 번호
    );

-- 회원
CREATE TABLE Member (
  id            <데이터 타입 없음> NOT NULL, -- 회원번호
  id_img        <데이터 타입 없음> NULL,     -- 프로필 이미지
  member_id     <데이터 타입 없음> NOT NULL, -- 아이디
  password      <데이터 타입 없음> NOT NULL, -- 암호
  email         <데이터 타입 없음> NOT NULL, -- 이메일
  name          <데이터 타입 없음> NOT NULL, -- 이름
  sex           <데이터 타입 없음> NOT NULL, -- 성별
  birth         <데이터 타입 없음> NOT NULL, -- 출생년도
  nickname      <데이터 타입 없음> NOT NULL, -- 닉네임
  phone         <데이터 타입 없음> NOT NULL, -- 전화번호
  level         <데이터 타입 없음> NOT NULL, -- 레벨
  authorization <데이터 타입 없음> NOT NULL, -- 권한
  manner_point  <데이터 타입 없음> NOT NULL, -- 매너점수
  local_id      <데이터 타입 없음> NOT NULL, -- 지역번호
  record_id     <데이터 타입 없음> NULL,     -- 전적
  review_id     <데이터 타입 없음> NULL,     -- 리뷰
  address_id    <데이터 타입 없음> NULL      -- 주소번호
);

-- 회원
ALTER TABLE Member
  ADD CONSTRAINT PK_Member -- 회원 기본키
    PRIMARY KEY (
      id -- 회원번호
    );

ALTER TABLE Member
  MODIFY COLUMN id <데이터 타입 없음> NOT NULL AUTO_INCREMENT;

-- 지역
CREATE TABLE Local (
  id        <데이터 타입 없음> NOT NULL, -- 지역번호
  gyeonggi  <데이터 타입 없음> NOT NULL, -- 경기
  seoul     <데이터 타입 없음> NOT NULL, -- 서울
  gangwon   <데이터 타입 없음> NOT NULL, -- 강원
  incheon   <데이터 타입 없음> NOT NULL, -- 인천
  chungbuk  <데이터 타입 없음> NOT NULL, -- 충북
  chungnam  <데이터 타입 없음> NOT NULL, -- 충남
  gyeongnam <데이터 타입 없음> NOT NULL, -- 경남
  gyeongbuk <데이터 타입 없음> NOT NULL, -- 경북
  jeonnam   <데이터 타입 없음> NOT NULL, -- 전남
  jeonbuk   <데이터 타입 없음> NOT NULL, -- 전북
  jeju      <데이터 타입 없음> NOT NULL, -- 제주
  sejong    <데이터 타입 없음> NOT NULL  -- 세종
);

-- 지역
ALTER TABLE Local
  ADD CONSTRAINT PK_Local -- 지역 기본키
    PRIMARY KEY (
      id -- 지역번호
    );

-- 동호회
CREATE TABLE Club (
  id          <데이터 타입 없음> NOT NULL, -- 동호회번호
  name        <데이터 타입 없음> NULL,     -- 이름
  member_no   <데이터 타입 없음> NULL,     -- 인원수
  average_age <데이터 타입 없음> NULL,     -- 평균연령
  img         <데이터 타입 없음> NULL,     -- 팀 로고
  info        <데이터 타입 없음> NULL,     -- 팀 소개
  id2         <데이터 타입 없음> NULL      -- 지역번호
);

-- 동호회
ALTER TABLE Club
  ADD CONSTRAINT PK_Club -- 동호회 기본키
    PRIMARY KEY (
      id -- 동호회번호
    );

-- 동호회 유니크 인덱스
CREATE UNIQUE INDEX UIX_Club
  ON Club ( -- 동호회
    name ASC -- 이름
  );

-- 대회
CREATE TABLE Conpetition (
  COL2 <데이터 타입 없음> NOT NULL, -- 대회번호
  COL  <데이터 타입 없음> NOT NULL, -- 대회이름
  COL3 <데이터 타입 없음> NOT NULL, -- 대회지역
  COL4 <데이터 타입 없음> NULL      -- 대회 연결사이트
);

-- 회원 레벨
CREATE TABLE TABLE9 (
  COL  <데이터 타입 없음> NULL, -- 레벨번호
  COL2 <데이터 타입 없음> NULL, -- 회원번호
  COL3 <데이터 타입 없음> NULL  -- 새 컬럼
);

-- 경기 리뷰
CREATE TABLE Review (
  id      <데이터 타입 없음> NOT NULL, -- 리뷰
  content <데이터 타입 없음> NOT NULL, -- 리뷰내용
  author  <데이터 타입 없음> NULL      -- 작성자
);

-- 경기 리뷰
ALTER TABLE Review
  ADD CONSTRAINT PK_Review -- 경기 리뷰 기본키
    PRIMARY KEY (
      id -- 리뷰
    );

-- 레슨
CREATE TABLE Lesson (
  COL  <데이터 타입 없음> NULL, -- 레슨번호
  COL2 <데이터 타입 없음> NULL, -- 제목
  COL3 <데이터 타입 없음> NULL, -- 내용
  COL4 <데이터 타입 없음> NULL, -- 작성자
  COL5 <데이터 타입 없음> NULL  -- 참가자
);

-- 전적
CREATE TABLE Record (
  id       <데이터 타입 없음> NOT NULL, -- 전적
  win      <데이터 타입 없음> NULL,     -- 승리
  lose     <데이터 타입 없음> NULL,     -- 패배
  win_rate <데이터 타입 없음> NULL      -- 승률
);

-- 전적
ALTER TABLE Record
  ADD CONSTRAINT PK_Record -- 전적 기본키
    PRIMARY KEY (
      id -- 전적
    );

-- 사업
CREATE TABLE Business (
  id        <데이터 타입 없음> NOT NULL, -- 사업번호
  name      <데이터 타입 없음> NULL,     -- 사업장이름
  num_court <데이터 타입 없음> NULL,     -- 사업장 번호
  hours     <데이터 타입 없음> NULL,     -- 영업시간
  address   <데이터 타입 없음> NULL,     -- 사업장 주소
  member_id <데이터 타입 없음> NULL,     -- 회원번호
  id2       <데이터 타입 없음> NULL      -- 지역번호
);

-- 사업
ALTER TABLE Business
  ADD CONSTRAINT PK_Business -- 사업 기본키
    PRIMARY KEY (
      id -- 사업번호
    );

-- 게시글
CREATE TABLE Board (
  id            <데이터 타입 없음> NOT NULL, -- 게시글번호
  titie         <데이터 타입 없음> NOT NULL, -- 제목
  content       <데이터 타입 없음> NOT NULL, -- 내용
  views         <데이터 타입 없음> NULL,     -- 조회수
  author        <데이터 타입 없음> NULL,     -- 작성자
  created_date  <데이터 타입 없음> NULL,     -- 등록일
  modified_date <데이터 타입 없음> NULL,     -- 수정일
  like          <데이터 타입 없음> NULL,     -- 추천
  img           <데이터 타입 없음> NULL,     -- 이미지
  type          <데이터 타입 없음> NULL,     -- 게시판
  member_id     <데이터 타입 없음> NULL      -- 회원번호
);

-- 게시글
ALTER TABLE Board
  ADD CONSTRAINT PK_Board -- 게시글 기본키
    PRIMARY KEY (
      id -- 게시글번호
    );

-- 댓글
CREATE TABLE Comment (
  id            <데이터 타입 없음> NOT NULL, -- 댓글번호
  title         <데이터 타입 없음> NOT NULL, -- 제목
  content       <데이터 타입 없음> NOT NULL, -- 내용
  author        <데이터 타입 없음> NOT NULL, -- 작성자
  created_date  <데이터 타입 없음> NULL,     -- 등록일
  modified_date <데이터 타입 없음> NULL,     -- 수정일
  like          <데이터 타입 없음> NULL,     -- 추천
  board_id      <데이터 타입 없음> NULL      -- 게시글번호
);

-- 댓글
ALTER TABLE Comment
  ADD CONSTRAINT PK_Comment -- 댓글 기본키
    PRIMARY KEY (
      id -- 댓글번호
    );

-- 새 테이블2
CREATE TABLE TABLE (
);

-- 매칭
CREATE TABLE TABLE2 (
  COL  <데이터 타입 없음> NOT NULL, -- 매칭번호
  COL2 <데이터 타입 없음> NULL,     -- 경기번호
  COL3 <데이터 타입 없음> NULL,     -- 회원1
  COL4 <데이터 타입 없음> NULL      -- 회원2
);

-- 매칭
ALTER TABLE TABLE2
  ADD CONSTRAINT PK_TABLE2 -- 매칭 기본키
    PRIMARY KEY (
      COL -- 매칭번호
    );

-- 회원예약
CREATE TABLE Member_Reservation (
  res_id    <데이터 타입 없음> NOT NULL, -- 예약번호
  member_id <데이터 타입 없음> NOT NULL  -- 회원번호
);

-- 회원예약
ALTER TABLE Member_Reservation
  ADD CONSTRAINT PK_Member_Reservation -- 회원예약 기본키
    PRIMARY KEY (
      res_id,    -- 예약번호
      member_id  -- 회원번호
    );

-- 새 테이블
CREATE TABLE TABLE3 (
);

-- 테니스장예약
CREATE TABLE Court_Reservation (
  court_id <데이터 타입 없음> NOT NULL, -- 코트 번호
  res_id   <데이터 타입 없음> NOT NULL  -- 예약번호
);

-- 테니스장예약
ALTER TABLE Court_Reservation
  ADD CONSTRAINT PK_Court_Reservation -- 테니스장예약 기본키
    PRIMARY KEY (
      court_id, -- 코트 번호
      res_id    -- 예약번호
    );

-- 주소
CREATE TABLE Address (
  id        <데이터 타입 없음> NOT NULL, -- 주소번호
  address   <데이터 타입 없음> NOT NULL, -- 상세주소
  latitude  <데이터 타입 없음> NULL,     -- 위도
  longitude <데이터 타입 없음> NULL,     -- 경도
  id2       <데이터 타입 없음> NULL      -- 매치아이디
);

-- 주소
ALTER TABLE Address
  ADD CONSTRAINT PK_Address -- 주소 기본키
    PRIMARY KEY (
      id -- 주소번호
    );

-- 매칭
CREATE TABLE match (
  id         <데이터 타입 없음> NOT NULL, -- 매치아이디
  title      <데이터 타입 없음> NULL,     -- 제목
  match_date <데이터 타입 없음> NULL,     -- 매치 날짜/시간
  id2        <데이터 타입 없음> NULL,     -- 회원번호
  id3        <데이터 타입 없음> NULL,     -- 단식 경기번호
  id4        <데이터 타입 없음> NULL      -- 복식 경기번호
);

-- 매칭
ALTER TABLE match
  ADD CONSTRAINT PK_match -- 매칭 기본키
    PRIMARY KEY (
      id -- 매치아이디
    );

-- 회원_동호회
CREATE TABLE member_club (
  id  <데이터 타입 없음> NOT NULL, -- 회원번호
  id2 <데이터 타입 없음> NOT NULL  -- 동호회번호
);

-- 회원_동호회
ALTER TABLE member_club
  ADD CONSTRAINT PK_member_club -- 회원_동호회 기본키
    PRIMARY KEY (
      id,  -- 회원번호
      id2  -- 동호회번호
    );

-- 신고
CREATE TABLE Report (
  id             <데이터 타입 없음> NOT NULL, -- 신고번호
  report         <데이터 타입 없음> NULL,     -- 신고
  report_content <데이터 타입 없음> NULL,     -- 신고 내용
  id2            <데이터 타입 없음> NULL,     -- 게시글번호
  id3            <데이터 타입 없음> NULL,     -- 댓글번호
  id4            <데이터 타입 없음> NULL      -- 회원번호
);

-- 신고
ALTER TABLE Report
  ADD CONSTRAINT PK_Report -- 신고 기본키
    PRIMARY KEY (
      id -- 신고번호
    );

-- 첨부파일
CREATE TABLE TABLE4 (
  id        <데이터 타입 없음> NOT NULL, -- 파일번호
  file_name <데이터 타입 없음> NULL,     -- 파일명
  file_path <데이터 타입 없음> NULL      -- 경로명
);

-- 첨부파일
ALTER TABLE TABLE4
  ADD CONSTRAINT PK_TABLE4 -- 첨부파일 기본키
    PRIMARY KEY (
      id -- 파일번호
    );

-- 테니스장
ALTER TABLE Court
  ADD CONSTRAINT FK_Local_TO_Court -- 지역 -> 테니스장
    FOREIGN KEY (
      local_id -- 지역번호
    )
    REFERENCES Local ( -- 지역
      id -- 지역번호
    );

-- 테니스장
ALTER TABLE Court
  ADD CONSTRAINT FK_Address_TO_Court -- 주소 -> 테니스장
    FOREIGN KEY (
      address_id -- 주소번호
    )
    REFERENCES Address ( -- 주소
      id -- 주소번호
    );

-- 회원
ALTER TABLE Member
  ADD CONSTRAINT FK_Local_TO_Member -- 지역 -> 회원
    FOREIGN KEY (
      local_id -- 지역번호
    )
    REFERENCES Local ( -- 지역
      id -- 지역번호
    );

-- 회원
ALTER TABLE Member
  ADD CONSTRAINT FK_Record_TO_Member -- 전적 -> 회원
    FOREIGN KEY (
      record_id -- 전적
    )
    REFERENCES Record ( -- 전적
      id -- 전적
    );

-- 회원
ALTER TABLE Member
  ADD CONSTRAINT FK_Review_TO_Member -- 경기 리뷰 -> 회원
    FOREIGN KEY (
      review_id -- 리뷰
    )
    REFERENCES Review ( -- 경기 리뷰
      id -- 리뷰
    );

-- 회원
ALTER TABLE Member
  ADD CONSTRAINT FK_Address_TO_Member -- 주소 -> 회원
    FOREIGN KEY (
      address_id -- 주소번호
    )
    REFERENCES Address ( -- 주소
      id -- 주소번호
    );

-- 동호회
ALTER TABLE Club
  ADD CONSTRAINT FK_Local_TO_Club -- 지역 -> 동호회
    FOREIGN KEY (
      id2 -- 지역번호
    )
    REFERENCES Local ( -- 지역
      id -- 지역번호
    );

-- 사업
ALTER TABLE Business
  ADD CONSTRAINT FK_Member_TO_Business -- 회원 -> 사업
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES Member ( -- 회원
      id -- 회원번호
    );

-- 사업
ALTER TABLE Business
  ADD CONSTRAINT FK_Local_TO_Business -- 지역 -> 사업
    FOREIGN KEY (
      id2 -- 지역번호
    )
    REFERENCES Local ( -- 지역
      id -- 지역번호
    );

-- 게시글
ALTER TABLE Board
  ADD CONSTRAINT FK_Member_TO_Board -- 회원 -> 게시글
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES Member ( -- 회원
      id -- 회원번호
    );

-- 댓글
ALTER TABLE Comment
  ADD CONSTRAINT FK_Board_TO_Comment -- 게시글 -> 댓글
    FOREIGN KEY (
      board_id -- 게시글번호
    )
    REFERENCES Board ( -- 게시글
      id -- 게시글번호
    );

-- 회원예약
ALTER TABLE Member_Reservation
  ADD CONSTRAINT FK_Reservation_TO_Member_Reservation -- 예약 -> 회원예약
    FOREIGN KEY (
      res_id -- 예약번호
    )
    REFERENCES Reservation ( -- 예약
      id -- 예약번호
    );

-- 회원예약
ALTER TABLE Member_Reservation
  ADD CONSTRAINT FK_Member_TO_Member_Reservation -- 회원 -> 회원예약
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES Member ( -- 회원
      id -- 회원번호
    );

-- 테니스장예약
ALTER TABLE Court_Reservation
  ADD CONSTRAINT FK_Court_TO_Court_Reservation -- 테니스장 -> 테니스장예약
    FOREIGN KEY (
      court_id -- 코트 번호
    )
    REFERENCES Court ( -- 테니스장
      id -- 코트 번호
    );

-- 테니스장예약
ALTER TABLE Court_Reservation
  ADD CONSTRAINT FK_Reservation_TO_Court_Reservation -- 예약 -> 테니스장예약
    FOREIGN KEY (
      res_id -- 예약번호
    )
    REFERENCES Reservation ( -- 예약
      id -- 예약번호
    );

-- 주소
ALTER TABLE Address
  ADD CONSTRAINT FK_match_TO_Address -- 매칭 -> 주소
    FOREIGN KEY (
      id2 -- 매치아이디
    )
    REFERENCES match ( -- 매칭
      id -- 매치아이디
    );

-- 매칭
ALTER TABLE match
  ADD CONSTRAINT FK_Member_TO_match -- 회원 -> 매칭
    FOREIGN KEY (
      id2 -- 회원번호
    )
    REFERENCES Member ( -- 회원
      id -- 회원번호
    );

-- 매칭
ALTER TABLE match
  ADD CONSTRAINT FK_S_Match_TO_match -- 단식 경기 -> 매칭
    FOREIGN KEY (
      id3 -- 단식 경기번호
    )
    REFERENCES S_Match ( -- 단식 경기
      id -- 경기번호
    );

-- 매칭
ALTER TABLE match
  ADD CONSTRAINT FK_D_Match_TO_match -- 복식 경기 -> 매칭
    FOREIGN KEY (
      id4 -- 복식 경기번호
    )
    REFERENCES D_Match ( -- 복식 경기
      id -- 경기번호
    );

-- 회원_동호회
ALTER TABLE member_club
  ADD CONSTRAINT FK_Member_TO_member_club -- 회원 -> 회원_동호회
    FOREIGN KEY (
      id -- 회원번호
    )
    REFERENCES Member ( -- 회원
      id -- 회원번호
    );

-- 회원_동호회
ALTER TABLE member_club
  ADD CONSTRAINT FK_Club_TO_member_club -- 동호회 -> 회원_동호회
    FOREIGN KEY (
      id2 -- 동호회번호
    )
    REFERENCES Club ( -- 동호회
      id -- 동호회번호
    );

-- 신고
ALTER TABLE Report
  ADD CONSTRAINT FK_Board_TO_Report -- 게시글 -> 신고
    FOREIGN KEY (
      id2 -- 게시글번호
    )
    REFERENCES Board ( -- 게시글
      id -- 게시글번호
    );

-- 신고
ALTER TABLE Report
  ADD CONSTRAINT FK_Comment_TO_Report -- 댓글 -> 신고
    FOREIGN KEY (
      id3 -- 댓글번호
    )
    REFERENCES Comment ( -- 댓글
      id -- 댓글번호
    );

-- 신고
ALTER TABLE Report
  ADD CONSTRAINT FK_Member_TO_Report -- 회원 -> 신고
    FOREIGN KEY (
      id4 -- 회원번호
    )
    REFERENCES Member ( -- 회원
      id -- 회원번호
    );