-- 직원 1
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '정준수', 'M', '1998-01-11', '010-5195-1515', 'junsuking@example.com', '서울시 강남구', 'Y',
'시그니엘', '06123', 'password123', 'PS002', 'RK002', 'https://i.ibb.co/ThPF95Q/EMPLOYEE-0.jpg', 'D001', SYSDATE, SYSDATE, 1, 1, 'Y',
'123-156-159012', '하나은행'
);

-- 직원 2
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '천예찬', 'M', '1985-01-01', '010-1234-5678', 'honggildong@example.com', '서울시 강남구', 'Y',
'서울특별시 강남구 테헤란로 123', '06123', 'password123', 'PS001', 'RK001', 'https://i.ibb.co/2659g1K/employee2-jpg.png', 'D014', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'123-456-789012', '하나은행'
);

-- 직원 3
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '김예진', 'F', '1990-05-20', '010-2345-6789', 'kimchulsoo@example.com', '서울시 송파구', 'Y',
'서울시 송파구 가락로 456', '05892', 'password456', 'PS003', 'RK003', 'https://i.ibb.co/QKnwCkL/employee1-jpg.png', 'D008', SYSDATE, SYSDATE, 1001, 1001, 'Y',
'987-654-321098', '국민은행'
);
-- 직원 4
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '박지영', 'F', '1988-07-15', '010-3456-7890', 'parkjiyeong@example.com', '서울시 강서구', 'Y',
'서울시 강서구 화곡로 789', '07756', 'password789', 'PS004', 'RK005', 'https://i.ibb.co/kh5dTCt/employee3-jpg.png', 'D007', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'345-678-901234', '우리은행'
);
-- 직원 5
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '이민호', 'M', '1992-12-05', '010-4567-8901', 'leeminho@example.com', '서울시 마포구', 'Y',
'서울시 마포구 월드컵로 234', '04123', 'password101', 'PS004', 'RK007', 'https://i.ibb.co/q5m5FGK/employee5-jpg.png', 'D009', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'567-890-123456', '신한은행'
);
-- 직원 6
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '최지은', 'F', '1995-02-14', '010-5678-9012', 'choijieun@example.com', '서울시 동대문구', 'Y',
'서울시 동대문구 회기동 123', '04567', 'password112', 'PS004', 'RK004', 'https://i.ibb.co/bHY588j/employee4-jpg.png', 'D010', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'678-901-234567', '기업은행'
);
-- 직원 7
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '김수현', 'M', '1993-08-19', '010-6789-0123', 'kimsuhyun@example.com', '서울시 강동구', 'Y',
'서울시 강동구 천호대로 890', '05345', 'password134', 'PS004', 'RK006', 'https://i.ibb.co/gJqqfM7/employee10-jpg.png', 'D007', SYSDATE, SYSDATE, 1001, 1001, 'Y',
'789-012-345678', '농협은행'
);
-- 직원 8
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '정유진', 'F', '1989-11-22', '010-7890-1234', 'jeongyujin@example.com', '서울시 관악구', 'Y',
'서울시 관악구 신림로 345', '05434', 'password145', 'PS004', 'RK005', 'https://i.ibb.co/zH54rC6/employee6-jpg.png', 'D011', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'890-123-456789', '씨티은행'
);
-- 직원 9
INSERT INTO TBL_EMPLOYEE(
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '임정훈', 'M', '1994-03-28', '010-8901-2345', 'limjeonghoon@example.com', '서울시 서대문구', 'Y',
'서울시 서대문구 창천동 456', '07012', 'password156', 'PS004', 'RK004', 'https://i.ibb.co/zn7xnyT/employee7-jpg.png', 'D012', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'901-234-567890', 'KEB하나은행'
);
-- 직원 10
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '하지민', 'F', '1991-06-10', '010-9012-3456', 'hajinsu@example.com', '서울시 노원구', 'Y',
'서울시 노원구 상계동 567', '06998', 'password167', 'PS005', 'RK004', 'https://i.ibb.co/z8XgkSD/employee8-jpg.png', 'D016', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'012-345-678901', '하나은행'
);
-- 직원 11
INSERT INTO TBL_EMPLOYEE(
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '윤서연', 'F', '1996-07-25', '010-0123-4567', 'yunseoyeon@example.com', '서울시 영등포구', 'Y',
'서울시 영등포구 당산동 789', '07321', 'password178', 'PS004', 'RK004', 'https://i.ibb.co/S5yw0zj/employee9-jpg.png', 'D013', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'234-567-890123', '우리은행'
);

-- 직원 1
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '홍길동', 'M', '1980-04-14', '010-2345-6789', 'honggildong@example.com', '서울시 강남구', 'Y',
'서울시 강남구 역삼동 234', '06123', 'password199', 'PS004', 'RK004', 'https://i.ibb.co/hF1Kr7N/employee11-jpg.png', 'D014', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'111-222-333444', '국민은행'
);
-- 직원 2
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '서정민', 'M', '1986-11-10', '010-4567-8901', 'seojeongmin@example.com', '경기도 수원시', 'Y',
'경기도 수원시 영통구 567', '04567', 'password200', 'PS004', 'RK005', 'https://i.ibb.co/9VzD9YT/employee12-jpg.png', 'D015', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'234-567-890123', '농협은행'
);
-- 직원 3
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '이윤아', 'F', '1993-09-17', '010-5678-9012', 'leejoonseo@example.com', '서울시 서초구', 'Y',
'서울시 서초구 방배동 890', '06234', 'password201', 'PS004', 'RK006', 'https://i.ibb.co/Fw5n5Cg/employee13-jpg.png', 'D007', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'345-678-901234', '하나은행'
);
-- 직원 4
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '김호진', 'M', '1990-03-25', '010-6789-0123', 'kimhojin@example.com', '서울시 동대문구', 'Y',
'서울시 동대문구 답십리동 123', '05678', 'password202', 'PS004', 'RK004', 'https://i.ibb.co/Tgy5F7g/employee14-jpg.png', 'D008', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'456-789-012345', '씨티은행'
);
-- 직원 5
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '정민지', 'F', '1992-08-30', '010-7890-1234', 'jeongminji@example.com', '서울시 성북구', 'Y',
'서울시 성북구 길음동 345', '06789', 'password203', 'PS004', 'RK004', 'https://i.ibb.co/rdXr3gC/employee15-jpg.png', 'D009', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'567-890-123456', '우리은행'
);
-- 직원 6
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '박지민', 'M', '1991-05-05', '010-8901-2345', 'parkjimin@example.com', '서울시 영등포구', 'Y',
'서울시 영등포구 당산동 678', '07543', 'password204', 'PS004', 'RK004', 'https://i.ibb.co/TgFVVxK/employee16-jpg.png', 'D010', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'678-901-234567', '신한은행'
);
-- 직원 7
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '김상훈', 'M', '1987-12-22', '010-9012-3456', 'kimsanghoon@example.com', '서울시 강북구', 'Y',
'서울시 강북구 미아동 234', '05934', 'password205', 'PS004', 'RK004', 'https://i.ibb.co/6np7M48/employee17-jpg.png', 'D011', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'789-012-345678', '하나은행'
);
-- 직원 8
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '이수연', 'F', '1994-07-14', '010-2345-6789', 'leesuyeon@example.com', '서울시 용산구', 'Y',
'서울시 용산구 이태원동 890', '08123', 'password206', 'PS004', 'RK004', 'https://i.ibb.co/Sv13Fym/employee18-jpg.png', 'D012', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'890-123-456789', '기업은행'
);
-- 직원 9
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '정민영', 'F', '1993-01-30', '010-5678-9012', 'jeongminyoung@example.com', '서울시 구로구', 'Y',
'서울시 구로구 디지털로 123', '06245', 'password207', 'PS004', 'RK004', 'https://i.ibb.co/KFqgGpB/employee19-jpg.png', 'D013', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'901-234-567890', 'KEB하나은행'
);
-- 직원 10
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '오세영', 'M', '1988-11-11', '010-6789-0123', 'ohseyoung@example.com', '서울시 종로구', 'Y',
'서울시 종로구 인사동 234', '06783', 'password208', 'PS004', 'RK004', 'https://i.ibb.co/mFTjqpm/employee20-jpg.png', 'D014', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'012-345-678901', '우리은행'
);

-- 직원 11
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '김지은', 'F', '1997-02-11', '010-2345-6789', 'kimjieun@example.com', '서울시 용산구', 'Y',
'서울시 용산구 한남동 123', '04567', 'password209', 'PS004', 'RK004', 'https://i.ibb.co/5GtgbNY/employee21-jpg.png', 'D015', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'234-567-890123', '농협은행'
);
-- 직원 12
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '윤지훈', 'M', '1992-01-18', '010-3456-7890', 'yoonjihoon@example.com', '서울시 마포구', 'Y',
'서울시 마포구 상암동 234', '07234', 'password210', 'PS004', 'RK004', 'https://i.ibb.co/XjNrBhv/employee22-jpg.png', 'D007', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'345-678-901234', '기업은행'
);
-- 직원 13
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '박성훈', 'M', '1989-08-15', '010-5678-9012', 'parkseonghoon@example.com', '서울시 강동구', 'Y',
'서울시 강동구 길동 567', '08156', 'password211', 'PS004', 'RK004', 'https://i.ibb.co/xH3PLFh/employee23-jpg.png', 'D008', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'456-789-012345', '신한은행'
);
-- 직원 14
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '송유진', 'F', '1994-09-22', '010-6789-0123', 'songyujin@example.com', '서울시 종로구', 'Y',
'서울시 종로구 삼청동 234', '07212', 'password212', 'PS004', 'RK005', 'https://i.ibb.co/wyZtCLm/employee24-jpg.png', 'D009', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'567-890-123456', '하나은행'
);
-- 직원 15
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '정하나', 'F', '1996-11-11', '010-7890-1234', 'jeonghana@example.com', '서울시 중구', 'Y',
'서울시 중구 명동 345', '06545', 'password213', 'PS004', 'RK006', 'https://i.ibb.co/LQ4mbC5/employee25-jpg.png', 'D010', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'678-901-234567', '우리은행'
);
-- 직원 16
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '최우진', 'M', '1984-10-10', '010-9012-3456', 'choiwoojin@example.com', '서울시 서초구', 'Y',
'서울시 서초구 방배동 456', '06587', 'password214', 'PS004', 'RK006', 'https://i.ibb.co/z8jdKBg/employee26-jpg.png', 'D011', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'789-012-345678', '농협은행'
);
-- 직원 17
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '홍서영', 'F', '1990-02-20', '010-2345-6789', 'hongseoyeong@example.com', '서울시 성북구', 'Y',
'서울시 성북구 종암동 678', '07012', 'password215', 'PS004', 'RK007', 'https://i.ibb.co/7r2qmdn/employee27-jpg.png', 'D012', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'890-123-456789', 'KEB하나은행'
);
-- 직원 18
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '김도현', 'M', '1995-04-05', '010-5678-9012', 'kimdohyun@example.com', '서울시 동작구', 'Y',
'서울시 동작구 신대방동 234', '07234', 'password216', 'PS004', 'RK005', 'https://i.ibb.co/kyJ8V5B/employee28-jpg.png', 'D017', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'901-234-567890', '신한은행'
);
-- 직원 19
INSERT INTO TBL_EMPLOYEE (
EMP_NO, EMP_NAME, EMP_GENDER, EMP_BIRTH, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_EMPLOYMENT,
EMP_DETAILADDRESS, EMP_POSTCODE, EMP_PASSWORD, EMP_AUTH, EMP_RANK, EMP_PROFILE, DEPT_CODE, CREATE_DATE,
MODIFY_DATE, CREATER, MODIFIER, USE_YN, AC_NO, AC_BANK
) VALUES (
EMP_NO_SEQ.NEXTVAL, '이호준', 'M', '1988-03-12', '010-6789-0123', 'leehj@example.com', '서울시 강북구', 'Y',
'서울시 강북구 미아동 890', '06345', 'password217', 'PS005', 'RK006', 'https://i.ibb.co/d7T0GZr/employee29-jpg.png', 'D018', SYSDATE, SYSDATE, 1003, 1003, 'Y',
'234-567-890123', '우리은행'
);

COMMIT;