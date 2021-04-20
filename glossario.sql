create database db_estoque;                    			-- Criando banco de dados db_estoque.
use db_estoque;											-- Referenciando o banco de dados que será usado. 

create table tb_marcas (
	id bigint(5) auto_increment,		-- Criando atributo id do tipo inteiro com range de até 99999
										-- e declarando que ele incrementará automaticamente os ids.
    nome varchar(20) not null, 	-- Criando atributo nome com até 20 caracteres e que não aceita dados em branco. 
    ativo boolean,
    primary key(id)
);

select * from tb_marcas; 							-- Mostrando todas as linhas da tabela recém-criada;

insert into tb_marcas(nome, ativo) values("Nike", true);
insert into tb_marcas(nome, ativo) values("Fatal Surf", false);

select * from tb_marcas;

update tb_marcas set ativo = true where id = 2; 	 -- Atualizando o atributo ativo para true da linha de id = 2.

select nome from tb_marcas; 			-- Mostrando somente o atributo (coluna) nome de todas as linhas da tabela.

select * from tb_marcas where id <> 2;   			-- Mostrando todas as colunas da linha de id diferente de 2.

delete from tb_marcas where id = 1;				-- Deletando a linha de id = 1. Nota: o id deletado não é resetado,
												-- ou seja, não há reciclagem de id. Ele é perdido para sempre.

select * from tb_marcas where nome like "%fa%";  			-- Outra maneira de mostrar resultados é usando o like.

