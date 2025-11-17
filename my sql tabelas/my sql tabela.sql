drop database if exists loja;
create database loja;
use loja;
show databases;

create table produtos (
id int primary key auto_increment,
 nome varchar(100) not null,
 preco decimal (10, 2) not null,
 estoque int not null);
 
 desc produtos;
 
 create table vendas (
 id int primary key auto_increment,
 produto_id int,
 produtos varchar(100) not null,
 quantidade int not null,
 valor_total decimal(10,2) not null,
 data_venda date not null,
 foreign key (produto_id) references produtos (id));
 
 desc vendas;
 
 insert into produtos (nome, preco, estoque)values
('Cadeira de Escritório Ergonômica', 399.90, 12),
('Mouse Gamer RGB', 129.50, 35),
('Teclado Mecânico Blue Switch', 259.00, 18),
('Ventilador de Mesa 40cm', 89.99, 25),
('Fone de Ouvido Bluetooth', 149.00, 30),
('Monitor LED 24 Polegadas', 745.00, 9),
('Luminária de Mesa Articulada', 59.90, 40),
('Garrafa Térmica Inox 1L', 78.00, 22),
('Smartwatch Esportivo', 210.50, 15),
('Caixa de Som Portátil', 95.00, 28),
('Carregador Turbo USB-C', 49.99, 60),
('Mochila para Notebook 15.6', 119.00, 17),
('Aspirador de Pó Portátil', 189.00, 11),
('Câmera de Segurança Wi-Fi', 159.00, 14),
('Liquidificador 900W', 129.00, 20),
('Chaleira Elétrica 1.7L', 89.50, 30),
('Relógio de Parede Moderno', 45.00, 26),
('Kit Ferramentas 30 Peças', 75.00, 16),
('Trena de Aço 5m', 22.90, 50),
('Cooler Térmico 32L', 135.00, 10);

select*from produtos;

INSERT INTO vendas (produto_id, produtos, quantidade, valor_total, data_venda) VALUES
(1, 'Cadeira de Escritório Ergonômica', 399.90, 12, CURDATE() - INTERVAL 1 DAY),
(2, 'Mouse Gamer RGB', 129.50, 35, CURDATE() - INTERVAL 2 DAY),
(3, 'Teclado Mecânico Blue Switch', 259.00, 18, CURDATE() - INTERVAL 3 DAY),
(4, 'Ventilador de Mesa 40cm', 89.99, 25, CURDATE() - INTERVAL 4 DAY),
(5, 'Fone de Ouvido Bluetooth', 149.00, 30, CURDATE() - INTERVAL 5 DAY),
(6, 'Monitor LED 24 Polegadas', 745.00, 9, CURDATE() - INTERVAL 6 DAY),
(7, 'Luminária de Mesa Articulada', 59.90, 40, CURDATE() - INTERVAL 7 DAY),
(8, 'Garrafa Térmica Inox 1L', 78.00, 22, CURDATE() - INTERVAL 8 DAY),
(9, 'Smartwatch Esportivo', 210.50, 15, CURDATE() - INTERVAL 9 DAY),
(10, 'Caixa de Som Portátil', 95.00, 28, CURDATE() - INTERVAL 10 DAY),
(11, 'Carregador Turbo USB-C', 49.99, 60, CURDATE() - INTERVAL 11 DAY),
(12, 'Mochila para Notebook 15.6', 119.00, 17, CURDATE() - INTERVAL 12 DAY),
(13, 'Aspirador de Pó Portátil', 189.00, 11, CURDATE() - INTERVAL 13 DAY),
(14, 'Câmera de Segurança Wi-Fi', 159.00, 14, CURDATE() - INTERVAL 14 DAY),
(15, 'Liquidificador 900W', 129.00, 20, CURDATE() - INTERVAL 15 DAY),
(16, 'Chaleira Elétrica 1.7L', 89.50, 30, CURDATE() - INTERVAL 16 DAY),
(17, 'Relógio de Parede Moderno', 45.00, 26, CURDATE() - INTERVAL 17 DAY),
(18, 'Kit Ferramentas 30 Peças', 75.00, 16, CURDATE() - INTERVAL 18 DAY),
(19, 'Trena de Aço 5m', 22.90, 50, CURDATE() - INTERVAL 19 DAY),
(20, 'Cooler Térmico 32L', 135.00, 10, CURDATE() - INTERVAL 20 DAY);

select*from vendas;

select produtos data_vendas from vendas;

select*from vendas
where quantidade >= 150;
 
 select*from vendas
 where data_venda <= curdate() - interval 4 day;
 
 
 -- Delimitador temporario para criar o bloco de codigo 
 
 delimiter //
 create procedure AplicadorDeDescontoGeral(in porcentagen decimal(5, 2))
 begin
 
 -- Atualizara tabela de produtos aplicando o desconto
 
 update produtos
 set preco = preco * (1 - (porcentagen/100));
 
 -- informar quantas linhas foram afetadas 
 
 select concat('Desconto de', porcentagen, '% aplicado em', row_count(),
 'produtos.') as resultado;
 end //
 delimiter ;
 
 select*from produtos;
 
 set SQL_SAFE_UPDATES =0;
 call AplicadorDeDescontoGeral(15.0); 
  select*from produtos;