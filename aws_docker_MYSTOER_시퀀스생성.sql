CREATE SEQUENCE EMP_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (사원번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE EDOC_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (전자결재번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE SAMPLE_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (전자결재양식 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE VAC_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (휴가양식번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE DEPT_TRANSFER_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (부서이동번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE ATTACH_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (첨부파일번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

CREATE SEQUENCE APRVL_NO_SEQ 
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1   -- 1씩 증가
START WITH 1001  -- 첫 번째 값 (결재선번호 시작값)
NOCACHE             -- 캐시 사용하지 않음
NOORDER             -- 순환하지 않음
NOCYCLE ;            -- 순서대로 생성하지 않음 (기본값)

COMMIT;