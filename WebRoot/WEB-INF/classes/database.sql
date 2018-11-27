



-- 创建数据库
-- 创建用户并授权
drop database if exists wbms;
create database wbms charset utf8;
use wbms;


drop user if exists wbmsuser;
create user wbmsuser;
set password for wbmsuser = password('wbmsuser');
grant all on wbms.* to wbmsuser;

-- 用户表
-- 用户id
-- 用户账户
-- 用户密码
-- 用户员工编号
-- 用户角色id
-- 用户的创建时间

drop table  if exists t_user;
 create table t_user(
    id  int auto_increment primary key,
    account varchar(20) unique,
    passwd   varchar(50) not null,
    name varchar(20),
    role_id int,
    status int,
    create_time date
)engine=Innodb,  charset = utf8;

insert into t_user  values (-11, 'adumin','admuin' ,0,-1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('admin','admin' ,1,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('aaa','aaa' ,2,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e01','e01' ,2,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e02','e02' ,1,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e03','e03' ,2,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e04','e04' ,1,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e05','e05' ,2,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e06','e06' ,1,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e07','e07' ,2,1,now());
insert into t_user (account,passwd, role_id, status, create_time) values ('e08','e08' ,1,1,now());
select * from t_user;



-- 菜单表

-- 菜单id
drop table  if exists t_menu;
create table t_menu(
	menu_id int primary key,
	menu_name varchar(10),
	menu_href_url varchar(20),
	menu_parent_id int,
	menu_create_time date
)engine=Innodb,  charset = utf8;


-- 菜单表
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(1,'人事管理','',-1,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(2,'财务管理','',-1,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(3,'系统管理','',-1,now());

insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(11,'部门管理','depts.action',1,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(12,'员工管理','emps.action',1,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(13,'请假管理','dfgfd',1,now());

insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(21,'报销管理','dffdg',2,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(22,'报销统计','',2,now());
 

insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(31,'账户','users.action',3,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(32,'更改账户角色','',3,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(33,'添加角色管理','',3,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(34,'权限管理密重置','',3,now());
insert into t_menu(menu_id,menu_name,menu_href_url,menu_parent_id,menu_create_time) values(35,'系统退出','',3,now());
select * from t_menu;


-- 角色表
drop table  if exists t_role;
create table t_role(
	role_id int auto_increment primary key,
	role_name varchar(10) unique,
	role_create_time date
)engine=Innodb,  charset = utf8;

insert into t_role values(1,'管理员',now());
insert into t_role values(2,'普通用户',now());
insert into t_role values(3,'财务',now());
select * from t_role;


-- 菜单-角色表
drop table  if exists t_menu_role;
create table t_menu_role(
	menu_id int,
	role_id int,
	status int,
	menu_role_create_time date,
	primary key(menu_id,role_id)
)engine=Innodb,  charset = utf8;
-- 管理员所有权限
insert into t_menu_role values(1,1,1,now());
insert into t_menu_role values(2,1,1,now());
insert into t_menu_role values(3,1,1,now());

insert into t_menu_role values(11,1,1,now());
insert into t_menu_role values(12,1,1,now());
insert into t_menu_role values(13,1,1,now());

insert into t_menu_role values(21,1,1,now());
insert into t_menu_role values(22,1,1,now());

insert into t_menu_role values(31,1,1,now());
insert into t_menu_role values(32,1,1,now());
insert into t_menu_role values(33,1,1,now());
insert into t_menu_role values(34,1,1,now());
insert into t_menu_role values(35,1,1,now());

-- 其他用户拥有部分权限
insert into t_menu_role values(1,2,1,now());
insert into t_menu_role values(2,2,1,now());
insert into t_menu_role values(3,2,1,now());

insert into t_menu_role values(11,2,1,now());
insert into t_menu_role values(12,2,1,now());
insert into t_menu_role values(13,2,1,now());

insert into t_menu_role values(21,2,1,now());
insert into t_menu_role values(22,2,1,now());
 
insert into t_menu_role values(31,2,-1,now());
insert into t_menu_role values(32,2,-1,now());
insert into t_menu_role values(33,2,-1,now());
insert into t_menu_role values(34,2,-1,now());
insert into t_menu_role values(35,2,-1,now());

select * from t_menu_role order by role_id desc;




-- 员工表
drop table  if exists t_emp;
create table t_emp(
	emp_no varchar(10) primary key,
	emp_name varchar(10),
	emp_role_id int,
	emp_dept_no varchar(10),
	emp_sex int,
	emp_edu varchar(10),
	emp_email varchar(50),
	emp_phone varchar(20),
	emp_entry_time date,
	emp_create_time date,
	emp_passwd varchar(50)
)engine=Innodb,  charset = utf8;

insert into t_emp  values('e01','谢民皆',1,'A1',1,'本科','xmj@qq.com','157166',now(),now(),'xmj');
insert into t_emp  values('e02','徐子峰',2,'A2',1,'本科','xmj@qq.com','15700016166',now(),now(),'xzf');
insert into t_emp  values('e03','唐翠梅',3,'A3',-1,'硕士','xmj@qq.com','15715216166',now(),now(),'qss');
insert into t_emp  values('e04','姚小琴',4,'A4',-1,'硕士','xmj@qq.com','15715216166',now(),now(),'lhh');
insert into t_emp  values('e05','唐拥拥',1,'A1',1,'本科','xmj@qq.com','157166',now(),now(),'xmj');
insert into t_emp  values('e06','徐慧',2,'A2',-1,'本科','xmj@qq.com','15700016166',now(),now(),'xzf');
insert into t_emp  values('e07','许正森',3,'A3',1,'本科','xmj@qq.com','15715216166',now(),now(),'qss');
insert into t_emp  values('e08','黄佳美',4,'A4',-1,'本科','xmj@qq.com','15715216166',now(),now(),'lhh');
 select * from t_emp;
 
 
-- 部门表
drop table  if exists t_dept;
create table t_dept(
	dept_no varchar(10) primary key,
	dept_name varchar(10) unique,
	dept_man_emp_no varchar(10),
	dept_create_time date
)engine=Innodb,  charset = utf8;

insert into t_dept values('A1','人事','e01',now());
insert into t_dept values('A2','采购','e02',now());
insert into t_dept values('A3','销售',null,now());
insert into t_dept values('A4','财务','',now());
select * from t_dept;
 
-- 请假管理表


select * from t_dept;
select * from t_emp;
select * from t_user;
select * from t_role;

 


-- cp -r   /home/soft02/Workspaces/MyEclipse\ 8.6/wbms /home/soft02/桌面/
-- source /home/soft02/Workspaces/MyEclipse 8.6/wbms/src/database.sql 

 
