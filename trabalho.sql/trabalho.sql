create database Test;
show databases;
use Test;

create table alunos(
  id int auto_increment primary key,
  nome varchar(100) not null,
  idade int, 
  disciplina varchar(50)
);

show tables;

insert into alunos (nome, idade, disciplina)
values
('João', 17 ,'Banco de dados'),
('Maria', 23 ,'Lógica de programação'),
('Renato', 15 ,'Programação de Aplicativos'),
('Evelin', 21 ,'Lógica de programção'),
('Mariana', 18 ,'Modelagem de Sistemas'),
('Carlos', 16 ,'Desenvolvimento Web'),
('Ana', 20 ,'Banco de dados'),
('Marcelo', 25 ,'Programação de Aplicativos'),
('André', 22 ,'Desenvolvimento Web');

select * from alunos;

select nome, idade from alunos;

select * from alunos
order by nome desc;

select * from alunos
where disciplina = "Modelagem de Sistemas";

select * from alunos 
where idade  > 19;

select * from alunos 
order by idade asc; 

select * from alunos
where disciplina = "Banco de dados" or disciplina = "Programação de Aplicativos";

select count(*) from alunos;

select avg(idade) from alunos;

select diciplina, count(*) as total_alunos from alunos group by disciplina;  

update alunos set idade = 19
where id = 7;

update alunos set disciplina = "Programação de Aplicativos"
where disciplina = "Desenvolvimento Web";


delete from alunos where nome = "André";
select * from alunos; 

alter table alunos add email varchar(200);
select * from alunos; 


alter table alunos modify disciplina varchar(150);
select * from alunos; 

alter table alunos drop email;
select * from alunos; 

select * from alunos where nome like 'A%';

select * from alunos where nome like '%A';

select * from alunos where nome like '%A%';

select * from alunos where nome like '%E%';

select disciplina from alunos group by disciplina having avg(idade) > 19;

select nome, idade from alunos where idade = (select max(idade) from alunos);

create table alunos_db as select * from alunos where disciplina = 'Banco de dados';
select * from alunos_db; 


create table bibilioteca;
show databases;
create table alunos(
  id int auto_increment primary key,
  titulo varchar(150)not null,
  autor varchar(100),
  ano_publicacao int, 
  disponivel boolean
);
use Test;





