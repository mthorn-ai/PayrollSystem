/* ***NOTE*** THIS DATABASE VARIES SLIGHTLY FROM WHAT I TURNED IN FOR THE OTHER DELIVERABLES, PLEASE CHECK THE README FILE IN THIS ZIP FOR MORE INFO */

/* table creation */
create table employer(employer_id int not null, employer_name varchar(128), employee_num int, primary key(employer_id));
create table salary(sal_id int not null, min_sal int, max_sal int,emp_sal int, primary key(sal_id));
create table job_pos(pos_id int not null, sal_id int not null, dept varchar(64), pos_name varchar(64),primary key(pos_id), foreign key(sal_id) references salary(sal_id));
create table employee(employee_id int not null, pos_id int not null, employee_name varchar(128), emp_email varchar(64), emp_address varchar(64), DOB date, primary key(employee_id), foreign key(pos_id) references job_pos(pos_id));
create table employs(employer_id int not null, employee_id int not null, foreign key(employer_id) references employer(employer_id), foreign key(employee_id) references employee(employee_id));
create table payroll(pay_id int not null, sal_id int not null, pay_date date, bonus int, gross_pay float, tax_deductions float, final_pay float, primary key(pay_id), foreign key(sal_id) references salary(sal_id));
create table receives(employee_id int not null, pay_id int not null, amount int, foreign key(employee_id) references employee(employee_id), foreign key(pay_id) references payroll(pay_id));

/* data insertion */
insert into receives(employee_id,pay_id,amount) values (101,111000,1343.54);
insert into receives(employee_id,pay_id,amount) values (102,111001,1460.23);
insert into receives(employee_id,pay_id,amount) values (103,111002,1498.08);
insert into receives(employee_id,pay_id,amount) values (104,111003,2217.15);
insert into receives(employee_id,pay_id,amount) values (105,111004,2128.84);
insert into receives(employee_id,pay_id,amount) values (106,111005,2696.54);
insert into receives(employee_id,pay_id,amount) values (107,111006,1759.42);
insert into receives(employee_id,pay_id,amount) values (108,111007,1737.77);
insert into receives(employee_id,pay_id,amount) values (109,111008,1977.46);
insert into receives(employee_id,pay_id,amount) values (110,111009,2302.31);

insert into employs(employer_id,employee_id) values (10,101);
insert into employs(employer_id,employee_id) values (10,102);
insert into employs(employer_id,employee_id) values (10,103);
insert into employs(employer_id,employee_id) values (11,104);
insert into employs(employer_id,employee_id) values (11,105);
insert into employs(employer_id,employee_id) values (11,106);
insert into employs(employer_id,employee_id) values (12,107);
insert into employs(employer_id,employee_id) values (12,108);
insert into employs(employer_id,employee_id) values (12,109);
insert into employs(employer_id,employee_id) values (12,110);

insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111000,10001,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),100,1538.46,294.92,1343.54);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111001,10001,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),50,1730.76,320.53,1460.23);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111002,10001,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),0,1826.92,328.84,1498.08);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111003,10002,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),300,2403.84,486.69,2217.15);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111004,10002,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),0,2596.15,467.31,2128.84);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111005,10002,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),500,2788.46,591.92,2696.54);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111006,10003,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),0,2145.63,386.21,1759.42);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111007,10003,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),100,2019.23,381.46,1737.77);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111008,10003,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),200,2211.53,434.07,1977.46);
insert into payroll(pay_id,sal_id,pay_date,bonus,gross_pay,tax_deductions,final_pay) values (111009,10003,STR_TO_DATE('04/18/2023', '%m/%d/%Y'),500,2307.69,505.38,2302.31);

insert into employer(employer_id,employer_name,employee_num) values (10,"John Doe",9);
insert into employer(employer_id,employer_name,employee_num) values (11,"Eric Linder",8);
insert into employer(employer_id,employer_name,employee_num) values (12,"Jose Abreu",8);

insert into salary(sal_id,min_sal,max_sal) values (10001,75000,100000);
insert into salary(sal_id,min_sal,max_sal) values (10002,125000,150000); 
insert into salary(sal_id,min_sal,max_sal) values (10003,100000,120000);

insert into job_pos(pos_id,sal_id,dept,pos_name) values (1111,10001,"Financial Aid Office","Financial Aid Counselor");
insert into job_pos(pos_id,sal_id,dept,pos_name) values (1112,10002,"Computer Science","Research Software Engineer");
insert into job_pos(pos_id,sal_id,dept,pos_name) values (1113,10003,"Facilities Maintenance","Building Engineer");


insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (101,1111,"Carl Monroe","cmonroe65@iit.edu","5035 W Hemp St",STR_TO_DATE('12/23/1993', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (102,1111,"Matthew Thornton","mthornton1@iit.edu","593 S Bummet Rd",STR_TO_DATE('03/19/2002', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (103,1111,"Phineas Flynn","pflynn@iit.edu","6933 E Outer Dr",STR_TO_DATE('09/11/2001', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (104,1112,"Kirk Heinrich","kheinrich@iit.edu","56 United Blvd",STR_TO_DATE('10/14/1990', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (105,1112,"Derrick Rose","drose@iit.edu","1345 N Bulls Av",STR_TO_DATE('01/05/1992', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (106,1112,"Joakim Noah","jhoah@iit.edu","76 W Cave St",STR_TO_DATE('09/27/1990', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (107,1113,"Spongebob Squarepants","ssquarepants@iit.edu","10384 S Pineapple Ct",STR_TO_DATE('05/05/1997', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (108,1113,"Minato Namikaze","mnamikaze@iit.edu","47 W Shinobi Rd",STR_TO_DATE('04/09/1999', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (109,1113,"Paul Konerko","pkonerko@iit.edu","7635 S Sox St",STR_TO_DATE('06/18/1985', '%m/%d/%Y'));
insert into employee(employee_id,pos_id,employee_name,emp_email,emp_address,DOB) values (110,1113,"George Costanza","gcostanza","693 N Seinfeld Ct",STR_TO_DATE('07/16/1972', '%m/%d/%Y'));

/* query testing */
select * from employee;

select employee_name, emp_email from employee;

select employee_name, pos_name from employee inner join job_pos on (employee.pos_id = job_pos.pos_id);

select round(avg(final_pay),2) as average_pay from payroll;

select employee_name,amount from employee cross join receives on (employee.employee_id = receives.employee_id); 

select employee_name,pay_date,bonus,gross_pay,tax_deductions,final_pay from employee join receives on (employee.employee_id = receives.employee_id) join payroll on (payroll.pay_id = receives.pay_id);

select count(employee_name) from employee;

select round(sum(amount),2) from receives;

