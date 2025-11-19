drop database  if exists escola;
create database escola;
use escola;
show databases;

create table alunos (
  id int auto_increment primary key,
  nome varchar(100) not null,
  email varchar(100) not null,
  data_nascimento date,
  turma_id int
);


create table professores (
   id int auto_increment primary key,
   nome varchar(100) not null,
   especialidade varchar(100)
);

create table turmas (
   id int auto_increment primary key,
   nome varchar(50) not null,
   professor_id int,
   horario time,
   foreign key (professor_id) references professores(id)
);

create table disciplinas (
   id int auto_increment primary key,
   nome varchar(50) not null,
   carga_horaria int
);

create table notas (
   id int auto_increment primary key,
   aluno_id int,
   disciplina_id int,
   nota decimal (2, 1),
   bimestre int,
   foreign key (aluno_id) references alunos(id),
   foreign key (disciplina_id) references disciplinas(id)
); 


drop database if exists escola;
create database escola;
use escola;
show databases;

create table alunos (
	id int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null,
    data_nascimento date,
    turma_id int
);

create table professores (
	id int auto_increment primary key,
    nome varchar(100) not null,
    especialidade varchar(100)
);

create table turmas (
	id int auto_increment primary key,
    nome varchar(50) not null,
    professor_id int,
    horario time,
    foreign key (professor_id) references professores(id)
);

create table disciplinas (
	id int auto_increment primary key,
    nome varchar(100) not null,
    carga_horaria int
);

create table notas (
	id int auto_increment primary key,
    aluno_id int,
    disciplina_id int,
	nota decimal (2, 1),
    bimestre int,
    foreign key (aluno_id) references alunos(id),
    foreign key (disciplina_id) references disciplinas(id)
);

alter table alunos 
add foreign key (turma_id) references turmas(id);

insert into professores (nome, especialidade)
values
('Carlos Silva', 'Matemática'),
('Ana Santos', 'Português'),
('Marcos Lima', 'História'),
('Julia Costa', 'Ciências'),
('Roberto Alves', 'Geografia');

insert into turmas (nome, professor_id, horario)
values
('1º Ano A', 1, '08:00:00'),
('1º Ano B', 2, '10:00:00'),
('2º Ano A', 3, '08:00:00'),
('2º Ano B', 4, '13:00:00'),
('3º Ano A', 5, '14:00:00');

insert into disciplinas(nome, carga_horaria) values
  ('Matemática', 60),
  ('Português', 70),
  ('História', 50),
  ('Geografia', 40),
  ('Ciências', 65),
  ('Inglês', 45),
  ('Educação Física', 40),
  ('Artes', 55),
  ('Física', 75),
  ('Química', 80);


insert into notas(aluno_id, disciplina_id, nota, bimestre) values
  (4, 2, 7.6, 1),
  (1, 5, 8.3, 3),
  (9, 1, 6.9, 2),
  (7, 3, 9.1, 4),
  (3, 6, 5.4, 1),
  (10, 4, 4.8, 2),
  (2, 2, 8.7, 3),
  (8, 1, 7.2, 4),
  (5, 3, 6.1, 1),
  (6, 6, 9.4, 2);
  
 insert into alunos(nome, email, data_nascimento, turma_id) values
  ('Lucas Andrade', 'lucas.andrade@example.com', '2010-03-12', 1),
  ('Mariana Costa', 'mariana.costa@example.com', '2015-11-25', 2),
  ('João Henrique', 'joao.henrique@example.com', '2011-07-04', 3),
  ('Ana Beatriz Lopes', 'ana.lopes@example.com', '2012-01-18', 1),
  ('Felipe Duarte', 'felipe.duarte@example.com', '2009-09-30', 2);
     
     
select * from alunos where turma_id=1;

 select * from alunos order by nome asc;

 select nome, data_nascimento from alunos where data_nascimento > '2010-01-01' order by data_nascimento;
 
select t.nome as turma, COUNT(a.id) as total_alunos
from turmas left join alunos on alunos.turma_id = turmas.id
group by turmas.id, turmas.nome;

select disciplinas.nome as disciplina,avg(notas.nota) as media_notas
from disciplinas join notas on notas.disciplina_id = disciplinas.id
group by disciplinas.id, disciplinas.nome
order by disciplinas.nome;

select A.nome as Aluno, T.nome as Turma, P.nome as Professor_Regente
from alunos A
inner join turmas T ON A.turma_id = T.id 
inner join professores P ON T.professor_id = P.id
order by Aluno;

select A.nome AS Nome_Aluno, T.nome as Turma, D.nome as Disciplina, N.nota as Nota, N.bimestre AS Bimestre
from alunos A
inner join notas N ON A.id = N.aluno_id     
inner join disciplinas D ON N.disciplina_id = D.id 
inner join turmas T ON A.turma_id = T.id      
ORDER BY
    Nome_Aluno, Disciplina, Bimestre;
    
    
    
    DELIMITER //

CREATE PROCEDURE CalcularMediaGeral (
    IN p_aluno_id INT,
    OUT p_media_geral DECIMAL(4, 2)
)
begin select avg(nota) into p_media_geral from notas where aluno_id = p_aluno_id;
end //
DELIMITER ;
set @media_geral_do_aluno = 0.0;
call CalcularMediaGeral(2, @media_geral_do_aluno);
select 'Média Geral do Aluno 2:' as Teste, @media_geral_do_aluno as Media_Geral_Calculada;



DELIMITER //
CREATE PROCEDURE ListarAlunosPorTurma (
IN p_turma_id INT
)
BEGIN SELECT
A.nome as Nome_do_Aluno,
A.email as Email_do_Aluno,
T.nome as Nome_da_Turma,
P.nome as Professor_Regente  
FROM alunos A
inner join turmas T on A.turma_id = T.id 
inner join professores P on T.professor_id = P.id 
where A.turma_id = p_turma_id
order by A.nome;
end //
DELIMITER ;
CALL ListarAlunosPorTurma(1);





select A.nome as Nome_do_Aluno, D.nome as Nome_da_Disciplina,
avg(N.nota) as Media_Final,
case
when avg(N.nota) >= 7.0 then 'APROVADO'
else 'REPROVADO'
end as Status_Final
from
alunos A
inner
notas N on A.id = N.aluno_id
inner join
disciplinas D on N.disciplina_id = D.id
group by
A.id, D.id, A.nome, D.nome
order by
Nome_do_Aluno, Nome_da_Disciplina;



select A.nome as Nome_do_Aluno,
avg(N.nota) AS Media_Geral,
rank() over (order by avg(N.nota) desc) as Posicao_Ranking
from alunos A
inner join notas N on A.id = N.aluno_id 
group by A.id, A.nome 
