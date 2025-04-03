
create table test (
    id integer primary key autoincrement,
    name text,
    age integer
);

alter table test rename to user;

alter table user add column email text;

alter table user rename column name to username;

drop table user;