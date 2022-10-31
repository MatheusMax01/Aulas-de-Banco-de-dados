create database Venda;
use Venda;

create table Cliente(
IdCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
FkCliente_Indicador int,
foreign key auto_increment (FkCliente_Indicador) references Cliente(IdCliente) 
);

create table Endereco(
IdEndereco int primary key auto_increment,
cep char(9),
rua varchar(45),
numero int,
complemento varchar(45),
FkCliente int,
foreign key auto_increment (FkCliente) references Cliente(IdCliente)
);

create table venda(
idVenda int primary key auto_increment,
TotalVenda decimal (10,2),
DataVenda date,
FkCliente_Venda int,
foreign key auto_increment (FkCliente_Venda) references Cliente(IdCliente)
);

create table produto(
IdProduto int primary key auto_increment,
NomeProduto varchar(45),
Descricao varchar(45),
preco decimal(10,2)
);

create table Carrinho(
FkProduto int,
foreign key (FkProduto) references produto(IdProduto),
FkVenda int,
foreign key (FkVenda) references venda(IdVenda),
primary key (FKProduto,FkVenda),
desconto decimal (10,2),
quantidade int
);

insert into Cliente values
(null,'Matheus','matheus.lima@teste.com',null),
(null,'Samurai','samurai.gordo@teste.com',1),
(null,'Jonathan','cifra.mandrake@teste.com',2),
(null,'Emille','Brava.mae@teste.com',2),
(null,'Washigton','Amendoim.Cocacola@teste.com',null);

insert into Endereco values
(null,'05335-120','Rua Caetanopolis',940,'apto 141 bloco 2',1),
(null,'05334-222','Rua Haddock Lobo',567,'apto 111',2),
(null,'05333-111','Rua fifanaaula',444,'andar -5',3),
(null,'05332-333','Rua sabedenada',321,' andar 2',4),
(null,'05331-444','Rua Hosh',123,'apto 555',5);

insert into produto values
(null,'coca-cola','refrigerante',9.90),
(null,'Colgate','Pasta de dente',1.21),
(null,'Heineken','Cerveja',10.5),
(null,'Jack Honey','Whisky',122.50),
(null,'Amendoim','Petisco',5.45),
(null,'Salame','Charcutaria',9.99);

insert into venda values
(null,22.50,'2022-10-24',1),
(null,44.50,'2022-10-23',2),
(null,122.50,'2022-10-22',4),
(null,1.21,'2022-10-21',3),
(null,20.89,'2022-10-21',2);

insert into Carrinho values
(1,1,0.50,5),
(2,2,12.50,1),
(3,3,5.40,1),
(4,4,2.30,2),
(5,5,1.50,3),
(1,2,0.80,2);

select * from Cliente;	
select * from Endereco;
select * from produto;
select * from venda;
select * from Carrinho;

select * from Cliente
join venda on idCliente = FkCliente_Venda; 

select Cliente.nome, produto.NomeProduto, produto.Descricao, produto.preco, venda.IdVenda from Cliente
join venda on IdCliente = FkCliente_Venda
join produto on IdProduto = FkCliente_Venda
where IdCliente = '1';

select * from Cliente as c
join Cliente as i on i.IdCliente = c.FkCliente_Indicador;

select c.nome,c.email,i.nome'indicador' from Cliente as c
join Cliente as i on i.IdCliente = c.FkCliente_Indicador
where i.idCliente ='2';

select v.DataVenda,p.NomeProduto,c.quantidade from venda as v 
join Carrinho as c on c.fkVenda = v.IdVenda
join produto as p on p.IdProduto = c.FkProduto;

select min(preco)'Menor valor',max(preco)'Maior valor' from produto;

insert into Cliente values
(null,'Luis gustavo','luis.gustavo@teste.com',null);

select Cliente.nome, produto.NomeProduto, produto.Descricao, produto.preco, venda.IdVenda from Cliente
left join venda on IdCliente = FkCliente_Venda
left join produto on IdProduto = FkCliente_Venda;

select sum(distinct preco) from produto;

select SUM(preco)'Soma dos preços',
ROUND(AVG(preco),2)'Media dos preços' from Produto;

select count(preco)'quantidade de preços acima da média' from produto where preco >= (select avg(preco) from produto);

select SUM(p.preco)'Soma dos preços'
from produto as p 
join carrinho as c on p.IdProduto = c.FkProduto 
join venda as v on v.IdVenda = c.FkVenda where v.IdVenda = '2';
