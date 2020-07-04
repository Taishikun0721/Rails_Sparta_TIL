-- テーブルを作成
create table testtable (
    id integer primary key
,   name text not null unique
,   age integer
);

-- 行を追加するメソッド
insert into testtable(id,name,age)
values (101,'alice', 20)
      ,(102,'bob', 25)
      ,(103, 'cathy', 22);
      

create table testtable2(
    id integer primary key
,   name text not null unique
,   age integer    
);


insert into testtable2(id,name,age)
values(101, 'Alpha',20)
     ,(102,'Blavo',25)
     ,(103,'Charie',23);


create table members(
    id integer primary key
,   name text not null
,   height integer not null
,   gender char(1)  not null
);

insert into members(id,name,height,gender)
values(101,'エレン',170,'M')
     ,(102,'ミカサ',170,'F')
     ,(103,'アルミン',163,'M')
     ,(104,'ジャン',175,'M')
     ,(105,'サシャ',168,'F')
     ,(106,'コニー',158,'M');