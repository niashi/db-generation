-- Criando o banco de dados.
create database db_cidade_das_carnes;

-- Selecionando o banco de dados
use db_cidade_das_carnes;

-- Criando tabela tb_categoria.
create table tb_categoria (
	id int auto_increment primary key,
	descricao varchar (20) not null, 
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
insert tb_categoria (descricao, em_estoque) values ("Bovino", 550);
insert tb_categoria (descricao, em_estoque) values ("Suíno", 200);
insert tb_categoria (descricao, em_estoque) values ("Aves", 958);
insert tb_categoria (descricao, em_estoque) values ("Frutos do mar", 100);

-- Populando tb_produto.
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (1, "Picanha", 64.90, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (1, "Alcatra", 49.90, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (3, "Peito de frango", 10, 2);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (2, "Bacon", 14.90, 2);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (4, "Camarão", 29.90, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (4, "Lagosta", 149.90, 1);

-- Selecionando produtos cujo preço é maior que 50.
select * from tb_produto where preco > 50;

-- Selecionando produtos cujo preço está entre 3 e 60.
select * from tb_produto where preco between 3 and 60;

-- Selecionando produtos cujo nome começa com C.
select * from tb_produto where nome like "%c%";

-- Mostrando todos os produtos e os atributos das duas tabelas em conjunto. Usando a tb_produto.id_categoria para fazer referência à tb_categoria.id.
select descricao as descrição, em_estoque as "quantia em estoque", tb_produto.nome, tb_produto.preco as preço, tb_produto.quantiaAdquirida as "quantia adquirida"
from tb_categoria inner join tb_produto on tb_categoria.id = tb_produto.id_categoria;

-- Mostrando todos os produtos que são frutos do mar e os atributos das duas tabelas em conjunto. Usando a tb_produto.id_categoria para fazer referência à tb_categoria.id.
select descricao as descrição, em_estoque as "quantia em estoque", tb_produto.nome, tb_produto.preco as preço, tb_produto.quantiaAdquirida as "quantia adquirida"
from tb_categoria inner join tb_produto on tb_categoria.id = tb_produto.id_categoria 
where tb_categoria.descricao = "Frutos do mar";
