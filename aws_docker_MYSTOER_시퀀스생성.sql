CREATE SEQUENCE EMP_NO_SEQ -- 사원
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (사원번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE EDOC_NO_SEQ -- 전자문서
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (전자결재번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE SAMPLE_NO_SEQ -- 전자결재양식
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (전자결재양식 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE VAC_NO_SEQ -- 휴가양식
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (휴가양식번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE DEPT_TRANSFER_NO_SEQ -- 부서이동양식
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (부서이동번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE ATTACH_NO_SEQ -- 첨부파일
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (첨부파일번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE APRVL_NO_SEQ -- 결제선
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (결재선번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE CAL_NO_SEQ -- 캘린더
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (캘린더번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE KEY_SEQ -- 급여
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (급여번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE LOG_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 100001  -- 첫 번째 값 (로그번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE INCREMENT_NO_SEQ -- 알림
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (결재선번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE BOARD_NO_SEQ -- 게시판
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (게시글번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE BOARD_TYPE_NO_SEQ -- 게시판유형
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (게시판유형 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE REPLY_NO_SEQ -- 댓글유형
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (댓글번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE DISPATCH_NO_SEQ -- 배차
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (배차번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE CLASSIFICATION_NO_SEQ -- 분류
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (분류번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE ORDER_NO_SEQ -- 발주
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (발주번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE PRODUCT_NO_SEQ -- 상품
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (상품 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

COMMIT;