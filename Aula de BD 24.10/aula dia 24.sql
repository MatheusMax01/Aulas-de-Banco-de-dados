create database sprint3;
use sprint3;

create table Pessoa(
idPessoa int primary key auto_increment,
nome varchar(45),
salario decimal (10,2)
);

create table Endereco(
idEndereco int primary key auto_increment,
cep char (9),
bairro varchar(45),
cidade varchar(45)
) auto_increment = 100;

create table EnderecoCompleto(
FkPessoa int,
foreign key (FkPessoa) references Pessoa(idPessoa),
FkEndereco int,
foreign key(FkEndereco) references Endereco(idEndereco),
primary key(FkPessoa,FkEndereco),
numero int,
complemento varchar(45)
);

desc pessoa;

insert into Pessoa values 
(null,'vivian',1.99),
(null,'rafael',1.99),
(null,'paulo',1.98);

insert into Endereco values
(null,'05335-120','Jaguaré','São Paulo'),
(null,'02335-330','Vila Yara','Osasco'),
(null,'00173-560','Capado','Pirituba');

select * from Pessoa;
select * from Endereco;

insert into EnderecoCompleto values
(1,101,1500,'apto 101'),
(2,100,595,'10 andar'),
(3,100,595,'10 andar');

select * from Pessoa
join EnderecoCompleto on idPessoa = FkPessoa
join Endereco on idEndereco = FkEndereco;

select * from Pessoa
right join EnderecoCompleto on idPessoa = FkPessoa
right join Endereco on idEndereco = FkEndereco;

insert into Pessoa values (null,'Matheus Max',2.00);

select * from Pessoa
right join EnderecoCompleto on idPessoa = FkPessoa
right join Endereco on idEndereco = FkEndereco
union
select * from Pessoa
left join EnderecoCompleto on idPessoa = FkPessoa
left join Endereco on idEndereco = FkEndereco;

select * from Pessoa
right join EnderecoCompleto on idPessoa = FkPessoa
right join Endereco on idEndereco = FkEndereco
where FkEndereco is null
union
select * from Pessoa
left join EnderecoCompleto on idPessoa = FkPessoa
left join Endereco on idEndereco = FkEndereco
where FkPessoa is null;

select Pessoa.nome, Endereco.bairro from Pessoa
right join EnderecoCompleto on idPessoa = FkPessoa
right join Endereco on idEndereco = FkEndereco
where FkEndereco is null
union
select Pessoa.nome, Endereco.bairro from Pessoa
left join EnderecoCompleto on idPessoa = FkPessoa
left join Endereco on idEndereco = FkEndereco
where FkPessoa is null;

-- funcoes matematicas
-- COUNT()
select COUNT(*) from Pessoa;
select COUNT(salario) from Pessoa;
insert into Pessoa values (null,'Raul',null);
select * from Pessoa;

-- Max e Min
select MAX(salario)'Maior salario', MIN(salario)'Menor salario' from Pessoa;

-- SUM e AVG
select SUM(salario)'Soma dos salarios',
AVG(salario)'Media os salarios' from Pessoa;

select SUM(salario)'Soma dos salarios',
ROUND(AVG(salario),2)'Media os salarios' from Pessoa;

select ROUND(AVG(salario),2)'Arredondado'
 from Pessoa;

select ROUND(AVG(salario),2)'Arredondado',
AVG(salario)'Media dos salarios'
 from Pessoa;
 
select TRUNCATE(AVG(salario),2)'Arredondado',
AVG(salario)'Media dos salarios'
 from Pessoa;
 
INSERT INTO Pessoa values(null,'Lucas',0.19);
INSERT INTO Pessoa values(null,'Gordo',1.45);
INSERT INTO Pessoa values(null,'Samurai',0.09);
   
select TRUNCATE(AVG(salario),2)'TRUNCADO',
ROUND(AVG(salario),2) 'ARREDONDADO',
AVG(salario)'Media de salario' from Pessoa;

-- LIMIT

select * from Pessoa LIMIT 1;
select * from Pessoa LIMIT 2,3;

-- GROUP BY

select AVG(salario)'Media dos salarios',
bairro
from Pessoa
join EnderecoCompleto on IdPessoa = FkPessoa
join Endereco on IdEndereco = FkEndereco
GROUP BY bairro;

select ROUND(AVG(salario))'Media dos salarios',
bairro
from Pessoa
join EnderecoCompleto on IdPessoa = FkPessoa
join Endereco on IdEndereco = FkEndereco
GROUP BY bairro;

