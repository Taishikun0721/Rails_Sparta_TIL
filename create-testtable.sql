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
     
create table characters(
    id integer primary key
,    movie_id integer 
,    name text
,    gender char(1)
);

insert into characters(id, movie_id, name, gender)
values(401, 93, 'ナウシカ', 'F')
     ,(402, 94, 'バズー', 'M')
     ,(403, 94, 'シータ', 'F')
     ,(404, 94, 'ムスカ', 'M')
     ,(405, 95, 'さつき', 'F')
     ,(406, 95, 'メイ', 'F')
     ,(407, null , 'クラリス', 'F');
     
create table students(
    id integer primary key
,   name text not null
,   gender char(1) not null
,   class text not null
);

create table test_scores(
     student_id integer not null references students(id)
,    subject text not null
,    score integer not null
,    primary key (student_id, subject)
);

select from t.student_id, t.score from test_scores as t where (t.subject, t.score) = (select subject, score from test_scores where subject = '国語' group by subject);


select a.subject, a.avg_score from (select subject, avg(score) as avg_score from test_scores group by subject) as a where a.avg_score < 70;


select b.subject, b.avg_score
from (select subject,
             avg(score) as avg_score
             from test_scores 
             group by subject
) as b where b.avg_score < 70;

with avg_table as(
    select subject, 
    avg(score) as avg_score
    from test_scores
    group by subject
)

select * from avg_table where avg_table.avg_score < 70;

with x(max_score) as (
    select
    max(score)
    from test_scores as x
    where subject = '国語'
)

select t.student_id, t.score
from test_scores as t
where t.subject = '国語' and t.score = (select x.max_score from x);

with max_score(value) as (
    select max(score)
    from test_scores
    where subject = '国語'
)
, target(student_id) as (
    select student_id
    from test_scores
    where subject = '国語'
    and score = (select value from max_score)
)

select *
from students
where id in (select student_id from target);


with avg_table(subject, avg_score) as (
    select subject,
    avg(score)
    from test_scores
    group by subject
)

select subject, avg_score
from avg_table
where avg_score = (select min(a.avg_score) from avg_table a);

create table movies(
    movie_id integer primary key
,   title text not null
);

insert into movies(movie_id, title)
values(93, '風の谷のナウシカ')
     ,(94, '天空のしろラピュタ')
     ,(95, 'となりのトトロ')
     ,(96, '崖の上のポニョ');
     
update movies set title = '天空の城ラピュタ'
where movie_id = 94;

select m.*, c.* 
from movies as m, 
characters as c;

select m.*, c.*
from movies as m,
     characters as c
where m.movie_id = c.movie_id
and c.gender = 'F';


select c.* from characters c
join movies m on c.movie_id = m.movie_id
where c.gender = 'F';


select c.* from characters as c
where movie_id in( 
        select m.movie_id
        from movies as m
        where title = 'となりのトトロ'
    );
    
select c.* from characters as c
join movies as m using(movie_id)
where c.gender = 'F';

select * from characters;

select * from movies;

select m.*, c.*
from movies as m 
full outer join characters as c on m.movie_id = c.movie_id;


select m.movie_id , m.title
from movies as m 
join characters as c on m.movie_id = c.movie_id
group by m.movie_id;

select m.* from movies as m
left outer join characters as c on c.movie_id = m.movie_id
where c.id is null;

select c.id, c.name, c.gender from characters as c
left outer join movies as m 
on m.movie_id = c .movie_id
where c.movie_id is null;


select m.movie_id, m.title, count(c.name) from movies as m
left join characters as c on m.movie_id = c.movie_id 
group by m.movie_id
order by m.movie_id;

create table notnulls( 
    null_id integer primary key
,   title text not null unique
);
 
insert into notnulls(null_id, title)
values (102, 'これはnullではない');


create table referrence_keys(
    id integer primary key 
,   movie_id integer references movies(movie_id)
,   name text not null
);

insert into referrence_keys(id, movie_id,name)
values (101, 999, '外部キーがおかしい');