use emsdb;

INSERT INTO users(username, password, enabled)
VALUES('admin', '{noop}admin', true);

INSERT INTO users(username, password, enabled)
VALUES('user', '{noop}user', true);

INSERT INTO authorities(username, authority)
VALUES('admin', 'ROLE_ADMIN');

INSERT INTO authorities(username, authority)
VALUES('user', 'ROLE_USER');

SELECT * FROM users;
select * from authorities;

DELETE FROM users WHERE username = 'admin';
DELETE FROM users WHERE username = 'user';
DELETE FROM users WHERE username = 'user1';

delete from authorities WHERE seq = 3;
delete from authorities WHERE seq = 4;
delete from authorities WHERE seq = 5;

delete from authorities WHERE seq = 2;

desc authorities;
select * from authorities;
SELECT * FROM users;

commit;