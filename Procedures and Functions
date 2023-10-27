PROCEDURES

-- Example 1: Display a variable
-- This procedure displays a variable.
-- Input: Name (vname)
-- Output: Name is printed to the console.
DECLARE
    vname VARCHAR2(30) := 'Maryam';
BEGIN
    DBMS_OUTPUT.put_line(vname); -- Display the variable
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(SQLERRM); -- Display the SQL ERROR Message
END; -- End of the execution section is MANDATORY

-- Example 2: Display a welcome message
-- This procedure displays a welcome message.
-- Input: First name (vfname), Last name (vlname)
-- Output: Welcome message is printed to the console.
DECLARE
    vfname VARCHAR2(20) := 'Maryam';
    vlname VARCHAR2(20) := 'TRIKI';
    my_str VARCHAR2(100) := 'Welcome to Oracle: ';
BEGIN
    DBMS_OUTPUT.put_line(my_str || vfname || ' ' || vlname);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(SQLERRM);
END;

-- Example 3: Retrieve employee details
-- This procedure retrieves employee details based on the employee ID and displays them.
-- Input: Employee ID (vemp_id)
-- Output: Employee details are printed to the console.
DECLARE
    vemp_id NUMBER := 123;
    vemp_fname VARCHAR2(40);
    vemp_lnmae VARCHAR2(40);
    vemp_email VARCHAR2(50);
    vemp_phone VARCHAR2(50);
    vemp_job_id VARCHAR2(50);
BEGIN
    SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, JOB_ID
    INTO vemp_fname, vemp_lnmae, vemp_email, vemp_phone, vemp_job_id
    FROM oehr_employees
    WHERE EMPLOYEE_ID = vemp_id;
    DBMS_OUTPUT.put_line('The employee with Name: ' || vemp_fname || ' ' || vemp_lnmae || ' has an email: ' || vemp_email || ' and phone: ' || vemp_phone || ' and job id ' || vemp_job_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('Employee with that ID does not exist. Please verify the ID again!');
END;

-- Example 4: Retrieve customer details
-- This procedure retrieves customer details based on the customer ID and displays them.
-- Input: Customer ID (vcus_id)
-- Output: Customer details are printed to the console.
DECLARE
    vcus_fname VARCHAR2(40);
    vcus_lname VARCHAR2(40);
    vcus_id NUMBER := 111327;
BEGIN
    SELECT CUST_FIRST_NAME, CUST_LAST_NAME
    INTO vcus_fname, vcus_lname
    FROM oehr_customers
    WHERE CUSTOMER_ID = vcus_id;
    DBMS_OUTPUT.put_line('Name: ' || vcus_fname || ' ' || vcus_lname);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('There is no such a customer'); -- User-defined error message
END;

-- Example 5: Retrieve employee details by ID
-- This procedure retrieves employee details based on the employee ID and displays them.
-- Input: Employee ID (empid)
-- Output: Employee details are printed to the console.
DECLARE
    vemp_id NUMBER := 123;
    vemp_fname VARCHAR2(40);
    vemp_lnmae VARCHAR2(40);
    vemp_email VARCHAR2(50);
    vemp_phone VARCHAR2(50);
    vemp_job_id VARCHAR2(50);
BEGIN
    SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, JOB_ID
    INTO vemp_fname, vemp_lnmae, vemp_email, vemp_phone, vemp_job_id
    FROM oehr_employees
    WHERE EMPLOYEE_ID = vemp_id;
    DBMS_OUTPUT.put_line('The employee with Name: ' || vemp_fname || ' ' || vemp_lnmae || ' has an email: ' || vemp_email || ' and phone: ' || vemp_phone || ' and job id ' || vemp_job_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('Employee with that ID does not exist. Please verify the ID again!');
END;

-- Example 6: Display a message with a variable
-- This procedure displays a message with a variable.
-- Input: Name (vfname)
-- Output: Message with the name is printed to the console.
DECLARE
    a VARCHAR2(10) := 'Welcome';
    b VARCHAR2(30) := ' to Oracle';
    vfname VARCHAR2(40);
BEGIN
    SELECT CUST_FIRST_NAME
    INTO vfname
    FROM oehr_customers
    WHERE CUSTOMER_ID = 102;
    DBMS_OUTPUT.put_line(a || b || ' ' || vfname);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line('Something wrong happened');
END;



-------------
-- Procedure Example 7: Retrieving customer details and calling a procedure
-- This procedure retrieves customer details and calls another procedure with the fetched details.
-- Input: None
-- Output: Calls Welcome_Message_Proc with customer details.
DECLARE
    vfirstname VARCHAR2(40);
    vlastname VARCHAR2(40);
BEGIN
    SELECT CUST_FIRST_NAME, CUST_LAST_NAME
    INTO vfirstname, vlastname
    FROM oehr_customers
    WHERE customer_ID = 102;
    Welcome_Message_Proc(vfirstname, vlastname);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(SQLERRM);
END;

-- Procedure Example 14: An Employee Details Procedure
-- This procedure retrieves employee details based on the employee ID and displays them.
-- Input: Employee ID (empid)
-- Output: Employee details are printed to the console.
CREATE OR REPLACE PROCEDURE Employee_Details(empid IN NUMBER)
AS
    -- Declarations variables if needed
    vfname VARCHAR2(40);
    vlname VARCHAR2(40);
    vemail VARCHAR2(40);
    vphone VARCHAR2(40);
    vsalary NUMBER;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, SALARY
    INTO vfname, vlname, vemail, vphone, vsalary
    FROM oehr_employees
    WHERE EMPLOYEE_ID = empid;
    DBMS_OUTPUT.put_line('The employee with id: ' || empid || ' is ' || vfname || ' ' || vlname || ' has an email address: ' || vemail || ' and phone: ' || vphone || ' and has a salary: ' || vsalary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('No such an employee');
END;

-- Procedure Example 8: An Employee Details Procedure with Error Handling
-- This procedure retrieves employee details and calls another procedure with the fetched details.
-- Input: None
-- Output: Calls Welcome_Message_Proc with employee details.
DECLARE
    vfirstname VARCHAR2(40);
    vlastname VARCHAR2(40);
BEGIN
    SELECT CUST_FIRST_NAME,



-- Procedure Example 9: All_Employee_Details
-- This procedure retrieves all employee details based on the employee ID and displays them.
-- Input: Employee ID (empid)
-- Output: Employee details are printed to the console.
CREATE OR REPLACE PROCEDURE All_Employee_Details(empid IN NUMBER)
IS
    -- Declare variables if needed
    vemployee oehr_employees%ROWTYPE; -- A variable to store a whole record (row)
BEGIN
    SELECT *
    INTO vemployee
    FROM oehr_employees
    WHERE EMPLOYEE_ID = empid;
    DBMS_OUTPUT.put_line('The employee with id: ' || vemployee.EMPLOYEE_ID || ' is ' || vemployee.FIRST_NAME || ' ' || vemployee.LAST_NAME || ' has an email address: ' || vemployee.email || ' and phone: ' || vemployee.PHONE_NUMBER || ' and has a salary: ' || vemployee.salary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('No such an employee');
END;

-- Anonymous Block Example
-- An anonymous block is a PL/SQL block that does not have a name and is not stored in the database.
-- It can contain declarations, executable statements, and exception handlers.
-- This block demonstrates the use of a procedure to add a new record to the oehr_jobs table.
-- Input: None
-- Output: New record is inserted into the oehr_jobs table.
BEGIN
    -- Create a procedure to add a new record in oehr_jobs
    -- id: Cust_Rep
    -- Title: Customer Representative
    -- Min salary: 2800
    -- Max salary: 4000
    CREATE OR REPLACE PROCEDURE New_Job_Insert_proc(jobid oehr_jobs.JOb_id%TYPE, jtitle oehr_jobs.JOb_Title%TYPE, minimum_sal OEHR_JOBS.MIN_SALARY%TYPE, maximum_sal OEHR_JOBS.MAX_SALARY%TYPE)
    IS
    BEGIN
        INSERT INTO oehr_jobs(JOb_id, JOb_Title, MIN_SALARY, MAX_SALARY)
        VALUES (jobid, jtitle, minimum_sal, maximum_sal);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.put_line(SQLERRM);
    END;

    DECLARE
        vjid VARCHAR2(20) := 'Cust_repr';
        vjtitle VARCHAR2(35) := 'Customer Representative';
        vminsal NUMBER := 2800;
        vmaxsal NUMBER := 4000;
    BEGIN
        New_Job_Insert_proc(vjid, vjtitle, vminsal, vmaxsal);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.put_line('insertion failed');
    END;
END;




-----------//-----------------------------------------------//-----------------------------------------------//-----------------------------------------------//-----------------------------------------------//-----------------------------------------------//

FUNCTIONS - 



-- Example 1: Function that adds two numbers
CREATE OR REPLACE FUNCTION add_func(num1 NUMBER, num2 NUMBER)
RETURN NUMBER
IS
    var_result NUMBER(8);
BEGIN
    var_result := num1 + num2;
    RETURN var_result;
END;


--Example 2: Function that returns the maximum of two given values
CREATE OR REPLACE FUNCTION findMax(num1 NUMBER, num2 NUMBER) RETURN NUMBER IS
    var_result NUMBER;
BEGIN
    IF num1 > num2 THEN
        var_result := num1;
    ELSE
        var_result := num2;
    END IF;
    RETURN var_result;
END;


--Example 3: Function to find the total number of customers
CREATE OR REPLACE FUNCTION totalCustomers RETURN NUMBER
IS
    total_customer NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO total_customer FROM oehr_customers;
    RETURN total_customer;
END;


--Example 4: Recursive function to compute factorial
CREATE OR REPLACE FUNCTION factorial_func(a NUMBER) RETURN NUMBER IS
    vresult NUMBER;
BEGIN
    IF a = 0 THEN
        vresult := 1;
    ELSE
        vresult := a * factorial_func(a - 1);
    END IF;
    RETURN vresult;
END;


--Example 5: Function to find the maximum salary based on a job ID
CREATE OR REPLACE FUNCTION findMaxsal(jobid IN VARCHAR2) RETURN NUMBER
IS
    vresult NUMBER := 0;
BEGIN
    SELECT MAX_SALARY INTO vresult FROM oehr_jobs WHERE job_id = jobid;
    RETURN vresult;
END;


--Example 6: Function to handle exceptions when finding maximum salary by job ID
CREATE OR REPLACE FUNCTION findMaxsal(jobid IN VARCHAR2) RETURN NUMBER
IS
    vresult NUMBER := 0; -- Initial value/Default exception value
BEGIN
    SELECT MAX_SALARY INTO vresult FROM oehr_jobs WHERE job_id = jobid;
    RETURN vresult;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('No such job ID, please try again!' || SQLERRM);
        RETURN 200;
END;


--Example 7: Function to increase the salary based on the job title
CREATE OR REPLACE FUNCTION IncreaseSalary(empid NUMBER) RETURN NUMBER 
IS
    vresult NUMBER;
    vjobid VARCHAR2(10);
    vsal NUMBER;
BEGIN
    SELECT job_id INTO vjobid FROM oehr_employees WHERE employee_id = empid;
    SELECT salary INTO vsal FROM oehr_employees WHERE employee_id = empid;

    IF vjobid = 'AD_PRES' THEN
        vresult := vsal * 1.1;
    ELSIF vjobid = 'AD_VP' THEN
        vresult := vsal * 1.08;
    ELSIF vjobid = 'IT_PROG' THEN
        vresult := vsal * 1.15;
    ELSE
        vresult := vsal;
    END IF;
    RETURN vresult;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line(SQLERRM);
        RETURN 0;
END;
