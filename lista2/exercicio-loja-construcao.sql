-- Criando o banco de dados.
create database db_construindo_a_nossa_vida;

-- Selecionando o banco de dados
use db_construindo_a_nossa_vida;

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
insert tb_categoria (descricao, em_estoque) values ("Cimentos e argamassa", 10000);
insert tb_categoria (descricao, em_estoque) values ("Louças", 400);
insert tb_categoria (descricao, em_estoque) values ("Vidros", 958);
insert tb_categoria (descricao, em_estoque) values ("Pisos", 85400);

-- Populando tb_produto.
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (2, "Vaso sanitário", 499.90, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (1, "Cimento", 49.90, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (3, "Janela 2x2", 999.90, 2);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (2, "Piso Porto-Bello", 29.90, 30);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (4, "Pia para banheiro", 299.90, 1);
insert tb_produto (id_categoria, nome, preco, quantiaAdquirida) values (4, "Argamassa", 39.90, 1);

-- Selecionando produtos cujo preço é maior que 50.
select * from tb_produto where preco > 50;

-- Selecionando produtos cujo preço está entre 3 e 60.
select * from tb_produto where preco between 3 and 60;

-- Selecionando produtos cujo nome começa com C.
select * from tb_produto where nome like "%c%";

-- Mostrando todos os produtos e os atributos das duas tabelas em conjunto. Usando a tb_produto.id_categoria para fazer referência à tb_categoria.id.
select descricao as descrição, em_estoque as "quantia em estoque", tb_produto.nome, tb_produto.preco as preço, tb_produto.quantiaAdquirida as "quantia adquirida"
from tb_categoria inner join tb_produto on tb_categoria.id = tb_produto.id_categoria;

-- Mostrando todos os produtos que são louças e os atributos das duas tabelas em conjunto. Usando a tb_produto.id_categoria para fazer referência à tb_categoria.id.
select descricao as descrição, em_estoque as "quantia em estoque", tb_produto.nome, tb_produto.preco as preço, tb_produto.quantiaAdquirida as "quantia adquirida"
from tb_categoria inner join tb_produto on tb_categoria.id = tb_produto.id_categoria 
where tb_categoria.descricao = "Louças";
