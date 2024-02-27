CREATE DATABASE ICIC_BANK;
use ICIC_BANK ;


CREATE TABLE account_type(account_no INT PRIMARY KEY,
                         type_account VARCHAR(255) NOT NULL,
                         manager_id INT,
                         department_name VARCHAR(200),
                         opening_date DATE );
                         
INSERT INTO account_type(account_no,type_account,manager_id,department_name,Opening_Date) 
VALUES (12345, "Saving", 20, "Account", '23-04-03'), 
(67899, "loan", 21, "Loan", '24-05-04'), 
(10112, "Saving", 22, "HR", '2006-01-04'), 
(13145, "loan", 23, "Admin", '2003-04-23'),  
(15167, "current", 24, "Sales", '2004-05-24'),  
(18190, "business", 25, "Security", '2006-01-04'),  
(20210, "loan", 26, "Account", '2003-04-23'),  
(22230, "Saving", 27, "Loan", '2004-05-24'),  
(24250, "loan", 28, "HR", '2006-01-04'),  
(26270, "current", 29, "Admin", '2003-04-23'),  
(28290, "business", 30, "Sales", '2004-05-24'),  
(30310, "current", 31, "Security", '2006-01-04'),  
(32330, "Saving’", 32, "Account", '2003-04-23'),  
(34350, "loan", 33, "Loan", '2004-05-24'),  
(36370, "current", 34, "HR", '2006-01-04'),  
(38390, "current", 35, "Admin", '2003-04-23'),  
(40410, "business", 36, "Sales", '2004-05-24'),  
(42430, "loan", 37, "Security", '2006-01-04'),  
(44450, "Saving", 38, "Account", '2003-04-23'),  
(46470, "loan", 39, "Loan", '2004-05-24'), 
(48490, "Saving", 40, "HR", '2006-01-04');                   
                  
select * from account_type;


CREATE TABLE department (department_id INT PRIMARY KEY, 
					department_name VARCHAR(255) NOT NULL, 
					manager_id INT (30), 
					employee_id INT (30), 
					account_no INT (40));
alter table Department
add constraint fk2 foreign key (Account_no) references Customer(Account_no);                      
                    
INSERT INTO department(department_id,department_name,manager_id,employee_id,account_no) 
VALUES (1, "Account", 20, 50, 12345), 
		(8, "Loan", 21, 51, 67899), 
		(11, "HR", 22, 52, 10112), 
		(16, "Admin", 23, 53, 13145),  
		(19, "Sales", 24, 54, 15167), 
		(21, "Security", 25, 55, 18190); 
        
      
select * from department; 

CREATE TABLE BankDetails (Branch_code INT (100) PRIMARY KEY, 
							Address VARCHAR (80), 
							Department_id INT (29), 
							Branch_name VARCHAR (40), 
							State VARCHAR(30));
alter table BankDetails 
add constraint fk8 foreign key (Department_id ) references Department (Department_id);                              
                            
insert into BankDetails (Branch_code,Address,Department_id,Branch_name,State) 
values (100, "Ngapur", 1, "ICIC_N", "Maharashtra"), 
(101, "pune", 1, "ICIC_P", "Maharashtra"), 
(102, "Mumbai", 1, "ICIC_M", "Maharashtra"), 
(103, "delhi", 1, "ICIC_D", "DEL"), 
(104, "Mumbai", 1, "ICIC_M", "Maharashtra"), 
(105, "delhi", 1, "ICIC_D", "DEL"), 
(106, "Ngapur", 1, "ICIC_N", "Maharashtra"), 
(107, "pune", 8, "ICIC_P", "Maharashtra"), 
(108, "Mumbai", 8, "ICIC_M", "Maharashtra"), 
(109, "Ngapur", 8, "ICIC_N", "Maharashtra"), 
(110, "pune", 11, "ICIC_P", "Maharashtra"), 
(111, "Mumbai", 11, "ICIC_M", "Maharashtra"), 
(112, "delhi", 11, "ICIC_D", "DEL"), 
(113, "Ngapur", 11, "ICIC_N", "Maharashtra"), 
(114, "pune", 11, "ICIC_P", "Maharashtra"), 
(115,"Mumbai", 16, "ICIC_M", "Maharashtra"), 
(116, "Ngapur", 16, "ICIC_N", "Maharashtra"), 
(117, "pune", 16, "ICIC_P", "Maharashtra"), 
(118, "Mumbai", 19, "ICIC_M", "Maharashtra"), 
(119, "delhi", 19, "ICIC_D", "DEL"), 
(120, "Pune", 21, "ICIC_P", "Maharashtra"); 

select * from BankDetails;   

CREATE TABLE job_details ( job_id varchar (60) PRIMARY KEY, 
							department_id INT, 
							branch_code INT);

alter table Job_details
add constraint fk4 foreign key (Department_id) references Department(Department_id);
alter table Job_details
add constraint fk5 foreign key (Branch_code)  references BankDetails(Branch_code);

INSERT INTO Job_Details (Job_id, Department_id, Branch_code) 
VALUES ("ST_CLERK", 1, 101), 
		("ST_MAN", 8, 108), 
		("FI_ACCOUNT", 11, 113),  
		("SA_REP", 19, 118); 
        
        
select * from job_details;      

CREATE TABLE employees (employee_id INT PRIMARY KEY, 
						first_name VARCHAR(255) NOT NULL, 
						department_id INT, 
						manager_id INT, 
						job_id VARCHAR(200), 
						email VARCHAR(100), 
						hire_date DATE, 
						phone_no VARCHAR(33), 
						salary DECIMAL(10,2));
                        
alter table Employees
add constraint fk6 foreign key (Department_id) references   Department (Department_id) ; 
alter table  Employees
add constraint fk7 foreign key (Job_id) references  Job_Details  (Job_id) ;                      
                            
insert into Employees(Employee_id,First_name,Department_id,Manager_id,Job_id,Email,Hire_date,Phone_no,Salary) 
values (50, "Samuel", 1, 20, "ST_CLERK", "SMCCAIN", '2007-11-23', "650.505.1876", 3800), 
		(51, "Allan", 8, 21, "ST_CLERK", "SSEWALL", '2004-01-30', "650.505.2876", 3600), 
		(52, "Irene", 11, 22, "ST_CLERK", "SSTILES", '2004-03-04', "650.505.3876", 2900),  
		(53, "Kevin", 16, 23, "ST_CLERK", "STOBIAS", '2004-08-01', "650.505.4876", 2500), 
		(54, "Julia", 19, 24, "ST_CLERK", "SVOLLMAN", '2005-03-10', "650.501.1876", 4000), 
		(55, "Donald", 21, 25, "ST_CLERK", "TFOX", '2005-12-15', "650.501.2876", 3900),  
		(56, "Christopher", 1, 26, "ST_CLERK", "TGATES", '2006-11-03', "650.501.3876", 3200),  
		(57, "TJ", 8, 27, "ST_MAN", "TJOLSON", '2005-11-11', "650.501.4876", 2800), 
		(58, "Lisa", 11, 28, "ST_MAN", "TRAJS", '2007-03-19', "650.507.9811", 3100),  
		(59, "Karen", 16, 29, "ST_MAN", "VJONES", '2008-01-24', "650.507.9822", 3000),  
		(60, "Valli", 19, 30, "ST_MAN", "VPATABAL", '2008-02-23', "650.507.9833", 2600),  
		(61, "Joshua", 21, 31, "ST_MAN", "WGIETZ", '2003-05-01', "650.507.9844", 6400), 
		(62, "Randall", 1, 32, "FI_ACCOUNT", "WSMITH", '2005-10-10', "515.123.4444", 6200),  
		(63, "Hazel", 8, 33, "FI_ACCOUNT", "WTAYLOR", '2007-11-16', "515.123.5555", 11500),  
		(64, "Luis", 11, 34, "FI_ACCOUNT", "JNAYER", '2005-07-16', "603.123.6666", 10000),  
		(65, "Trenna", 16, 35, "FI_ACCOUNT", "JPATEL", '2006-09-28', "515.123.7777", 9600),  
		(66, "Den", 19, 36, "FI_ACCOUNT", "JRUSSEL", '2007-01-14', "515.123.8888", 7400),  
		(67, "Michael", 21, 37, "SA_REP", "JSEO", '2008-04-08', "515.123.8080", 7300),  
		(68, "John", 1, 38, "SA_REP", "JTAYLOR", '2005-08-20', "011.44.1346.329268", 6100),  
		(69, "Nandita", 8, 39, "SA_REP", "JWHALEN", '2005-10-30', "011.44.1346.529268", 11000), 
		(70, "Ismael", 11, 40, "SA_REP", "KCHUNG", '2005-02-16', "011.44.1346.52", 8800); 
        
select * from Employees;


CREATE TABLE Customer ( Account_No INT PRIMARY KEY, 
						First_Name VARCHAR(255), 
						City VARCHAR(255), 
						Branch_code INT, 
						Employee_id INT, 
						Phone_no VARCHAR(45), 
						ATM_NO VARCHAR(50) UNIQUE, 
						Exp_date DATE, 
						Pin_No INT UNIQUE); 
alter table Customer
add constraint fk foreign key (branch_code) references bankdetails(Branch_code ) ;
alter table Customer
add constraint fk1 foreign key (employee_id) references employees(employee_id);                        
insert into Customer(Account_No,First_Name,City,Branch_code,Employee_id,Phone_no,ATM_NO,Exp_date,Pin_No) 
Values (12345, "Samuel", "Ngapur", 100, 50, "650.505.1876", 423705689, '2006-04-23', 5689), 
		(67899, "Allan", "pune", 101, 51, "650.505.2876", 423568971, '2007-05-24', 8971), 
		(10112, "Irene", "Mumbai", 102, 52, "650.505.3876", 423432253, '2008-01-04', 12253),  
		(13145, "Kevin", "delhi", 103, 53, "650.505.4876", 423295535, '2006-01-24', 15535),  
		(15167, "Julia", "Mumbai", 104, 54, "650.501.1876", 423158817, '2006-02-23', 18817),  
		(18190, "Donald", "delhi", 105, 55, "650.501.2876", 423022099, '2007-06-21', 22099),  
		(20210, "Christopher", "Ngapur", 106, 56, "650.501.3876", 422885381, '2008-02-03', 25381), 
		(22230, "TJ", "pune", 107, 57, "650.501.4876", 422748663, '2004-01-27', 28663),  
		(24250, "Lisa", "Mumbai", 108, 58, "650.507.9811", 422611945, '2005-02-20', 31945),  
		(26270, "Karen", "Ngapur", 109, 59, "650.507.9822", 422475227, '2006-06-24', 35227),  
		(28290, "Valli", "pune", 110, 60, "650.507.9833", 422338509, '2007-02-07', 38509),  
		(30310, "Joshua", "Mumbai", 111, 61, "650.507.9844", 422201791, '2008-01-13', 41791),  
		(32330, "Randall", "delhi", 112, 62, "515.123.4444", 422065073, '2003-09-17', 45073),  
		(34350, "Hazel", "Ngapur", 113, 63, "515.123.5555", 421928355, '2004-02-17', 48355),  
		(36370, "Luis", "pune", 114, 64, "603.123.6666", 421791637, '2005-08-17', 51637),  
		(38390, "Trenna", "Mumbai", 115, 65, "515.123.7777", 421654919, '2002-06-07', 54919),  
		(40410, "Den", "Ngapur", 116, 66, "515.123.8888", 421518201, '2002-06-07', 58201),  
		(42430, "Michael", "pune", 117, 67, "515.123.8080", 421381483, '2002-06-07', 61483),  
		(44450, "John", "Mumbai", 118, 68, "011.44.1346.329268", 421244765, '2002-06-07', 64765),  
		(46470, "Nandita", "delhi", 119, 69, "011.44.1346.529268", 421108047, '2008-04-21', 68047), 
		(48490, "Ismael", "Pune", 120, 70, "011.44.1346.52", 420971329, '2005-03-11', 71329); 
        
select * from Customer;






                        

                  
                         
