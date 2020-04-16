use secur;

select * from tbl_users;
select * from authorities;

insert into tbl_users(user_name, user_pass)
values('admin', 'admin');

delete from tbl_users where id = '2';

desc authorities;
desc tbl_users;

insert into authorities(username, authority)
values('admin', 'ADMIN');
insert into authorities(username, authority)
values('admin', 'ROLE_ADMIN');

commit;

update authorities set username = 'user' where id = 3;

-- safeupdate option 해제하는 법
-- Edit-preference-SQL-EDITOR Safe-Updates 체크 해제