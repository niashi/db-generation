-- Criando o banco de dados.
create database db_cursoDaMinhaVida;

-- Selecionando o banco de dados
use db_cursoDaMinhaVida;

-- Criando tabela tb_categoria.
create table tb_categoria (
	id int auto_increment primary key,
	modalidade varchar (20), -- Presencial, à distância, semi-presencial
    duracao varchar (20),
	area_atuacao varchar (20) -- Front-end, back-end, pré-vestibular, EJA...
);

-- Criando tabela tb_produto.
create table tb_curso (
	id int auto_increment primary key,
    id_categoria int,
	nome varchar (20) not null,
    preco bigint (5),
    ano_lancamento bigint (5),
    professor varchar (20),
    qt_alunos bigint (5),
    foreign key (id_categoria) references tb_categoria (id)
);

-- Populando tb_categoria.
insert into tb_categoria (modalidade, duracao, area_atuacao) values ("À distância", "6 meses", "Front-end");	
insert into tb_categoria (modalidade, duracao, area_atuacao) values ("Presencial", "12 meses", "Pré-vestibular");
insert into tb_categoria (modalidade, duracao, area_atuacao) values ("Semi-presencial", "10 meses", "Banco de Dados");

-- Populando tb_curso.
insert into tb_curso (id_categoria, nome, preco, ano_lancamento, professor, qt_alunos) values (1, "HTML", 50, 2015, "Mathias", 150);
insert into tb_curso (id_categoria, nome, preco, ano_lancamento, professor, qt_alunos) values (1, "CSS", 50, 2015, "Mathias", 200);
insert into tb_curso (id_categoria, nome, preco, ano_lancamento, professor, qt_alunos) values (1, "JS", 150, 2015, "Mathias", 550);
insert into tb_curso (id_categoria, nome, preco, ano_lancamento, professor, qt_alunos) values (2, "História", 150, 2012, "Nicolas", 80);
insert into tb_curso (id_categoria, nome, preco, ano_lancamento, professor, qt_alunos) values (2, "Biologia", 200, 2012, "Jaqueline", 120);

-- Selecionando cursos cujo preço é maior que 50.
select * from tb_curso where preco > 50;

-- Selecionando cursos cujo preço está entre 3 e 60.
select * from tb_curso where preco between 3 and 60;

-- Selecionando cursos cujo nome começa com J.
select * from tb_curso where nome like "%j%";

-- Mostrando todos os cursos e os atributos das duas tabelas em conjunto. Usando a tb_curso.id_categoria para fazer referência à tb_categoria.id.
select modalidade, duracao as duração, area_atuacao as "área de atuação", tb_curso.nome, tb_curso.preco as preço, tb_curso.ano_lancamento as "ano de lançamento"
from tb_categoria inner join tb_curso on tb_categoria.id = tb_curso.id_categoria;

-- Mostrando todos os cursos da categoria front-end e os atributos das duas tabelas em conjunto. Usando a tb_curso.id_categoria para fazer referência à tb_categoria.id.
select modalidade, duracao as duração, area_atuacao as "área de atuação", tb_curso.nome, tb_curso.preco as preço, tb_curso.ano_lancamento as "ano de lançamento"
from tb_categoria inner join tb_curso on tb_categoria.id = tb_curso.id_categoria 
where tb_categoria.area_atuacao = "Front-end";
