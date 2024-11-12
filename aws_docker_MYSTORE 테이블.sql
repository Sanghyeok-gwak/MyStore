-----------------해당 계정 내에 존재하는 DB 객체들 삭제하는 PLSQL문------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
-----------------END------------------

CREATE TABLE "TBL_EMPLOYEE" (
	"EMP_NO"	NUMBER		NOT NULL,
	"EMP_NAME"	VARCHAR2(100)		NULL,
	"EMP_GENDER"	VARCHAR2(100)		NULL,
	"EMP_BIRTH"	VARCHAR2(100)		NULL,
	"EMP_PHONE"	VARCHAR2(100)		NULL,
	"EMP_EMAIL"	VARCHAR2(500)		NULL,
	"EMP_ADDRESS"	VARCHAR2(4000)		NULL,
	"EMP_EMPLOYMENT"	CHAR(1)	DEFAULT 'Y'	NULL,
	"EMP_DETAILADDRESS"	VARCHAR2(900)		NULL,
	"EMP_POSTCODE"	VARCHAR2(900)		NULL,
	"EMP_PASSWORD"	VARCHAR2(900)		NULL,
	"EMP_AUTH"	CHAR(1)	DEFAULT 4	NULL,
	"EMP_PROFILE"	VARCHAR2(4000)		NULL,
	"DEPT_CODE"	VARCHAR2(100)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"CREATER"	NUMBER		NULL,
	"MODIFIER"	NUMBER		NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL,
	"AC_NO"	VARCHAR2(300)		NULL,
	"AC_BANK"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "TBL_EMPLOYEE"."EMP_GENDER" IS 'M(남자)/F(여자)';

COMMENT ON COLUMN "TBL_EMPLOYEE"."EMP_EMPLOYMENT" IS 'Y(재직)/N(퇴직)';

COMMENT ON COLUMN "TBL_EMPLOYEE"."EMP_AUTH" IS '1(대표)/2(서버관리자)/3(이사)/4(사원)/,5(지점)';

COMMENT ON COLUMN "TBL_EMPLOYEE"."DEPT_CODE" IS '부서코드';

COMMENT ON COLUMN "TBL_EMPLOYEE"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_EMPLOYEE"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_EMPLOYEE"."CREATER" IS '생성자';

COMMENT ON COLUMN "TBL_EMPLOYEE"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_EMPLOYEE"."USE_YN" IS '사용유무(Y/N)';

CREATE TABLE "TBL_BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TYPE_NO"	NUMBER		NULL,
	"BOARD_DEPT"	VARCHAR2(20)		NULL,
	"BOARD_TITLE"	VARCHAR2(300)		NULL,
	"BOARD_CONTENT"	CLOB		NULL,
	"REGIST_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"COUNT"	NUMBER		NULL,
	"EMP_NO"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TBL_BOARD"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "TBL_BOARD"."BOARD_TYPE_NO" IS '1공지사항 | 2자유게시판(시퀀스)';

COMMENT ON COLUMN "TBL_BOARD"."BOARD_DEPT" IS '부서구분';

COMMENT ON COLUMN "TBL_BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "TBL_BOARD"."BOARD_CONTENT" IS '게시판 내용';

COMMENT ON COLUMN "TBL_BOARD"."REGIST_DATE" IS '작성일';

COMMENT ON COLUMN "TBL_BOARD"."COUNT" IS '조회수';

COMMENT ON COLUMN "TBL_BOARD"."EMP_NO" IS '생성자(글작성자)';

COMMENT ON COLUMN "TBL_BOARD"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_BOARD"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_BOARD"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_BOARD"."USE_YN" IS '게시글삭제(Y/N)';

CREATE TABLE "TBL_EDOC_ATTACHMENT" (
	"ATTACH_NO"	NUMBER		NOT NULL,
	"ATTACH_EDOC_REF"	NUMBER		NULL,
	"ATTACH_ORIGINAL_FILENAME"	VARCHAR2(4000)		NULL,
	"ATTACH_RENAME_FILENAME"	VARCHAR2(4000)		NULL,
	"EMP_NO"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."ATTACH_NO" IS '첨부파일번호';

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."ATTACH_EDOC_REF" IS '전자문서번호';

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."ATTACH_ORIGINAL_FILENAME" IS '수정 전 이름';

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."ATTACH_RENAME_FILENAME" IS '수정 후 이름';

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."EMP_NO" IS '생성자(사원번호)';

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."CREATE_DATE" IS '작성일';

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."MODIFIER" IS '수정자(사원번호)';

COMMENT ON COLUMN "TBL_EDOC_ATTACHMENT"."MODIFY_DATE" IS '수정일';

CREATE TABLE "TBL_DISPATCH" (
	"DISPATCH_NO"	NUMBER		NOT NULL,
	"VEHICLE_TYPE"	VARCHAR2(300)		NULL,
	"LICENSE_PLATE"	VARCHAR2(300)		NULL,
	"OPERATOR"	VARCHAR2(300)		NULL,
	"EMP_NO"	NUMBER		NULL,
	"MODIFIER"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)		NULL
);

COMMENT ON COLUMN "TBL_DISPATCH"."DISPATCH_NO" IS '배차번호';

COMMENT ON COLUMN "TBL_DISPATCH"."VEHICLE_TYPE" IS '차량종류';

COMMENT ON COLUMN "TBL_DISPATCH"."LICENSE_PLATE" IS '차량번호판번호';

COMMENT ON COLUMN "TBL_DISPATCH"."OPERATOR" IS '운행담당자';

COMMENT ON COLUMN "TBL_DISPATCH"."EMP_NO" IS '생성자';

COMMENT ON COLUMN "TBL_DISPATCH"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_DISPATCH"."CREATE_DATE" IS '생성시간';

COMMENT ON COLUMN "TBL_DISPATCH"."MODIFY_DATE" IS '수정시간';

COMMENT ON COLUMN "TBL_DISPATCH"."USE_YN" IS '사용유무';

-- 테이블 생성
CREATE TABLE "TBL_ORDERING" (
    "ORDER_NO"       NUMBER       NOT NULL,
    "EMP_NO"         NUMBER       NULL,
    "ORDER_PRODUCT"  VARCHAR2(500) NULL,
    "ORDER_STATUS"   CHAR(1)      NULL,
    "ORDER_CHECKDATE" DATE         DEFAULT SYSDATE NULL,
    "CREATE_DATE"    DATE         DEFAULT SYSDATE NULL,
    "MODIFIER"       NUMBER       NULL,
    "MODIFY_DATE"    DATE         DEFAULT SYSDATE NULL,
    "USE_YN"         CHAR(1)      NULL
);

-- 각 컬럼에 대한 주석 추가
COMMENT ON COLUMN "TBL_ORDERING"."ORDER_NO" IS '발주번호';
COMMENT ON COLUMN "TBL_ORDERING"."EMP_NO" IS '사원번호';
COMMENT ON COLUMN "TBL_ORDERING"."ORDER_PRODUCT" IS '상품명';
COMMENT ON COLUMN "TBL_ORDERING"."ORDER_STATUS" IS '발주 상태';
COMMENT ON COLUMN "TBL_ORDERING"."ORDER_CHECKDATE" IS '발주 승인일자';
COMMENT ON COLUMN "TBL_ORDERING"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "TBL_ORDERING"."MODIFIER" IS '수정자';
COMMENT ON COLUMN "TBL_ORDERING"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "TBL_ORDERING"."USE_YN" IS '사용유무';


CREATE TABLE "TLB_WORK" (
	"WORK_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NULL,
	"WORK_TYPE_CODE"	VARCHAR2(30)		NULL,
	"WORK_DAY"	DATE	DEFAULT SYSDATE	NULL,
	"WORK_START_TIME"	DATE	DEFAULT SYSDATE	NULL,
	"WORK_END_TIME"	DATE	DEFAULT SYSDATE	NULL,
	"WORK_PERMIT"	VARCHAR2(10)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFIER_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)		NULL,
	"WORK_ATTENDANCE"	CHAR(1)		NULL
);

COMMENT ON COLUMN "TLB_WORK"."WORK_NO" IS '근태상태고유번호';

COMMENT ON COLUMN "TLB_WORK"."EMP_NO" IS '사원번호';

COMMENT ON COLUMN "TLB_WORK"."WORK_TYPE_CODE" IS '근무유형번호';

COMMENT ON COLUMN "TLB_WORK"."WORK_DAY" IS '출근일자';

COMMENT ON COLUMN "TLB_WORK"."WORK_START_TIME" IS '출근시간';

COMMENT ON COLUMN "TLB_WORK"."WORK_END_TIME" IS '퇴근시간';

COMMENT ON COLUMN "TLB_WORK"."WORK_PERMIT" IS '승인상태';

COMMENT ON COLUMN "TLB_WORK"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TLB_WORK"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TLB_WORK"."MODIFIER_DATE" IS '수정일';

COMMENT ON COLUMN "TLB_WORK"."USE_YN" IS '사용유무';

COMMENT ON COLUMN "TLB_WORK"."WORK_ATTENDANCE" IS '''N''(결근)/A''(지각)''';


CREATE TABLE "TBL_COMMON_CODE" (
	"CD"	VARCHAR2(300)		NULL,
	"NM"	VARCHAR2(300)		NULL,
	"CREATER"	NUMBER		NULL,
	"MODIFY"	NUMBER		NULL,
	"CREATE_DATE"	DATE		DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE		DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "TBL_COMMON_CODE"."CD" IS '직책';

COMMENT ON COLUMN "TBL_COMMON_CODE"."NM" IS '직급';

COMMENT ON COLUMN "TBL_COMMON_CODE"."CREATER" IS '생성자';

COMMENT ON COLUMN "TBL_COMMON_CODE"."MODIFY" IS '수정자';

COMMENT ON COLUMN "TBL_COMMON_CODE"."CREATE_DATE" IS '생성일자';

COMMENT ON COLUMN "TBL_COMMON_CODE"."MODIFY_DATE" IS '수정일자';

CREATE TABLE "TBL_SALARY" (
	"Key"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NULL,
	"SAL_BASE"	NUMBER		NULL,
	"SAL_OVERTIME_PAY"	NUMBER		NULL,
	"BONUS"	NUMBER		NULL,
	"SAL_GROSS_PAY"	NUMBER		NULL,
	"SAL_NP"	NUMBER		NULL,
	"SAL_HI"	NUMBER		NULL,
	"SAL_EI"	NUMBER		NULL,
	"SAL_TOTAL_DD"	NUMBER		NULL,
	"SAL_NET_SALARY"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "TBL_SALARY"."Key" IS '급여고유번호';

COMMENT ON COLUMN "TBL_SALARY"."EMP_NO" IS '사원번호';

COMMENT ON COLUMN "TBL_SALARY"."SAL_BASE" IS '기본급여';

COMMENT ON COLUMN "TBL_SALARY"."SAL_OVERTIME_PAY" IS '보험금액';

COMMENT ON COLUMN "TBL_SALARY"."BONUS" IS '공제금액';

COMMENT ON COLUMN "TBL_SALARY"."SAL_GROSS_PAY" IS '실지급액';

COMMENT ON COLUMN "TBL_SALARY"."SAL_NP" IS '국민연금';

COMMENT ON COLUMN "TBL_SALARY"."SAL_HI" IS '건강보험';

COMMENT ON COLUMN "TBL_SALARY"."SAL_EI" IS '고용보험';

COMMENT ON COLUMN "TBL_SALARY"."SAL_TOTAL_DD" IS '총공제액';

COMMENT ON COLUMN "TBL_SALARY"."SAL_NET_SALARY" IS '실수령액';

COMMENT ON COLUMN "TBL_SALARY"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_SALARY"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_SALARY"."MODIFY_DATE" IS '수정일';

CREATE TABLE "TBL_VACATION" (
	"VAC_NO"	NUMBER		NOT NULL,
	"EDOC_NO"	NUMBER		NULL,
	"VAC_OPTION"	VARCHAR2(50)		NULL,
	"VAC_STARTDATE"	DATE		NULL,
	"VAC_ENDDATE"	DATE		NULL,
	"VAC_PERMIT"	CHAR(1)	DEFAULT 'N'	NULL,
	"VAC_COUNT"	NUMBER		NULL
);

COMMENT ON COLUMN "TBL_VACATION"."VAC_NO" IS '휴가번호';

COMMENT ON COLUMN "TBL_VACATION"."EDOC_NO" IS '전자문서번호';

COMMENT ON COLUMN "TBL_VACATION"."VAC_OPTION" IS '연차/반차';

COMMENT ON COLUMN "TBL_VACATION"."VAC_STARTDATE" IS '시작일시';

COMMENT ON COLUMN "TBL_VACATION"."VAC_ENDDATE" IS '종요일시';

COMMENT ON COLUMN "TBL_VACATION"."VAC_PERMIT" IS '승인상태(Y/N), 결제완료시 ''Y'' 로 변경';

COMMENT ON COLUMN "TBL_VACATION"."VAC_COUNT" IS '일수';

CREATE TABLE "TBL_DEPARTMENT" (
	"DEPT_CODE"	VARCHAR2(100)		NOT NULL,
	"DEPT_UPSTAIR"	VARCHAR2(100)		NULL,
	"DEPT_NAME"	VARCHAR2(100)		NULL,
	"EMP_NO"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TBL_DEPARTMENT"."DEPT_CODE" IS '부서코드';

COMMENT ON COLUMN "TBL_DEPARTMENT"."DEPT_UPSTAIR" IS '상위부서';

COMMENT ON COLUMN "TBL_DEPARTMENT"."DEPT_NAME" IS '부서명';

COMMENT ON COLUMN "TBL_DEPARTMENT"."EMP_NO" IS '생성자';

COMMENT ON COLUMN "TBL_DEPARTMENT"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_DEPARTMENT"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_DEPARTMENT"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_DEPARTMENT"."USE_YN" IS '사용유무(Y/N)';

CREATE TABLE "TBL_REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(2000)		NULL,
	"REF_BNO"	NUMBER		NULL,
	"UPR_REPLY_NO"	VARCHAR2(10)		NULL,
	"STATUS"	CHAR(1 BYTE)	DEFAULT 'A'	NULL,
	"EMP_NO"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TBL_REPLY"."REPLY_NO" IS '댓글 번호';

COMMENT ON COLUMN "TBL_REPLY"."REPLY_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "TBL_REPLY"."REF_BNO" IS 'BOARD_NO';

COMMENT ON COLUMN "TBL_REPLY"."UPR_REPLY_NO" IS '상위댓글번호';

COMMENT ON COLUMN "TBL_REPLY"."STATUS" IS 'A 공개댓글 | B 비공개댓글';

COMMENT ON COLUMN "TBL_REPLY"."EMP_NO" IS '댓글작성자';

COMMENT ON COLUMN "TBL_REPLY"."CREATE_DATE" IS '댓글작성일';

COMMENT ON COLUMN "TBL_REPLY"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_REPLY"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_REPLY"."USE_YN" IS '사용유무(Y/N)';

CREATE TABLE "TBL_EDOC" (
	"EDOC_NO"	NUMBER		NOT NULL,
	"EDOC_DOT_TYPE"	VARCHAR2(100)		NULL,
	"EDOC_TITLE"	VARCHAR2(300)		NULL,
	"EDOC_CONTENT"	CLOB		NULL,
	"EDOC_STARTDATE"	DATE	DEFAULT SYSDATE	NULL,
	"EDOC_ENDDATE"	DATE		NULL,
	"FINAL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"EDOC_STATUS"	VARCHAR2(30)		NULL,
	"EMP_NO"	NUMBER		NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TBL_EDOC"."EDOC_NO" IS '전자문서번호';

COMMENT ON COLUMN "TBL_EDOC"."EDOC_DOT_TYPE" IS '양식유형';

COMMENT ON COLUMN "TBL_EDOC"."EDOC_TITLE" IS '제목';

COMMENT ON COLUMN "TBL_EDOC"."EDOC_CONTENT" IS '문서내용';

COMMENT ON COLUMN "TBL_EDOC"."EDOC_STARTDATE" IS '시작일시(생성일)';

COMMENT ON COLUMN "TBL_EDOC"."EDOC_ENDDATE" IS '종료일시(시작일시 + 14일) 자동으로';

COMMENT ON COLUMN "TBL_EDOC"."FINAL_DATE" IS '완료일';

COMMENT ON COLUMN "TBL_EDOC"."EDOC_STATUS" IS 'T(임시저장,회수하면 임시저장으로 옮겨짐), S(결제대기), O(결제진행중), F(결제완료), R(결제반려)';

COMMENT ON COLUMN "TBL_EDOC"."EMP_NO" IS '기안자(생성자, 사원번호)';

COMMENT ON COLUMN "TBL_EDOC"."MODIFIER" IS '수정자(사원번호)';

COMMENT ON COLUMN "TBL_EDOC"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_EDOC"."USE_YN" IS '사용여부(Y/N)';

CREATE TABLE "TBL_EDOC_APPROVAL" (
	"APRVL_NO"	NUMBER		NOT NULL,
	"APRVL_EDOC_NO"	NUMBER		NULL,
	"APRVL_RANK"	NUMBER		NULL,
	"APRVL_STATUS"	CHAR(1)		NULL,
	"APRVL_COMMENT"	VARCHAR2(4000)		NULL,
	"APRVL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"EMP_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "TBL_EDOC_APPROVAL"."APRVL_NO" IS '일련번호';

COMMENT ON COLUMN "TBL_EDOC_APPROVAL"."APRVL_EDOC_NO" IS '전자문서번호';

COMMENT ON COLUMN "TBL_EDOC_APPROVAL"."APRVL_RANK" IS '결재순서';

COMMENT ON COLUMN "TBL_EDOC_APPROVAL"."APRVL_STATUS" IS '결재여부(W / Y / N)';

COMMENT ON COLUMN "TBL_EDOC_APPROVAL"."APRVL_COMMENT" IS '결재의견';

COMMENT ON COLUMN "TBL_EDOC_APPROVAL"."APRVL_DATE" IS '결재일';

COMMENT ON COLUMN "TBL_EDOC_APPROVAL"."EMP_NO" IS '결재자(사원번호)';

CREATE TABLE "TBL_EDOC_SAMPLE" (
	"SAMPLE_NO"	NUMBER		NOT NULL,
	"SAMPLE_DOT_CODE"	VARCHAR2(100)		NULL,
	"SAMPLE_DESC"	VARCHAR2(400)		NULL,
	"SAMPLE_FORMAT"	CLOB		NULL,
	"EMP_NO"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFT_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."SAMPLE_NO" IS '일련번호';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."SAMPLE_DOT_CODE" IS '일반, 휴가';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."SAMPLE_DESC" IS '샘플양식 설명';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."SAMPLE_FORMAT" IS '사용자서식';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."EMP_NO" IS '생성자(사원번호)';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."MODIFIER" IS '수정자(사원번호)';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."MODIFT_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_EDOC_SAMPLE"."USE_YN" IS '사용여부(Y/N)';

CREATE TABLE "TBL_LOG" (
	"LOG_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NULL,
	"LOG_TYPE"	CHAR		NULL,
	"MENU_NAME"	VARCHAR2(100)		NULL,
	"BEFOR_DATA"	VARCHAR2(2000)		NULL,
	"AFTER_DATA"	VARCHAR2(2000)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_YN"	CHAR(1)	DEFAULT 'Y'	NULL,
	"DOCUMENT_NO"	VARCHAR2(4000)		NULL
);

COMMENT ON COLUMN "TBL_LOG"."LOG_NO" IS '로그 고유 번호 (시퀀스) /select, update, insert 기록';

COMMENT ON COLUMN "TBL_LOG"."EMP_NO" IS '사원번호';

COMMENT ON COLUMN "TBL_LOG"."LOG_TYPE" IS '1: 부서이동  / 2:조회 / 3:추가 / 4:수정 / 5:삭제';

COMMENT ON COLUMN "TBL_LOG"."MENU_NAME" IS '메뉴이름';

COMMENT ON COLUMN "TBL_LOG"."BEFOR_DATA" IS 'ex) 주소: 금천구, 계좌번호:252-123';

COMMENT ON COLUMN "TBL_LOG"."AFTER_DATA" IS 'ex)주소: 서울시, 계좌번호:215-456';

COMMENT ON COLUMN "TBL_LOG"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_LOG"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_LOG"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_LOG"."USER_YN" IS '사용유무(Y/N)';

COMMENT ON COLUMN "TBL_LOG"."DOCUMENT_NO" IS '부서이동 결재 이력 (후순위)';

CREATE TABLE "TBL_ALARM" (
	"AUTO_INCREMENT"	NUMBER		NULL,
	"EMP_NO"	NUMBER		NULL,
	"RECIEVE_EMP_NO"	NUMBER		NULL,
	"AR_MSG"	VARCHAR2(4000)		NULL,
	"AR_TYPE"	CHAR(10)		NULL,
	"AR_READ"	CHAR		NULL,
	"CREATE_DATE"	DATE		NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE		NULL,
	"Field10"	CHAR(1)		NULL
);

COMMENT ON COLUMN "TBL_ALARM"."AUTO_INCREMENT" IS '알림 고유 ID';

COMMENT ON COLUMN "TBL_ALARM"."EMP_NO" IS '사원번호';

COMMENT ON COLUMN "TBL_ALARM"."RECIEVE_EMP_NO" IS '받는 사원 번호';

COMMENT ON COLUMN "TBL_ALARM"."AR_MSG" IS '알림 내용';

COMMENT ON COLUMN "TBL_ALARM"."AR_TYPE" IS '알림유형';

COMMENT ON COLUMN "TBL_ALARM"."AR_READ" IS '읽음  여부';

COMMENT ON COLUMN "TBL_ALARM"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_ALARM"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_ALARM"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_ALARM"."Field10" IS '사용유무(Y/N)';

CREATE TABLE "TBL_CALENDAR" (
	"CAL_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NULL,
	"CAL_START_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"CAL_END_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"CAL_SUBJECT"	VARCHAR2(4000)		NULL,
	"CAL_CONTENT"	VARCHAR2(4000)		NULL,
	"CAL_COLOR"	VARCHAR2(4000)		NULL,
	"CAL_STATUS"	VARCHAR2(4000)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"DEPT_CODE"	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN "TBL_CALENDAR"."CAL_COLOR" IS 'R:공지사항 / Y:부서일정 / B:개인휴가일정 / G:개인회의일정';

CREATE TABLE "TBL_GOOD" (
	"REPLY_NO"	NUMBER		NULL,
	"GOOD_REPLY"	CHAR(1)	DEFAULT 'N'	NULL,
	"CREATER"	VARCHAR2(150)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "TBL_GOOD"."REPLY_NO" IS '참조 댓글번호';

COMMENT ON COLUMN "TBL_GOOD"."GOOD_REPLY" IS 'Y 활성화 | N 비활성화';

COMMENT ON COLUMN "TBL_GOOD"."CREATER" IS '생성자';

COMMENT ON COLUMN "TBL_GOOD"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_GOOD"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_GOOD"."MODIFY_DATE" IS '수정일';

CREATE TABLE "TBL_DEPRECODE" (
	"DEPRECODE_CODE"	VARCHAR2(100)		NOT NULL,
	"DEPRECODE_BEFORE"	VARCHAR2(100)		NULL,
	"DEPRECODE_AFTER"	VARCHAR2(100)		NULL,
	"DEPRECODE_DATE"	DATE		NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TBL_DEPRECODE"."DEPRECODE_CODE" IS '부서변경 이력코드';

COMMENT ON COLUMN "TBL_DEPRECODE"."DEPRECODE_BEFORE" IS '이전 부서명';

COMMENT ON COLUMN "TBL_DEPRECODE"."DEPRECODE_AFTER" IS '변경된 부서명';

COMMENT ON COLUMN "TBL_DEPRECODE"."DEPRECODE_DATE" IS '변경일자';

COMMENT ON COLUMN "TBL_DEPRECODE"."USE_YN" IS '사용유무(Y/N)';

CREATE TABLE "TBL_PRODUCT" (
	"PRODUCT_NO"	NUMBER		NOT NULL,
	"PRODUCT_NAMA"	VARCHAR2(300)		NULL,
	"COST"	VARCHAR2(300)		NULL,
	"SAIL_PRICE"	VARCHAR2(300)		NULL,
	"PROFIT_MARGIN"	VARCHAR2(300)		NULL,
	"RECOMMENDED_CATEGORY"	CHAR(1)		NULL,
	"EXPIRATION_PERIOD"	DATE		NULL,
	"PRODUCT_IMG"	CLOB		NULL,
	"CREATER"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"DELIVERY_DATE"	VARCHAR2(300)		NULL,
	"USE_YN"	CHAR(1)		NULL
);

COMMENT ON COLUMN "TBL_PRODUCT"."PRODUCT_NO" IS '상품번호';

COMMENT ON COLUMN "TBL_PRODUCT"."PRODUCT_NAMA" IS '상품명';

COMMENT ON COLUMN "TBL_PRODUCT"."COST" IS '원가';

COMMENT ON COLUMN "TBL_PRODUCT"."SAIL_PRICE" IS '매가';

COMMENT ON COLUMN "TBL_PRODUCT"."PROFIT_MARGIN" IS '매익률';

COMMENT ON COLUMN "TBL_PRODUCT"."RECOMMENDED_CATEGORY" IS '추천구분';

COMMENT ON COLUMN "TBL_PRODUCT"."EXPIRATION_PERIOD" IS '유효기간';

COMMENT ON COLUMN "TBL_PRODUCT"."PRODUCT_IMG" IS '상품이미지';

COMMENT ON COLUMN "TBL_PRODUCT"."CREATER" IS '생성자';

COMMENT ON COLUMN "TBL_PRODUCT"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_PRODUCT"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_PRODUCT"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_PRODUCT"."DELIVERY_DATE" IS '월화수목금';

COMMENT ON COLUMN "TBL_PRODUCT"."USE_YN" IS '사용유무';

CREATE TABLE "TBL_CLASSIFICATION" (
	"CLASSIFICATION_NO"	NUMBER		NOT NULL,
	"CLASSIFICATION_NAME"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "TBL_CLASSIFICATION"."CLASSIFICATION_NO" IS '분류번호';

COMMENT ON COLUMN "TBL_CLASSIFICATION"."CLASSIFICATION_NAME" IS '분류명';

CREATE TABLE "TBL_BOARDTYPE" (
	"BOARD_TYPE_NO"	NUMBER		NOT NULL,
	"BOARDT_NAME"	VARCHAR2(20)		NULL,
	"BOARDT_TYPE"	CHAR(1)		NULL,
	"BOARDT_READ"	VARCHAR2(300)		NULL,
	"BOARDT_WRITE"	VARCHAR2(150)		NULL,
	"BOARDT_CONTENT"	CLOB		NULL,
	"BOARDT_USE"	CHAR(1)		NULL,
	"DEPT_CODE"	VARCHAR2(100)		NULL,
	"REGIST_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"EMP_NO"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TBL_BOARDTYPE"."BOARD_TYPE_NO" IS '게시판종류 번호';

COMMENT ON COLUMN "TBL_BOARDTYPE"."BOARDT_NAME" IS '게시판명';

COMMENT ON COLUMN "TBL_BOARDTYPE"."BOARDT_TYPE" IS 'N:공지사항성 / G:자유게시판 / S:익명게시판';

COMMENT ON COLUMN "TBL_BOARDTYPE"."BOARDT_READ" IS '읽기권한';

COMMENT ON COLUMN "TBL_BOARDTYPE"."BOARDT_WRITE" IS '댓글쓰기권한';

COMMENT ON COLUMN "TBL_BOARDTYPE"."BOARDT_CONTENT" IS '쓰기권한';

COMMENT ON COLUMN "TBL_BOARDTYPE"."BOARDT_USE" IS '보이기(Y)/감추기(N)';

COMMENT ON COLUMN "TBL_BOARDTYPE"."DEPT_CODE" IS '부서코드';

COMMENT ON COLUMN "TBL_BOARDTYPE"."REGIST_DATE" IS '작성일';

COMMENT ON COLUMN "TBL_BOARDTYPE"."EMP_NO" IS '생성자';

COMMENT ON COLUMN "TBL_BOARDTYPE"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_BOARDTYPE"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_BOARDTYPE"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_BOARDTYPE"."USE_YN" IS '게시판사용(Y/N)';

CREATE TABLE "TBL_ORDERING_PRODUCT" (
	"PRODUCT_NO"	NUMBER		NULL,
	"ORDER_COUNT"	NUMBER		NULL,
	"EMP_NO"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USE_YN"	CHAR(1)		NULL,
	"EVENT"	CHAR(1)		NULL
);

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."PRODUCT_NO" IS '상품번호';

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."ORDER_COUNT" IS '발주수량';

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."EMP_NO" IS '생성자';

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."USE_YN" IS '사용유무';

COMMENT ON COLUMN "TBL_ORDERING_PRODUCT"."EVENT" IS '행사유무';

CREATE TABLE "TBL_WORK_REALTIME" (
	"EMP_NO"	NUMBER		NULL,
	"WORK_LATE"	VARCHAR2(10)		NULL,
	"WORK_FAST_END"	VARCHAR2(10)		NULL,
	"WORK_ABSENCE"	VARCHAR2(10)		NULL,
	"CREATE_DATE"	DATE		NULL,
	"MODIFIER"	NUMBER		NULL,
	"MODIFIER_DATE"	DATE		NULL
);

COMMENT ON COLUMN "TBL_WORK_REALTIME"."EMP_NO" IS '사원번호';

COMMENT ON COLUMN "TBL_WORK_REALTIME"."WORK_LATE" IS '지각여부';

COMMENT ON COLUMN "TBL_WORK_REALTIME"."WORK_FAST_END" IS '조기퇴근여부';

COMMENT ON COLUMN "TBL_WORK_REALTIME"."WORK_ABSENCE" IS '결근여부';

COMMENT ON COLUMN "TBL_WORK_REALTIME"."CREATE_DATE" IS '생성일';

COMMENT ON COLUMN "TBL_WORK_REALTIME"."MODIFIER" IS '수정자';

COMMENT ON COLUMN "TBL_WORK_REALTIME"."MODIFIER_DATE" IS '수정일';

CREATE TABLE "TBL_DEPARTMENT_TRANSFER" (
	"DEPT_TRANSFER_NO"	NUMBER		NOT NULL,
	"EDOC_NO"	NUMBER		NULL,
	"DEPT_TRANSFER_CONTENT"	VARCHAR2(4000)		NULL,
	"DEPT_TRANSFER_PERMIT"	CHAR(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "TBL_DEPARTMENT_TRANSFER"."DEPT_TRANSFER_NO" IS '부서이동번호';

COMMENT ON COLUMN "TBL_DEPARTMENT_TRANSFER"."EDOC_NO" IS '전자문서번호';

COMMENT ON COLUMN "TBL_DEPARTMENT_TRANSFER"."DEPT_TRANSFER_CONTENT" IS '어디부서로 이동, 부서이동 사유';

COMMENT ON COLUMN "TBL_DEPARTMENT_TRANSFER"."DEPT_TRANSFER_PERMIT" IS '승인상태(Y/N), 결제완료시 ''Y'' 로 변경';

ALTER TABLE "TBL_EMPLOYEE" ADD CONSTRAINT "PK_TBL_EMPLOYEE" PRIMARY KEY (
	"EMP_NO"
);

ALTER TABLE "TBL_BOARD" ADD CONSTRAINT "PK_TBL_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "TBL_EDOC_ATTACHMENT" ADD CONSTRAINT "PK_TBL_EDOC_ATTACHMENT" PRIMARY KEY (
	"ATTACH_NO"
);

ALTER TABLE "TBL_DISPATCH" ADD CONSTRAINT "PK_TBL_DISPATCH" PRIMARY KEY (
	"DISPATCH_NO"
);

ALTER TABLE "TBL_ORDERING" ADD CONSTRAINT "PK_TBL_ORDERING" PRIMARY KEY (
	"ORDER_NO"
);

ALTER TABLE "TLB_WORK" ADD CONSTRAINT "PK_TLB_WORK" PRIMARY KEY (
	"WORK_NO"
);

ALTER TABLE "TBL_SALARY" ADD CONSTRAINT "PK_TBL_SALARY" PRIMARY KEY (
	"Key"
);

ALTER TABLE "TBL_VACATION" ADD CONSTRAINT "PK_TBL_VACATION" PRIMARY KEY (
	"VAC_NO"
);

ALTER TABLE "TBL_DEPARTMENT" ADD CONSTRAINT "PK_TBL_DEPARTMENT" PRIMARY KEY (
	"DEPT_CODE"
);

ALTER TABLE "TBL_REPLY" ADD CONSTRAINT "PK_TBL_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "TBL_EDOC" ADD CONSTRAINT "PK_TBL_EDOC" PRIMARY KEY (
	"EDOC_NO"
);

ALTER TABLE "TBL_EDOC_APPROVAL" ADD CONSTRAINT "PK_TBL_EDOC_APPROVAL" PRIMARY KEY (
	"APRVL_NO"
);

ALTER TABLE "TBL_EDOC_SAMPLE" ADD CONSTRAINT "PK_TBL_EDOC_SAMPLE" PRIMARY KEY (
	"SAMPLE_NO"
);

ALTER TABLE "TBL_LOG" ADD CONSTRAINT "PK_TBL_LOG" PRIMARY KEY (
	"LOG_NO"
);

ALTER TABLE "TBL_CALENDAR" ADD CONSTRAINT "PK_TBL_CALENDAR" PRIMARY KEY (
	"CAL_NO"
);

ALTER TABLE "TBL_DEPRECODE" ADD CONSTRAINT "PK_TBL_DEPRECODE" PRIMARY KEY (
	"DEPRECODE_CODE"
);

ALTER TABLE "TBL_PRODUCT" ADD CONSTRAINT "PK_TBL_PRODUCT" PRIMARY KEY (
	"PRODUCT_NO"
);

ALTER TABLE "TBL_CLASSIFICATION" ADD CONSTRAINT "PK_TBL_CLASSIFICATION" PRIMARY KEY (
	"CLASSIFICATION_NO"
);

ALTER TABLE "TBL_BOARDTYPE" ADD CONSTRAINT "PK_TBL_BOARDTYPE" PRIMARY KEY (
	"BOARD_TYPE_NO"
);

ALTER TABLE "TBL_WORK_REALTIME" ADD CONSTRAINT "PK_TBL_WORK_REALTIME" PRIMARY KEY (
	"WORK_LATE"
);

ALTER TABLE "TBL_DEPARTMENT_TRANSFER" ADD CONSTRAINT "PK_TBL_DEPARTMENT_TRANSFER" PRIMARY KEY (
	"DEPT_TRANSFER_NO"
);

COMMIT;