use Timesheet_System;
delete from Employee where Payroll_no like "0%";
drop table Employee cascade ;

create table Employee (
    Payroll_no VARCHAR(255) PRIMARY KEY,
    Fname VARCHAR(255) NOT NULL,
    Sname VARCHAR(255) NOT NULL,
    Usern VARCHAR(20) NOT NULL,
    Passw VARCHAR(20) NOT NULL,
    dob DATE NOT NULL,
    Manager_ID VARCHAR(255)
    
);

insert into Employee values ('0001','Joe','Bloggs','jBloggs','pa55word','1992-02-03', null);

insert into Employee values ('0002','Liam','Cooper','lCooper','pa55word','1980-05-08', '0001');

insert into Employee values ('0003','James','Reece','jReece','pa55word','1987-05-02', '0002');

insert into Employee values ('0004','Anthony','Chubster','jReece','pa55word','1987-05-02', '0003');
insert into Employee values ('0005','Jim','Bloggs','jB','pa55word','1987-05-02', '0003');

describe Employee;

alter table Employee
	add constraint foreign key (Manager_ID)
	references Employee(Payroll_no) ON DELETE CASCADE;

drop table TSapproval;

create table TSapproval(
	Approval_ID int(11) primary key auto_increment,
	Employee_ID varchar(255) references Timesheet(Employee_ID),
	Week_TBA varchar(255) not null,
	Approval_data date not null,
	isApproved boolean default false,
	isSubmitted boolean default true
);

drop table Timesheet;

create table Timesheet(
	Timesheet_ID varchar(255) primary key,
	Yearno float not null,
	Mon float default 0,
	Tue float default 0,
	Wed float default 0,
	Thurs float default 0,
	Fri float default 0,
	Employee_ID varchar(255) references Employee(Payroll_no),
	Date_Created date not null,
	Total_Dur float not null
);
drop table Project;

create table Project(
	Project_ID int(11) primary key auto_increment,
	P_desc varchar(255) not null
);

alter table Timesheet
	add column(Project_ID int(11) references Projects(Project_ID));

alter table Timesheet
	add constraint foreign key (Project_ID)
	references Project(Project_ID);

alter table Timesheet
	add constraint foreign key (Employee_ID)
	references Employee(Payroll_no) ON DELETE CASCADE;


alter table Timesheet
	add column(TT_ID int(11) references TaskType(TT_ID));

describe timesheet;

drop table TaskType;

create table TaskType(
	TT_ID int(11) primary key auto_increment,
	TT_desc varchar(255) not null
);

alter table Timesheet
	add column(TaskType_ID int(11) references TaskType(TT_ID));

alter table Timesheet
	add constraint foreign key (TT_ID)
	references TaskType(TT_ID);

show tables;

alter table Timesheet
	add column(Approval_ID int(11)references TSapproval(Approval_ID));

alter table Timesheet
	add constraint foreign key (Approval_ID)
	references TSapproval(Approval_ID);

alter table TSapproval
	add constraint foreign key (Employee_ID)
	references Employee(Payroll_no)
	ON DELETE CASCADE;
describe TSapproval;


insert into Project (Project_ID,P_desc) values (0,'Game Test');

insert into Project (Project_ID,P_desc) values (2,'Bet Test');

insert into Project (Project_ID,P_desc) values (3,'Vegas Test');

insert into TaskType (TT_ID,TT_desc) values (1, 'Planning');

insert into TaskType (TT_ID,TT_desc) values (2, 'Design');

insert into TaskType (TT_ID,TT_desc) values (3, 'Developing');

describe Timesheet;

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,tt_ID,Approval_ID)
values (0,0,0.5,3,4,6,7,'0001','2016-06-07',20.05,1,1,6);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID,Approval_ID)
values (1,0,0.5,3,9,6,7,'0001','2016-06-15',23.05,1,1,5);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID,Approval_ID)
values (2,0,0.5,3,4,6,7,'0002','2016-06-24',40.05,1,2,2);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID, Approval_ID)
values (3,0,0.5,3,4,6,7,'0003','2016-06-07',20.05,1,1,4);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,TT_ID, Approval_ID)
values (4,0,0.5,3,9,6,7,'0002','2016-06-15',37.5,1,1,7);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID, Approval_ID)
values (5,0,0.5,3,4,6,7,'0003','2016-06-24',39.05,2,1,8);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID,Approval_ID)
values (6,0,0.5,3,4,6,7,'0003','2016-06-07',20.05,3,2,14);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID,Approval_ID)
values (7,0,0.5,3,9,6,7,'0005','2016-06-15',12,2,3,9);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID,Approval_ID)
values (8,0,0.5,3,4,6,7,'0005','2016-06-24',16,3,3,11);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID, Approval_ID)
values (9,0,0.5,3,4,6,7,'0004','2016-06-07',13,2,2,4);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID, Approval_ID)
values (10,0,3,2,1,1,5,'0004','2016-06-15',12,3,3,7);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,tt_ID, Approval_ID)
values (11,0,3,2,1,1,5,'0005','2016-06-15',7,3,3,13);

Insert into Timesheet (Timesheet_ID,yearno,Mon,Tue,Wed,Thurs,Fri,Employee_ID,date_created,total_dur,Project_ID,Tt_ID, Approval_ID)
values (12,0,3,2,1,1,5,'0005','2016-06-15',24,1,3,12);


insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(0,'0001',13,'2016-06-07',false,true);


insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(1,'0001',14,'2016-06-15',false,false);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(2,'0002',15,'2016-06-25',true,true);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(6,'0003',16,'2016-06-07',false,true);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(4,'0002',17,'2016-06-15',false,false);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(5,'0003',18,'2016-06-25',false,true);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(8,'0005',13,'2016-06-07',false,true);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(9,'0005',14,'2016-06-15',true,false);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(10,'0002',15,'2016-06-25',true,true);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(11,'0003',16,'2016-06-07',true,true);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(12,'0004',17,'2016-06-15',false,false);

insert into TSapproval (Approval_ID,Employee_ID,week_TBA, Approval_Data, isApproved, isSubmitted) 
values(14,'0004',18,'2016-06-25',false,true);

select * from Employee;
select * from Timesheet;
select * from TSapproval;
select * from TaskType;
select * from Project;

-- displays all staff and all approved timesheets
select t.Employee_ID, fname as 'First Name', sname as 'Surname', round(sum(total_dur)) as 'Hours Worked' 
from Timesheet as t 
inner join Employee as e 
	on t.Employee_ID = e.Payroll_no 
inner join TSapproval as a
	on t.Approval_ID = a.Approval_ID
where a.isApproved = true
group by Employee_ID, fname, sname;

-- displays all staff who still need their timesheets approving
select e.fname as 'First Name', e.sname as 'Surname', t.total_dur as 'Hours Worked', ts.approval_data as 'Date Submitted'
from  Timesheet as t
inner join Employee as e
on e.Payroll_no = t.Employee_ID
inner join TSapproval as ts
on ts.Approval_ID = t.Approval_ID
where isApproved = 0
order by approval_data;

-- displays staff who's submitted hours calculates to higher than 37.5 'The Standard Working Week'
select t.Employee_ID, fname as 'First Name', sname as 'Surname', round(sum(total_dur)) as 'Hours Worked' 
from Timesheet as t 
inner join Employee as e 
	on t.Employee_ID = e.Payroll_no 
inner join TSapproval as a
	on t.Approval_ID = a.Approval_ID
group by t.Employee_ID, fname, sname
having round(sum(total_dur))>37.4;

-- same but less than
select t.Employee_ID, fname as 'First Name', sname as 'Surname', round(sum(total_dur)) as 'Hours Worked' 
from Timesheet as t 
inner join Employee as e 
	on t.Employee_ID = e.Payroll_no 
inner join TSapproval as a
	on t.Approval_ID = a.Approval_ID
group by t.Employee_ID, fname, sname
having round(sum(total_dur))<37.4;

-- show hours per task
select round(sum(t.total_dur)) as 'Hours Worked', tt.tt_desc as 'Task Type'
from Timesheet as t
inner join tasktype as tt
on t.TT_ID = tt.tt_id
group by tt.tt_desc;

-- show hours per project
select round(sum(t.total_dur)) as 'Hours Worked', p.p_desc as 'Project'
from Timesheet as t
inner join project as p
on p.Project_ID = t.project_id
group by p.p_desc;


-- displays all staff who still need their timesheets submitting
select e.fname as 'First Name', e.sname as 'Surname', t.total_dur as 'Hours Worked', ts.approval_data as 'Date Submitted'
from  Timesheet as t
inner join Employee as e
on e.Payroll_no = t.Employee_ID
inner join TSapproval as ts
on ts.Approval_ID = t.Approval_ID
where isSubmitted = 0
order by approval_data;

-- displays staff that have worked on any given project
select p.p_desc as 'Project Description', t.Employee_ID as 'Payroll no', e.fname as 'Employee First Name', e.sname as 'Surname'
from Timesheet as t
inner join Employee as e
on t.Employee_ID = e.Payroll_no
inner join project as p
on p.project_id = t.project_id
order by p_desc;

-- show employees who have worked on a specific project
select p.p_desc as 'Project Description', t.Employee_ID as 'Payroll no', e.fname as 'Employee First Name', e.sname as 'Surname'
from Timesheet as t
inner join Employee as e
on t.Employee_ID = e.Payroll_no
inner join project as p
on p.project_id = t.project_id
where p_desc = 'Bet Test'
order by p_desc;

-- allows a manager to see his staff's timesheets where they haven't been approved
select distinct e.fname as 'First Name', e.sname as 'Surname', t.Approval_ID as 'Approval ID', date_created as 'Date Created' from Timesheet as t
inner Join Employee as e
on e.payroll_no = t.employee_id
inner join TSapproval as ts
where e.Manager_id ='0003' and isApproved = false
order by e.sname;


