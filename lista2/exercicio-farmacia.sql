-- Criando o banco de dados.
create database db_farmacia_do_bem;

-- Selecionando o banco de dados
use db_farmacia_do_bem;

-- Criando tabela tb_categoria.
create table tb_categoria (
	id int auto_increment primary key,
	categoria varchar (20) not null, 
    em_estoque bigint (5)
);

-- Criando tabela tb_produto.
create table tb_produto (
	id int auto_increment primary key,
    id_categoria int,
	nome varchar (20) not null,
	preco decimal (5,2),
    quantiaAdquirida bigint (5),
    foreign key (id_categoria) references tb_categoria (id)
);

-- Populando tb_categoria.
insert tb_categoria (categoria, em_estoque) values ("Medicamento", 50000);
insert tb_categoria (categoria, em_estoque) values ("Chicletes", 1500);
insert tb_categoria (categoria, em_estoque) values ("Cuidados para pele", 5405);
insert tb_categoria (categoria, em_estoque) values ("Saúde íntima", 10000);

-- Populando tb_produto.
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (1, "Aspirina", 10, 2);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (1, "Eno", 5.50, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (3, "Valda", 2, 5);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (2, "Manteiga de cacau", 9.90, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (4, "Absorvente", 10, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (1, "Coronavac", 999.9, 3);

-- Selecionando produtos cujo preço é maior que 50.
select * from tb_produto where preco > 50;

-- Selecionando produtos cujo preço está entre 3 e 60.
select * from tb_produto where preco between 3 and 60;

-- Selecionando produtos cujo nome começa com B.
select * from tb_produto where nome like "%b%";

-- Mostrando todos os produtos e os atributos das duas tabelas em conjunto. Usando a tb_produto.id_categoria para fazer referência à tb_categoria.id.
select categoria, em_estoque as "quantia em estoque", tb_produto.nome, tb_produto.preco as preço, tb_produto.quantiaAdquirida as "quantia adquirida"
from tb_categoria inner join tb_produto on tb_categoria.id = tb_produto.id_categoria;

-- Mostrando todos os produtos que são medicamentos e os atributos das duas tabelas em conjunto. Usando a tb_produto.id_categoria para fazer referência à tb_categoria.id.
select categoria, em_estoque as "quantia em estoque", tb_produto.nome, tb_produto.preco as preço, tb_produto.quantiaAdquirida as "quantia adquirida"
from tb_categoria inner join tb_produto on tb_categoria.id = tb_produto.id_categoria 
where tb_categoria.categoria = "Medicamento";
