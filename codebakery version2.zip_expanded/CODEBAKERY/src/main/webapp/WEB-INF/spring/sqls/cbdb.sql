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




------------ CODEBAKERY 테이블/시퀀스 생성 --------------

DROP TABLE MENTOR_REVIEW;
DROP TABLE MENTOR_INTRO;
DROP TABLE ANSWER;
DROP TABLE QNA_COMMENT;
DROP TABLE QUESTION;
DROP TABLE QUIZ_RESULT;
DROP TABLE TRY_QUIZ;
DROP TABLE QUIZ;
DROP TABLE NOTICE_COMMENT;
DROP TABLE NOTICE;
DROP TABLE USER_TB;
DROP TABLE NON_USER;

DROP SEQUENCE MENTORSEQ;
DROP SEQUENCE REIVEWSEQ;
DROP SEQUENCE QUESTIONSEQ;
DROP SEQUENCE ANSWERSEQ;
DROP SEQUENCE QCOMMENTSEQ;
DROP SEQUENCE QCOMMENTGROUPSEQ;
DROP SEQUENCE QUIZSEQ;
DROP SEQUENCE NOTICESEQ;
DROP SEQUENCE NCOMMENTSEQ;  


CREATE SEQUENCE MENTORSEQ NOCACHE;        -- 멘토게시판
CREATE SEQUENCE REIVEWSEQ NOCACHE;        -- 멘토게시판 리뷰
CREATE SEQUENCE QUESTIONSEQ NOCACHE;      -- 질문글
CREATE SEQUENCE ANSWERSEQ NOCACHE;        -- 답변글
CREATE SEQUENCE QCOMMENTSEQ NOCACHE;      -- 질문글 댓글
CREATE SEQUENCE QCOMMENTGROUPSEQ NOCACHE; -- QnA 게시판 대댓글
CREATE SEQUENCE QUIZSEQ NOCACHE;          -- 문제게시판
CREATE SEQUENCE NOTICESEQ NOCACHE;        -- 공지사항
CREATE SEQUENCE NCOMMENTSEQ NOCACHE;      -- 공지사항 댓글

SELECT * FROM USER_TB;

-- 유저테이블 
CREATE TABLE USER_TB (
	USER_ID	VARCHAR2(20) CONSTRAINT PK_USER_ID PRIMARY KEY,     -- 유저아이디
	USER_PW	VARCHAR2(50) NOT NULL,                              -- 유저비밀번호
    USER_GRADE VARCHAR2(20) DEFAULT '일반회원' NOT NULL,                           -- 유저등급
	USER_NAME VARCHAR2(20) NOT NULL,                            -- 유저이름
	USER_PHONE VARCHAR2(100) NOT NULL,                          -- 유저폰번호
	USER_MAIL VARCHAR2(100) NOT NULL,                           -- 유저메일
	USER_POINT NUMBER,                                          -- 유저 이메일
	USER_PIC VARCHAR2(1000),                                     -- 유저사진
	USER_LANG VARCHAR2(200) NOT NULL,                           -- 유저선호언어
    CONSTRAINT CHK_USER_GRADE CHECK (USER_GRADE IN('일반회원','멘토','관리자'))
);

-- 비회원테이블
CREATE TABLE NON_USER (
	NUSER_ID VARCHAR2(20) CONSTRAINT PK_NUSER_ID PRIMARY KEY,   -- 비회원 아이디   
	NUSER_PW VARCHAR2(50) NOT NULL,                             -- 비회원 비밀번호
	NUSER_CONTENT VARCHAR2(1000) NOT NULL                       -- 비회원 댓글내용
);

-- 멘토게시판
CREATE TABLE MENTOR_INTRO (
	MENTOR_NO NUMBER CONSTRAINT PK_MENTOR_INTRO PRIMARY KEY,    -- 멘토번호
	MENTOR_CAREER VARCHAR2(1000) NOT NULL,                      -- 멘토경력         
	MENTOR_CONTENT VARCHAR2(2000) NOT NULL,                     -- 멘토소개
	USER_ID	VARCHAR2(20),
    CONSTRAINT FK_MENTOR_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

select * from mentor_intro
join user_tb using(user_id);


-- 멘토게시판 리뷰
CREATE TABLE MENTOR_REVIEW (
	REVIEW_NO NUMBER CONSTRAINT PK_REVIEW_NO PRIMARY KEY,       -- 리뷰번호 
	REVIEW_CONTENT VARCHAR2(2000) NOT NULL,                     -- 리뷰내용
	REVIEW_DATE	DATE NOT NULL,                                  -- 리뷰시간
	USER_ID	VARCHAR2(20) NOT NULL,            
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
	USER_ID	VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_QUESTION_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- 답변글
CREATE TABLE ANSWER (
	ANSWER_NO NUMBER CONSTRAINT PK_ANSWER_NO PRIMARY KEY,       -- 답변번호
	ANSWER_TITLE VARCHAR2(500) NOT NULL,                        -- 답변제목
	ANSWER_CONTENT VARCHAR2(2000) NOT NULL,                     -- 답변내용
	ANSWER_DATE	DATE NOT NULL,                                  -- 답변시간
	QUESTION_NO	NUMBER NOT NULL,                                
	USER_ID	VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_ANSWER_QUESTION_NO FOREIGN KEY(QUESTION_NO) REFERENCES QUESTION(QUESTION_NO) ON DELETE CASCADE,
    CONSTRAINT FK_ANSWER_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);


-- 질문/답변 댓글
CREATE TABLE QNA_COMMENT (
	QCOMMENT_NO	NUMBER CONSTRAINT PK_QCOMMNET_NO PRIMARY KEY,       -- 질문댓글번호
	QUESTION_NO	NUMBER,                                             -- 질문번호  (0617 not null 제거)
	ANSWER_NO NUMBER,                                               -- 답변번호  (0617 not null 제거)
	QCOMMENT_CONTENT VARCHAR2(1000)	NOT NULL,                       -- 질문댓글내용
	QCOMMENT_DATE DATE NOT NULL,                                    -- 질문댓글시간
    GROUP_SQ VARCHAR2(20),                                          -- 대댓글번호
    REPLY_ID VARCHAR2(20),                                          -- 대댓글 아이디
	USER_ID	VARCHAR2(20),
	NUSER_ID VARCHAR2(20)
);


DROP TABLE QUIZ;
SELECT * FROM QUIZ;
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
	INPUT_SAMPLE VARCHAR2(4000),							   -- 입력 예시 
	OUTPUT_SAMPLE VARCHAR2(4000),							   -- 출력 예시
	USER_ID	VARCHAR2(20) NOT NULL,          
    CONSTRAINT FK_QUIZ_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- 문제풀기
CREATE TABLE TRY_QUIZ (
	QUIZ_NO	NUMBER CONSTRAINT PK_TQUIZ_NO PRIMARY KEY,          -- 문제번호
	CODE_CONTENT VARCHAR2(4000)	NOT NULL,                       -- 작성코드내용
	EX_RESULT VARCHAR2(300)	NOT NULL,                           -- 출력예시
    PRINT_REULT VARCHAR2(300) NOT NULL,                         -- 출력결과
	USER_ID	VARCHAR2(20) NOT NULL,                             
    CONSTRAINT FK_TQUIZ_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- 채점결과
CREATE TABLE QUIZ_RESULT (
	QUIZ_NO	NUMBER CONSTRAINT PK_QRESULT_NO PRIMARY KEY,        -- 문제번호
	QUIZ_RESULT	VARCHAR2(20) NOT NULL,                          -- 채점결과
	USER_ID	VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_QRESULT_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- 공지사항
CREATE TABLE NOTICE (
	NOTICE_NO NUMBER CONSTRAINT PK_NOTICE_NO PRIMARY KEY,       -- 공지사항번호
	NOTICE_TITLE VARCHAR2(50) NOT NULL,                         -- 공지사항제목
	NOTICE_CONTENT VARCHAR2(2000) NOT NULL,                     -- 공지사항내용
	NOTICE_DATE	DATE NOT NULL,                                  -- 공지사항시간
	NOTICE_VIEWS NUMBER	NOT NULL,                               -- 공지사항조회수
	USER_ID	VARCHAR2(20) NOT NULL
);

-- 공지사항 댓글
CREATE TABLE NOTICE_COMMENT (
	NCOMMNET_NO	NUMBER CONSTRAINT PK_NCOMMENT_NO PRIMARY KEY,       -- 공지사항 댓글번호
	NOTICE_NO NUMBER NOT NULL,                                      -- 공지사항 번호
	NCOMMENT_CONTENT VARCHAR2(300) NOT NULL,                        -- 공지사항 댓글내용
	NCOMMENT_DATE DATE NOT NULL,                                    -- 공지사항 댓글시간
	USER_ID	VARCHAR2(20) NOT NULL,                  
    CONSTRAINT FK_NCOMMENT_NOTICE_NO FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,
    CONSTRAINT FK_NCOMMENT_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

--------------------------------------------------------------------

--------------------------- DATA INSERT ----------------------------

INSERT INTO USER_TB VALUES('user1','1234','일반회원','김건영','010-2342-1234','kky@kh.or.kr','userpic','java');
INSERT INTO USER_TB VALUES('user2','1234','일반회원','박주혁','010-6787-1234','pjyy@kh.or.kr','userpic','java');
INSERT INTO USER_TB VALUES('user3','1234','일반회원','권민석','010-7942-1234','kms@kh.or.kr','userpic','java');
INSERT INTO USER_TB VALUES('user4','1234','일반회원','정승연','010-3782-1234','jsy@kh.or.kr','userpic','java');
INSERT INTO USER_TB VALUES('user5','1234','일반회원','주수현','010-1782-1234','jsh@kh.or.kr','userpic','java');
INSERT INTO USER_TB VALUES('user6','1234','일반회원','이재익','010-94562-1234','ljl@kh.or.kr','userpic','java');




SELECT * FROM QUIZ;

INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'삼성 1위 입사자','모든것을 한번에 해결해드립니다.','user1');
INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'구글 1년 경력','모든것을 한번에 해결해드립니다.','user2');
INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'애플에서 냄새맡음','모든것을 한번에 해결해드립니다.','user3');
INSERT INTO MENTOR_INTRO VALUES(MENTORSEQ.NEXTVAL,'화웨이출신','모든것을 한번에 해결해드립니다.','user4');



SELECT * FROM MENTOR_INTRO
		JOIN USER_TB USING(USER_ID);
		
		SELECT * FROM MENTOR_REVIEW
		ORDER BY REVIEW_NO DESC;

	SELECT * FROM MENTOR_REVIEW
		ORDER BY REVIEW_NO DESC
		
	INSERT INTO MENTOR_REVIEW VALUES(
	REIVEWSEQ.NEXTVAL,'별로에요',SYSDATE,'admin',6
	);
		
		
		CREATE TABLE MENTOR_REVIEW (
	REVIEW_NO NUMBER CONSTRAINT PK_REVIEW_NO PRIMARY KEY,       -- 리뷰번호 
	REVIEW_CONTENT VARCHAR2(2000) NOT NULL,                     -- 리뷰내용
	REVIEW_DATE	DATE NOT NULL,                                  -- 리뷰시간
	USER_ID	VARCHAR2(20) NOT NULL,            
	MENTOR_NO NUMBER NOT NULL,
    CONSTRAINT FK_REVIEW_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_MENTOR_NO FOREIGN KEY(MENTOR_NO) REFERENCES MENTOR_INTRO(MENTOR_NO) ON DELETE CASCADE
);
		
		
SELECT * FROM NOTICE;

SELECT * FROM USER_TB;
COMMIT;

