----------- SYSTEM 계정 -------------------

CREATE USER CODEBAKERY IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE, DBA TO CODEBAKERY; 
COMMIT;



/*
- NAME : CODEBAKERY
- 사용자 이름 : CODEBAKERY
- 비밀번호 : 1234 (비밀번호 저장해주기)
*/

------------------------------------------

SELECT * FROM QUIZ;


------------ CODEBAKERY 테이블/시퀀스 생성 --------------

DROP TABLE MENTOR_REVIEW CASCADE CONSTRAINTS;
DROP TABLE MENTOR_INTRO CASCADE CONSTRAINTS;
DROP TABLE ANSWER CASCADE CONSTRAINTS;
DROP TABLE QNA_COMMENT CASCADE CONSTRAINTS;
DROP TABLE QUESTION CASCADE CONSTRAINTS;
DROP TABLE QUIZ_RESULT CASCADE CONSTRAINTS;
DROP TABLE TRY_QUIZ CASCADE CONSTRAINTS;
DROP TABLE QUIZ CASCADE CONSTRAINTS;
DROP TABLE NOTICE_COMMENT CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE USER_TB CASCADE CONSTRAINTS;
DROP TABLE NON_USER CASCADE CONSTRAINTS;
DROP TABLE POINT_TB CASCADE CONSTRAINTS;

DROP SEQUENCE MENTORSEQ;
DROP SEQUENCE REVIEWSEQ;
DROP SEQUENCE QUESTIONSEQ;
DROP SEQUENCE ANSWERSEQ;
DROP SEQUENCE QCOMMENTSEQ;
DROP SEQUENCE QCOMMENTGROUPSEQ;
DROP SEQUENCE QUIZSEQ;
DROP SEQUENCE NOTICESEQ;
DROP SEQUENCE NCOMMENTSEQ;  
DROP SEQUENCE POINTSEQ;
DROP SEQUENCE POINTSUBSEQ;


CREATE SEQUENCE MENTORSEQ NOCACHE;        -- 멘토게시판
CREATE SEQUENCE REVIEWSEQ NOCACHE;        -- 멘토게시판 리뷰
CREATE SEQUENCE QUESTIONSEQ NOCACHE;      -- 질문글
CREATE SEQUENCE ANSWERSEQ NOCACHE;        -- 답변글
CREATE SEQUENCE QCOMMENTSEQ NOCACHE;      -- 질문글 댓글
CREATE SEQUENCE QCOMMENTGROUPSEQ NOCACHE; -- QnA 게시판 대댓글
CREATE SEQUENCE QUIZSEQ NOCACHE;          -- 문제게시판
CREATE SEQUENCE NOTICESEQ NOCACHE;        -- 공지사항
CREATE SEQUENCE NCOMMENTSEQ NOCACHE;      -- 공지사항 댓글
CREATE SEQUENCE POINTSEQ NOCACHE;         -- 포인트 사용내역
CREATE SEQUENCE POINTSUBSEQ NOCACHE;      -- 포인트 사용내역 출력 시퀀스

-- 유저테이블 
CREATE TABLE USER_TB (
	USER_ID	VARCHAR2(50) CONSTRAINT PK_USER_ID PRIMARY KEY,     -- 유저아이디
	USER_PW	VARCHAR2(50) NOT NULL,                              -- 유저비밀번호
    USER_GRADE VARCHAR2(20) DEFAULT '일반회원' NOT NULL,           -- 유저등급
	USER_NAME VARCHAR2(20) NOT NULL,                            -- 유저이름
	USER_PHONE VARCHAR2(100) NOT NULL,                          -- 유저폰번호
	USER_MAIL VARCHAR2(100) NOT NULL,                           -- 유저메일
	USER_POINT NUMBER DEFAULT 0,                                -- 유저 이메일
	USER_PIC VARCHAR2(100),                                     -- 유저사진
	USER_LANG VARCHAR2(200) NOT NULL,                           -- 유저선호언어
    CONSTRAINT CHK_USER_GRADE CHECK (USER_GRADE IN('일반회원','멘토','관리자'))
);



-- 멘토게시판
CREATE TABLE MENTOR_INTRO (
	MENTOR_NO NUMBER CONSTRAINT PK_MENTOR_INTRO PRIMARY KEY,    -- 멘토번호
	MENTOR_CAREER VARCHAR2(1000) NOT NULL,                      -- 멘토경력         
	MENTOR_CONTENT VARCHAR2(2000) NOT NULL,                     -- 멘토소개
	USER_ID	VARCHAR2(50),
    CONSTRAINT FK_MENTOR_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);


-- 멘토게시판 리뷰
CREATE TABLE MENTOR_REVIEW (
	REVIEW_NO NUMBER CONSTRAINT PK_REVIEW_NO PRIMARY KEY,       -- 리뷰번호 
	REVIEW_CONTENT VARCHAR2(2000) NOT NULL,                     -- 리뷰내용
	REVIEW_DATE	DATE NOT NULL,                                  -- 리뷰시간
	USER_ID	VARCHAR2(50) NOT NULL,            
	MENTOR_NO NUMBER NOT NULL,
    CONSTRAINT FK_REVIEW_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_MENTOR_NO FOREIGN KEY(MENTOR_NO) REFERENCES MENTOR_INTRO(MENTOR_NO) ON DELETE CASCADE
);

-- 질문글
CREATE TABLE QUESTION (
	QUESTION_NO	NUMBER CONSTRAINT PK_QUESTION_NO PRIMARY KEY,   -- 질문번호
	QUESTION_TITLE VARCHAR2(500) NOT NULL,                      -- 질문제목
	QUESTION_CONTENT VARCHAR2(2000)	NOT NULL,                   -- 질문내용
	QUESTION_DATE DATE NOT NULL,                                -- 질문시간
	QUESTION_VIEWS NUMBER NOT NULL,                             -- 질문글 조회수
    QUESTION_TAG VARCHAR2(100),                                 -- 질문글 해시태그
	USER_ID	VARCHAR2(50) NOT NULL,
    CONSTRAINT FK_QUESTION_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- 답변글
CREATE TABLE ANSWER (
	ANSWER_NO NUMBER CONSTRAINT PK_ANSWER_NO PRIMARY KEY,       -- 답변번호
	ANSWER_TITLE VARCHAR2(500) NOT NULL,                        -- 답변제목
	ANSWER_CONTENT VARCHAR2(2000) NOT NULL,                     -- 답변내용
	ANSWER_DATE	DATE NOT NULL,                                  -- 답변시간
	QUESTION_NO	NUMBER NOT NULL,                                
	USER_ID	VARCHAR2(50) NOT NULL,
    CONSTRAINT FK_ANSWER_QUESTION_NO FOREIGN KEY(QUESTION_NO) REFERENCES QUESTION(QUESTION_NO) ON DELETE CASCADE
);


-- 질문/답변 댓글
CREATE TABLE QNA_COMMENT (
	QCOMMENT_NO	NUMBER CONSTRAINT PK_QCOMMNET_NO PRIMARY KEY,       -- 질문댓글번호
	QUESTION_NO	NUMBER,                                        		-- 질문번호
    QCOMMENT_CONTENT VARCHAR2(1000)	NOT NULL,                       -- 질문댓글내용
    QCOMMENT_DATE DATE DEFAULT SYSDATE,                             -- 질문댓글시간
    GROUP_ID NUMBER,												-- 그룹아이디
    PARENT_NO NUMBER,												-- 대댓글 부모번호
    DEPTH NUMBER,													-- 깊이
    USER_ID	VARCHAR2(50),											-- 댓글아이디
	USER_PIC VARCHAR2(100)											-- 댓글 사진
);


-- 문제게시판
CREATE TABLE QUIZ (
	QUIZ_NO	NUMBER CONSTRAINT PK_QUIZ_NO PRIMARY KEY,          -- 문제번호
	QUIZ_TITLE VARCHAR2(50) NOT NULL,                          -- 문제제목
	QUIZ_CONTENT VARCHAR2(4000)	NOT NULL,                      -- 문제설명
	QUIZ_DATE DATE NOT NULL,                                   -- 문제등록시간
	CORRECT_USER NUMBER,                                       -- 맞춘사람
	TRY_USER NUMBER,                                           -- 시도한사람
	CORRECT_RATE NUMBER,                                       -- 정답률
	QUIZ_VIEWS NUMBER,                                         -- 문제조회수
	INPUT_EXPLANATION VARCHAR2(4000),						   -- 입력 설명
	OUTPUT_EXPLANATION VARCHAR2(4000),						   -- 출력 설명
	INPUT_SAMPLE VARCHAR2(4000),							    
	OUTPUT_SAMPLE VARCHAR2(4000),							  
	USER_ID	VARCHAR2(50) NOT NULL,          
    CONSTRAINT FK_QUIZ_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- 채점결과

CREATE TABLE QUIZ_RESULT (
	USER_ID VARCHAR2(50),
	QUIZ_NO	NUMBER,        -- 문제번호
	CODE_CONTENT VARCHAR2(4000)	NOT NULL,                       -- 작성코드내용
	EX_RESULT VARCHAR2(300)	NOT NULL,                           -- 출력예시
    PRINT_RESULT VARCHAR2(300) NOT NULL,                        -- 출력결과
	QUIZ_RESULT	VARCHAR2(20),                                   -- 채점결과
    CONSTRAINT Quiz_Result_KEY PRIMARY KEY (USER_ID, QUIZ_NO),
	CONSTRAINT FK_QRESULT_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);


-- 공지사항
CREATE TABLE NOTICE (
	NOTICE_NO NUMBER CONSTRAINT PK_NOTICE_NO PRIMARY KEY,       -- 공지사항번호
	NOTICE_TITLE VARCHAR2(50) NOT NULL,                         -- 공지사항제목
	NOTICE_CONTENT VARCHAR2(2000) NOT NULL,                     -- 공지사항내용
	NOTICE_DATE	DATE NOT NULL,                                  -- 공지사항시간
	NOTICE_VIEWS NUMBER	NOT NULL,                               -- 공지사항조회수
	USER_ID	VARCHAR2(50) NOT NULL
);

-- 공지사항 댓글
CREATE TABLE NOTICE_COMMENT (
	NCOMMNET_NO	NUMBER CONSTRAINT PK_NCOMMENT_NO PRIMARY KEY,       -- 공지사항 댓글번호
	NOTICE_NO NUMBER NOT NULL,                                      -- 공지사항 번호
	NCOMMENT_CONTENT VARCHAR2(300) NOT NULL,                        -- 공지사항 댓글내용
	NCOMMENT_DATE DATE NOT NULL,                                    -- 공지사항 댓글시간
	USER_ID	VARCHAR2(50) NOT NULL,                  
    CONSTRAINT FK_NCOMMENT_NOTICE_NO FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,
    CONSTRAINT FK_NCOMMENT_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- 포인트 사용내역
CREATE TABLE POINT_TB(
   POINT_NO NUMBER CONSTRAINT PK_POINT_NO PRIMARY KEY,       -- 사용내역번호 
   POINT_DATE DATE,                                          -- 날짜
   POINT_CHARGE VARCHAR2(50) DEFAULT 0,                      -- 충전금액
   POINT_USE VARCHAR2(50) DEFAULT 0,                         -- 사용금액
   POINT_HISTORY VARCHAR2(100),                              -- 사용내역
   USER_ID   VARCHAR2(20),                                   -- 유저아이디 외래키
    CONSTRAINT FK_POINT_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);
--------------------------------------------------------------------

--------------------------- DATA INSERT ----------------------------

-- USER_TB

SELECT * FROM USER_TB;


SELECT * FROM MENTOR_INTRO;
-- MENTOR_INTRO
INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'삼성 1위 입사자','모든것을 한번에 해결해드립니다.','mentor1');
INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'구글 1년 경력','간지네가 코딩.','mentor2');
INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'애플에서 냄새맡음','생활코딩 지리게','mentor3');
INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'화웨이출신','코딩왕 정코딩.','mentor4');

UPDATE MENTOR_INTRO SET MENTOR_CONTENT ='모든것을 한번에 우라랄라라라랄ㄹ우라라라라우라라' WHERE MENTOR_NO=1;
-- MENTOR_REVIEW


-- QUESTION
INSERT INTO QUESTION 
VALUES(QUESTIONSEQ.NEXTVAL, '오라클 서버가 자꾸 오류납니다..', '이렇게 했는데 자꾸 에러가 뜨네요 어떻게 고칠까요?', SYSDATE, 0, '#오라클, #서버오류', 'user3');
INSERT INTO QUESTION 
VALUES(QUESTIONSEQ.NEXTVAL, '경로를 못찾아요..', '경로를 잘 잡아준거 같은데 계속 404만 뜨네요 도와주세요..', SYSDATE, 0, '#java, #경로에러', 'user4');
INSERT INTO QUESTION 
VALUES(QUESTIONSEQ.NEXTVAL, '경로를 못찾아요..', '경로를 잘 잡아준거 같은데 계속 404만 뜨네요 도와주세요..', SYSDATE, 0, '#java, #경로에러', 'user5');

-- ANSWER
INSERT INTO ANSWER VALUES(ANSWERSEQ.NEXTVAL, '질문답변 답변 제목01', '질문답변 답변 제목01', SYSDATE, 1, 'user5');
INSERT INTO ANSWER VALUES(ANSWERSEQ.NEXTVAL, '질문답변 답변 제목02', '질문답변 답변 제목02', SYSDATE, 2, 'user6');

-- QNA_COMMENT
INSERT INTO QNA_COMMENT
VALUES(QCOMMENTSEQ.NEXTVAL, 1, '질문답변 댓글 내용01', SYSDATE, 0, 0, 0,'user1', NULL);
INSERT INTO QNA_COMMENT
VALUES(QCOMMENTSEQ.NEXTVAL, 2, '질문답변 댓글 내용02', SYSDATE, 0, 0, 0,'user2', NULL);

-- QUIZ
INSERT INTO QUIZ
VALUES(QUIZSEQ.NEXTVAL, '퀴즈 제목01', '퀴즈 내용01', SYSDATE, 0, 0, 0, 0,'인풋 설명01', '인풋 설명01', '인풋 샘플01', '아웃풋 샘플01','user3');
INSERT INTO QUIZ
VALUES(QUIZSEQ.NEXTVAL, '퀴즈 제목02', '퀴즈 내용02', SYSDATE, 0, 0, 0, 0,'인풋 설명02', '인풋 설명02' , '인풋 샘플02', '아웃풋 샘플02', 'user4');		

-- QUIZ_RESULT
INSERT INTO QUIZ_RESULT VALUES(1, '퀴즈 결과01', 'user6');
INSERT INTO QUIZ_RESULT VALUES(3, '퀴즈 결과02', 'user1');


-- NOTICE
INSERT INTO NOTICE
VALUES(NOTICESEQ.NEXTVAL, '공지사항 제목01', '공지사항 내용01', SYSDATE, 0, 'ADMIN');
INSERT INTO NOTICE
VALUES(NOTICESEQ.NEXTVAL, '공지사항 제목02', '공지사항 내용02', SYSDATE, 0, 'ADMIN');

-- NOTICE_COMMENT
INSERT INTO NOTICE_COMMENT VALUES(NCOMMENTSEQ.NEXTVAL, 1, '공지댓글내용01', SYSDATE, 'user2');
INSERT INTO NOTICE_COMMENT VALUES(NCOMMENTSEQ.NEXTVAL, 2, '공지댓글내용02', SYSDATE, 'user3');

-- POINT_TB
INSERT INTO POINT_TB VALUES(POINTSEQ.NEXTVAL,SYSDATE,'','200','떙떙맨토 채팅 1분20초','user1');
INSERT INTO POINT_TB VALUES(POINTSEQ.NEXTVAL, SYSDATE,'300','','충전','user1');

COMMIT;
INSERT INTO USER_TB VALUES(
'ADMIN','1234','관리자','어드민','010-2323-2323','kj@kh.or.kr',DEFAULT,'JJ','1'
);
SELECT * FROM USER_TB;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT COUNT(*) FROM QNA_COMMENT;
SELECT * FROM
		MENTOR_REVIEW
		WHERE MENTOR_NO = 3;

SELECT * FROM
		MENTOR_REVIEW;

select * from user_tb;
UPDATE USER_TB SET USER_GRADE = '관리자' WHERE USER_ID ='ADMIN';
select * from mentor_intro;
 SELECT * FROM ( SELECT * FROM QUESTION ORDER BY QUESTION_NO DESC ) WHERE ROWNUM <=5 ; 
SELECT * FROM ( SELECT * FROM ANSWER ORDER BY ANSWER_NO DESC ) WHERE ROWNUM <=5 ; 
SELECT * FROM QUESTION;
SELECT * FROM NOTICE_COMMENT;
commit;

SELECT * FROM POINT_TB;
select user_point from user_tb where user_id='user1';

SELECT P.POINT_NO, P.POINT_DATE, P.POINT_CHARGE, P.POINT_USE, P.POINT_HISTORY ,U.USER_ID
FROM POINT_TB P JOIN USER_TB U ON P.USER_ID=U.USER_ID
WHERE USER_ID = 'jusu2529'
ORDER BY POINT_NO;

SELEC
SELECT * FROM MENTOR_INTRO;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------



