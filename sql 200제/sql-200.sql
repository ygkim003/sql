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















