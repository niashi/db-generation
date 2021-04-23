-- Criando o banco de dados.
create database db_pizzaria_legal;

-- Selecionando o banco de dados
use db_pizzaria_legal;

-- Criando tabela tb_categoria.
create table tb_categoria (
	id int auto_increment primary key,
	tipo_massa varchar (20),
    tamanho varchar (20),
	sabor varchar (20)
);

-- Criando tabela tb_pizza.
create table tb_pizza (
	id int auto_increment primary key,
    id_categoria int,
	nome varchar (20) not null,
	sabor varchar (20),
    preco decimal (5,2),
    adicional varchar (20),
    meio_meio boolean,
    foreign key (id_categoria) references tb_categoria (id)
);

-- Populando tb_categoria.
insert tb_categoria (tipo_massa, tamanho, sabor) values ("Grossa", "Grande" , "Salgada");
insert tb_categoria (tipo_massa, tamanho, sabor) values ("Fina", "Broto" , "Doce");
insert tb_categoria (tipo_massa, tamanho, sabor) values ("Fina", "Grande" , "Salgada");

-- Populando tb_pizza.
insert tb_pizza (id_categoria, nome, sabor, preco, adicional, meio_meio) values (1, "Clássica", "Marguerita", 49.90, "queijo muçarela", false);
insert tb_pizza (id_categoria, nome, sabor, preco, adicional, meio_meio) values (1, "Queijos", "4 queijos", 55.00, "nenhum", true);
insert tb_pizza (id_categoria, nome, sabor, preco, adicional, meio_meio) values (3, "Do mar", "Camarão", 60.00, "lagosta", false);
insert tb_pizza (id_categoria, nome, sabor, preco, adicional, meio_meio) values (3, "Carne seca", "Carne e catupiry", 55.00, "carne extra", false);
insert tb_pizza (id_categoria, nome, sabor, preco, adicional, meio_meio) values (3, "Salame fino", "Pepperoni", 55.00, "nenhum", true);

-- Selecionando personagens cujo ataque é maior que 2000.
select * from tb_pizza where preco > 45;

-- Selecionando personagens cujo ataque está entre 1000 e 2000.
select * from tb_pizza where preco between 29 and 60;

-- Selecionando personagens cujo nome começa com C.
select * from tb_pizza where nome like "%c%";

-- Mostrando todas as pizzas e os atributos das duas tabelas em conjunto. Usando a tb_pizza.id_categoria para fazer referência à tb_categoria.id.
select tipo_massa as "tipo de massa", tamanho, tb_categoria.sabor as "salgada ou doce", tb_pizza.nome, tb_pizza.sabor, tb_pizza.preco, tb_pizza.adicional, tb_pizza.meio_meio as "meio a meio"
from tb_categoria inner join tb_pizza on tb_categoria.id = tb_pizza.id_categoria;

-- Mostrando todas as pizzas com massa grossa e os atributos das duas tabelas em conjunto. Usando a tb_pizza.id_categoria para fazer referência à tb_categoria.id.
select tipo_massa as "tipo de massa", tamanho, tb_categoria.sabor, tb_pizza.nome, tb_pizza.sabor, tb_pizza.preco, tb_pizza.adicional, tb_pizza.meio_meio as "meio a meio"
from tb_categoria inner join tb_pizza on tb_categoria.id = tb_pizza.id_categoria where tb_categoria.tipo_massa = "Grossa";

-- Debuggar: tb_categoria.tamanho = "Broto" não retorna nada.
