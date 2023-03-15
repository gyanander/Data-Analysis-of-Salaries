use data_new
#  1   Show all columns and rows int the table.
select * from salaries

#  2  Show only the EmployeeName and jobTitle columns.
select EmployeeName,JobTitle from salaries

#  3   Show the Number of employees in the table.
select count(*) from salaries

#  4  Show the Unique job titles in the table.
select distinct (JobTitle) from salaries

#  5  Show the JobTitle and overtime pay for all employees with overtime pay greater than 50000.
select JobTitle,OverTimePay from salaries 
where overtimepay > 50000;

#  6  Show the top 10 highest paid employees.
select EmployeeName , Totalpay  from salaries 
order by totalpay desc
limit 10;

#  7  Show the Average of Basepay,OvertimePay, and Otherpay for each employee:
select EmployeeName,(BasePay + OvertimePay + OtherPay)/3 as avg_of_bp_op_otherpay from salaries

#  8  Show all employees who have the word "Manager" in their job title.
select EmployeeName,JobTitle from salaries
where JobTitle like '%Manager%';

 #  9  Show all employees with a job title not equal to "manager".
 select EmployeeName,JobTitle from salaries
 where JobTitle <>'Manager';
 
 #  10  Show all employees with a total pay between 200000 and 300000.
 select * from salaries
 where TotalPay between 200000 and 300000;
 
 #  11  Show all job titles with an average base pay of atleast 100000 and order them by the average base pay in descending order.
 select JobTitle,avg(Basepay) as "avgbasepay" from salaries
 group by jobTitle
 having avg(BasePay) >= 100000
 order by avgbasepay desc


#  12  Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%.
update salaries 
set BasePay = BasePay * 1.1
where JobTitle like "%Manager%"

#  13  Show the Employee which have highest TotalPay.
select EmployeeName,TotalPay from(select *,dense_rank() over(order by TotalPay desc) as RNK from 
salaries)k
where k.RNK=1

#  14  Show the Employee which have lowest TotalPay.
select EmployeeName,TotalPay from(select *,dense_rank() over(order by TotalPay asc) as RNK from 
salaries)k
where k.RNK=1


