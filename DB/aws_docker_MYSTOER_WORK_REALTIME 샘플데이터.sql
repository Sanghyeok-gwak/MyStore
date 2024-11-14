BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO TBL_WORK_REALTIME
        (
            EMP_NO,
            WORK_LATE,
            WORK_FAST_END,
            WORK_ABSENCE,
            CREATE_DATE,
            MODIFIER,
            MODIFIER_DATE,
            CREATER
        )
        VALUES
        (
            1000 + i,                       -- 사원번호: 1001~1030
            '2024-' || TO_CHAR(i, 'FM00'),  -- WORK_LATE: 고유한 값 (2024-01, 2024-02, ...)
            '15',                           -- 부여 연차 갯수: 15
            '0',                            -- 실 사용 갯수: 초기값 0
            TO_DATE('2024-01-01', 'YYYY-MM-DD'),  -- 생성일: 2024-01-01
            NULL,                           -- 수정자: NULL
            NULL,                           -- 수정일: NULL
            1003                            -- 생성자: 1003
        );
    END LOOP;
    COMMIT;
END;
/