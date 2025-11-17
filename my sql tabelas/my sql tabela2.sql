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

alter table alunos add foreign key(turma_id) references turmas(id);
insert into professores(id, nome, especialidade) values
   (1, 'Ana Silva', 'Matemática'),
   (2, 'Bruno Costa', 'Física'),
   (3, 'Carla Mendes', 'Química'),
   (4, 'Daniel Oliveira', 'Biologia'),
   (5, 'Eduardo Santos', 'História'),
   (6, 'Fernanda Lima', 'Geografia'),
   (7, 'Gabriel Rocha', 'Inglês'),
   (8, 'Helena Martins', 'Educação Física'),
   (9, 'Igor Fernandes', 'Artes'),
   (10, 'Juliana Almeida', 'Português');
   
INSERT INTO turmas (nome, professor_id, horario) VALUES
   ('Turma A', 1, '08:00-09:30'),
   ('Turma B', 2, '09:30-11:00'),
   ('Turma C', 3, '11:00-12:30'),
   ('Turma D', 4, '13:30-15:00'),
   ('Turma E', 5, '15:00-16:30'),
   ('Turma F', 6, '16:30-18:00'),
   ('Turma G', 7, '08:00-09:30'),
   ('Turma H', 8, '09:30-11:00'),
   ('Turma I', 9, '11:00-12:30'),
   ('Turma J', 10, '13:30-15:00');
