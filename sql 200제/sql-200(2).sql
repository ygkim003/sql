-- 초보자를 위한 SQL 200제(PL/SQL)
-- ORACLE DB 기준으로 쓰여져 있음 

-- 001 테이블에서 특정 열 선택

SELECT empno, ename, sal
FROM emp
;

-- 002 테이블에서 모든 열 출력

SELECT *
FROM emp
;

-- 003 컬럼 별칭을 사용하여 출력되는 컬럼명 사용하기
-- Alias = as

SELECT empno AS "사원", ename AS "사원 이름", sal*12 AS "월급"
FROM emp
ORDER BY "월급" DESC
;

-- 004 연결 연산자 사용
-- ||

SELECT ename || '의 월급은 ' || sal || '입니다' AS 월급정
FROM emp 
;

-- 005 중복된 데이터를 제거하여 출력 
-- DISTINCT

SELECT DISTINCT JOB 
FROM emp
;


-- 006 데이터를 정렬해서 출력
-- ORDER BY, asc(오름차순) desc(내림차순)

SELECT ename, sal
FROM emp
ORDER BY sal DESC 
;

-- detpno 부터 오름차순으로 정렬 후
-- detpno 같은 계급 사이에서 sal 을 내림차순으로 정렬 
SELECT ename, deptno, sal
FROM emp
ORDER BY deptno, sal DESC
;


-- 007 WHERE 절 숫자 데이터 검색 
-- WHERE

SELECT ename, sal, job
FROM emp
WHERE sal = 3000
;

-- 비교 연산자
-- BETWEEN AND, LIKE(문자 검색), IS NULL, IN
SELECT ename, sal, job
FROM emp
WHERE (sal BETWEEN 3000 AND 10000)
;

SELECT * 
FROM emp
WHERE (mgr IS NULL) OR (comm IS NULL )
;


-- 008 WHERE 절 문자와 날짜 검색

SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE ename='SCOTT'
;

SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE hiredate = '81-11-17'
;


-- 009 산술 연산자 배우기
-- *, /, +, - 

-- Null 값은 연사을 하여도 결과가 NULL
SELECT ename, sal * 12 AS 연봉, sal + comm
FROM emp
;

-- oracle db NVL(), sqlite ifnull()
SELECT ename, sal * 12 AS 연봉, IFNULL(sal + comm, 0)
FROM emp
;


-- 010 비교연산자
-- >, <, >=, <=, =, !=, <>, ^=
SELECT ename, sal, job, deptno
FROM emp
WHERE sal <= 1200
;

-- <> 같지 않다 
SELECT ename, sal, job, deptno 
FROM emp
WHERE deptno <> 10
;


-- 011 비교 연산자
-- BETWEEN 하한값 AND 상한
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY sal DESC 
;

SELECT ename, sal
FROM emp
WHERE (sal >= 1000 AND sal <= 3000)
ORDER BY sal DESC
;

-- 012 비교연산자 LIKE
-- LIKE : 문자 패턴 검색

-- % 임의의 문자 0개 이상
SELECT ename, sal
FROM emp
WHERE ename LIKE 'S%'
;

-- _ 임의의 문자 한개 
SELECT ename, sal
FROM emp
WHERE ename LIKE '____'
;


-- 013 비교 연산자 
-- IS NULL

-- NULL 은 IS 통해서 검색된다
SELECT ename, sal, comm
FROM emp
WHERE comm IS NULL
;

-- = 같다로는 검색 불가
SELECT ename, sal, comm
FROM emp
WHERE comm = NULL
;



-- 014 비교 연산자 
-- IN

SELECT ename, sal, job
FROM emp
WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER')
;


SELECT ename, sal, job
FROM emp
WHERE job NOT IN ('SALESMAN', 'ANALYST', 'MANAGER')
;


-- 015 논리연산자
-- AND, OR, NOT

SELECT ename, sal, job
FROM emp
WHERE job='SALESMAN' AND sal >= 1000
;

-- 016 대소문자 변환 함수
-- UPPER, LOWER, INITCAP(SQLITE 미지원)
-- INITCAP ( 첫글자대문자 ) 

SELECT UPPER(ename), LOWER(ename)
FROM emp
;


-- 017 문자에서 특정 철자 추출
-- SUBSTR(문자열, 시작위치 추출개수)

SELECT SUBSTR(ename, 1, 3) 
FROM emp
;


-- 018문자열의 길이를 출력
-- LENGTH
-- LENGTHB() - 바이트의 길이를 반환 

SELECT ename, LENGTH (ename)
FROM emp
;


-- 019 문자에서 특정 철자의 위치 출력 
-- INSTR 

SELECT INSTR('SMITH', 'M')
FROM emp
;

-- SUBSTR( 문자열, 시작점, 출력 문자 개수)에서 
-- 출력문자개수 없으면 끝까지 출력 
SELECT SUBSTR('dudrjs145@naver.com', INSTR('dudrjs145@naver.com', '@') + 1)
;

SELECT TRIM(SUBSTR('dudrjs145@naver.com', INSTR('dudrjs145@naver.com', '@') + 1), '.com')
;


-- 020 특정 철자를 다른 철자로 변경 
-- REPLACE ( string,pattern,replacement )

SELECT ename, REPLACE (sal, 0, '*')
FROM emp
;


-- 021 특정 철자를 N개 만큼 채우기
-- LPAD, RPAD
-- 문자열만 됨 

SELECT ename, LPAD (sal::VARCHAR, 10, '*') AS sal1, RPAD(sal::VARCHAR, 10, '*') AS sal2
FROM emp
;

-- 022 특정 철자 잘라내기
-- TRIM, LTRIM, RTRIM

SELECT 
    'SASAS', 
    LTRIM('SASAS', 'S'), 
    RTRIM('SASAS', 'S'), 
    TRIM('SASAS', 'S')
;


-- 023 반올림해서 출력
-- ROUND( 숫자, 자릿수 )
-- 자릿수 양수 - 소숫점,   음수 - 1의자리이

SELECT ename, ROUND(sal, -3) AS sal1
FROM emp
ORDER BY sal1 ASC 
;


-- 024 숫자를 버리고 출력 
-- TRUNC 

-- 2 면 . 기준 오른쪽 2
SELECT '876.567' AS num, TRUNC('876.567', 2) 
;

-- -2 면 . 기준 왼쪽 2
SELECT '876.567' AS num, TRUNC('876.567', -2) 
;


-- 025 나눈 나머지 값 출력 
-- MOD 

SELECT ename, MOD (sal, 11)
FROM emp
;

-- 026 날짜 간 개월 수 출력 
-- MONTHS_BETWEEN, POSTGRESQL 미지원 

-- 최신날짜 - 옛날날짜 로 사용 
SELECT ename, hiredate, current_date, current_date-hiredate 
FROM emp
;


-- 027 개월 수 더한 날짜 출력하기
-- ADD_MONTHS 

SELECT ename, hiredate, date ('1989-03-03'), (hiredate+ 100) AS add100
FROM emp 
;


SELECT ename, hiredate, hiredate + INTERVAL '2 year 1 month 1 h 33m'
FROM emp 
;













