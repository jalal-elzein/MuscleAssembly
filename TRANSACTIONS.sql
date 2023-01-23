-- SELECT SUM (E_Salary) * 100 AS PERCENTAGE
-- FROM EMPLOYEE JOIN BRANCH ON E_BRANCH_ID = B_ID
-- WHERE B_ID < 5 AND E_Gender = 'male';

-- UPDATE EMPLOYEE 
-- SET E_Salary = CASE
-- WHEN E_Salary < 5000 THEN E_Salary + 1000
-- WHEN E_Salary >= 5000 THEN E_Salary + 550
-- END;

-- UPDATE SCHEDULE
-- SET Sched_Start_Time = CASE
-- WHEN SCHED_ID < 20 THEN Sched_Start_Time AT TIME ZONE 'UTC'
-- WHEN SCHED_ID > 20 THEN Sched_Start_Time
-- END;
-- UPDATE SCHEDULE
-- SET Sched_End_Time = CASE
-- WHEN SCHED_ID < 20 THEN Sched_End_Time AT TIME ZONE 'UTC'
-- WHEN SCHED_ID > 20 THEN Sched_End_Time
-- END;

-- CREATE VIEW FEMALE AS 
-- SELECT M_Username, M_FName, M_LName
-- FROM MEMBER
-- WHERE M_Gender = 'F';
-- SELECT * FROM FEMALE;

-- SELECT DISTINCT F_ID
-- FROM PAYS 
-- WHERE F_ID IN (
--     SELECT F_ID 
--     FROM FEE
--     WHERE F_Paid = 1
-- ) AND F_ID IN (
--     SELECT F_ID
--     FROM FEE
--     WHERE F_Pay_Method = 0
-- );
SELECT F_ID AS Paid_Fees
FROM FEE
WHERE F_Paid = 1 AND F_Pay_Method = 0;

SELECT E_FNAME, E_LName, E_Salary AS GREATER_THAN_AVG_SALARY
FROM EMPLOYEE
WHERE E_Salary > (
    SELECT AVG(E_Salary)
    FROM EMPLOYEE
);

-- SELECT E_FNAME, E_LName
-- FROM EMPLOYEE
-- WHERE EXISTS (
--     SELECT *
--     FROM BRANCH
--     WHERE E_Super_ID = B_Mng_ID
-- ) AND EXISTS (
--     SELECT * 
--     FROM BRANCH
--     WHERE B_ID = E_BRANCH_ID
-- );

-- SELECT C_Name, C_Capacity
-- FROM CLASS
-- ORDER BY (
--     CASE WHEN C_Capacity < 20 
--     THEN C_Capacity + 5
--     END
-- );



-- UPDATE MEMBERSHIP
-- SET MS_Type = CASE WHEN MS_Username IN (
--     SELECT BC_M_ID
--     FROM BODY_COMPOSITION
--     WHERE BC_PBodyFat > 20
-- ) AND MS_Type = 'Bronze' 
-- THEN 'Silver'
-- ELSE MS_Type
-- END;

-- SELECT M_LName, M_FName
-- FROM MEMBER JOIN BRANCH ON M_Branch_ID = B_ID
-- WHERE M_FName LIKE '%ra' AND B_ID = 8;

-- SELECT U_MEMBER_ID
-- FROM USES, EQUIPMENT
-- WHERE U_EQUIPMENT_ID = Eq_ID AND Eq_Name = 'Row Machine';


UPDATE SELLABLE
SET SELL_Price = CASE 
WHEN SELL_Qnt_Storage >= 300
THEN SELL_Price * 0.4
ELSE SELL_Price
END;