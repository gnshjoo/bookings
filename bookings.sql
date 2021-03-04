select 'fish' as animal, 10 as age, 100.1 as weight;


CREATE TABLE "public"."animals" ("id" serial NOT NULL,"animal_name" varchar NOT NULL, PRIMARY KEY ("id"));


INSERT INTO "public"."animals" ("animal_name") VALUES ('Dog');
INSERT INTO "public"."animals" ("animal_name") VALUES ('Fish');
INSERT INTO "public"."animals" ("animal_name") VALUES ('Cat');

select * from animals;

select * from animals where id = 1;

select * from animals where animal_name = 'Cat';

insert into animals ("animal_name") values ('Horse');

update animals set animal_name = 'German Shepherd' where id = 1;

delete from animals where id = 4;

delete from animals;

drop TABLE animals;

create table "public"."people" ("id" serial NOT NULL, "first_name" varchar(255) NOT NULL, "last_name" varchar(255) NOT NULL, primary key("id"));
create table "public"."email" ("id" serial NOT NULL, "people_id" int8 NOT NULL, "email_address" varchar(255) NOT NULL, primary key("id"));
create table "public"."phones" ("id" serial NOT NULL, "people_id" int8 NOT NULL, "phone_number" varchar(255) NOT NULL, primary key("id"));

insert into people (first_name, last_name) values ('John', 'Smith');
insert into people (first_name, last_name) values ('Mary', 'Jones');

select * from people;
select * from email;
select * from phones;

insert into email (people_id, email_address) values (1, 'john@gmail.com');
insert into email (people_id, email_address) values (1, 'john@john.ca');
insert into email (people_id, email_address) values (2, 'mary@gmail.com');

select email_address from email WHERE people_id = 2;

select p.first_name, p.last_name, e.email_address from people p
                                                           left join email e on (e.people_id = p.id) where p.id = 2;

select p.first_name, p.last_name, e.email_address from people p
                                                           left join email e on (e.people_id = p.id) where p.first_name = 'John';

select p.first_name, p.last_name, e.email_address from people p
                                                           left join email e on (e.people_id = p.id) where p.first_name = 'John' and p.last_name='Smith';

insert into phones (people_id, phone_number) values (1, '555-555-5432');
insert into phones (people_id, phone_number) values (2, '555-555-1234');


select
    p.first_name, p.last_name, e.email_address, p2.phone_number
from people p
         left join email e on (e.people_id = p.id)
         left join phones p2 on (p.id = p2.people_id)
where
        p.id =1;

select
    p.first_name, p.last_name, e.email_address, p2.phone_number
from people p
         left join email e on (e.people_id = p.id)
         left join phones p2 on (p.id = p2.people_id)
order by p.last_name;