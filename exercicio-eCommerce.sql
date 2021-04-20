create database exercicio_eCommerce;

use exercicio_eCommerce;

create table tb_produtos (
	id bigint(5) auto_increment,
	nome varchar(20) not null,
    codigo bigint(5),
    marca varchar(20),
    estoque bigint(5),
    preco decimal(10,2),
	primary key(id)
);

select * from tb_produtos;

insert into tb_produtos(nome, codigo, marca, estoque, preco) values("Salgadinho Fandangos", 101, "Elma Chips", 1245, 5.50);
insert into tb_produtos(nome, codigo, marca, estoque, preco) values("Energético", 202, "Monster", 501, 12);
insert into tb_produtos(nome, codigo, marca, estoque, preco) values("Revista Recreio", 303, "Abril", 150, 9.90);
insert into tb_produtos(nome, codigo, marca, estoque, preco) values("Chiclets", 404, "Adams", 3450, 1.50);
insert into tb_produtos(nome, codigo, marca, estoque, preco) values("Gelo", 505, "Geol", 50, 15);

select * from tb_produtos;

select * from tb_produtos where preco > 500;

select * from tb_produtos where preco < 500;

update tb_produtos set nome = "Mentos", marca = "Perfetti Van Melle" where id = 4;

select * from tb_produtos;