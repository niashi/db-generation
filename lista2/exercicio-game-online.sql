-- Criando o banco de dados.
create database db_generation_game_online;

-- Selecionando o banco de dados
use db_generation_game_online;

-- Criando tabela tb_classe.
create table tb_classe (
	id int auto_increment primary key,
	nome_classe varchar (20) not null,
    raca varchar (20),
    atributo_principal varchar (20)
);

-- Criando tabela tb_personagem.
create table tb_personagem (
	id int auto_increment primary key,
    id_classe int,
	nome varchar (20) not null,
    nivel bigint (5),
	vida bigint (5),
	ataque bigint (5),
	defesa bigint (5),
    foreign key (id_classe) references tb_classe (id)
);

-- Populando tb_classe.
insert tb_classe (nome_classe, raca, atributo_principal) values ("Arqueiro", "Elfo" , "Destreza");
insert tb_classe (nome_classe, raca, atributo_principal) values ("Mago de Batalha", "Anjo" , "Inteligência");
insert tb_classe (nome_classe, raca, atributo_principal) values ("Gatuno", "Humano" , "Sorte");
insert tb_classe (nome_classe, raca, atributo_principal) values ("Lanceiro", "Humano" , "Força");

-- Populando tb_personagem.
insert tb_personagem (id_classe, nome, nivel, vida, ataque, defesa) values (1, "Arcot", 72, 5000, 7200, 5500);
insert tb_personagem (id_classe, nome, nivel, vida, ataque, defesa) values (2, "Trento", 55, 4500, 5000, 5200);
insert tb_personagem (id_classe, nome, nivel, vida, ataque, defesa) values (4, "Anrol", 40, 2500, 4500, 2000);
insert tb_personagem (id_classe, nome, nivel, vida, ataque, defesa) values (3, "Layla", 66, 3400, 6000, 4000);
insert tb_personagem (id_classe, nome, nivel, vida, ataque, defesa) values (4, "Cyan", 10, 700, 1150, 500);

-- Selecionando personagens cujo ataque é maior que 2000.
select * from tb_personagem where ataque > 2000;

-- Selecionando personagens cujo ataque está entre 1000 e 2000.
select * from tb_personagem where ataque between 1000 and 2000;

-- Selecionando personagens cujo nome começa com C.
select * from tb_personagem where nome like "%c%";

-- Mostrando todos os personagens e os atributos das duas tabelas em conjunto. Usando a tb_personagem.id_classe para fazer referência à tb_classe.id
select nome, nivel, vida, ataque, defesa, tb_classe.nome_classe as classe, tb_classe.raca as raça, tb_classe.atributo_principal as atributo 
from tb_classe inner join tb_personagem on tb_classe.id = tb_personagem.id_classe;

-- Mostrando todos os personagens arqueiros e os atributos das duas tabelas em conjunto. Usando a tb_personagem.id_classe para fazer referência à tb_classe.id
select tb_personagem.nome, tb_personagem.ataque as ataque, tb_personagem.defesa, tb_personagem.vida as "pontos de vida", tb_classe.nome_classe as classe, 
tb_classe.raca as raça, tb_classe.atributo_principal from tb_classe inner join tb_personagem on tb_classe.id = tb_personagem.id_classe where tb_classe.nome_classe = "Arqueiro";
