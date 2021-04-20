create database exercicio_rh;

use exercicio_rh;

create table tb_funcionarios (
	id bigint(5) auto_increment,
	nome varchar(20) not null,
    idade int,
    setor varchar(20),
    felicidade boolean,
    salario decimal(10,2),
	primary key(id)
);

select * from tb_funcionarios;

insert into tb_funcionarios(nome, idade, setor, felicidade, salario) values("Igor", 33, "Financeiro", 0, 636.5);
insert into tb_funcionarios(nome, idade, setor, felicidade, salario) values("Jaqueline", 19, "TI", 1, 10000);
insert into tb_funcionarios(nome, idade, setor, felicidade, salario) values("Luiz", 29, "Segurança", 1, 2500);
insert into tb_funcionarios(nome, idade, setor, felicidade, salario) values("Haroldo", 70, "Jurídico", 0, 1750);
insert into tb_funcionarios(nome, idade, setor, felicidade, salario) values("Mathias", 26, "TI", 1, 10000);

select * from tb_funcionarios;

select * from tb_funcionarios where salario > 2000;

select * from tb_funcionarios where salario < 2000;

update tb_funcionarios set nome = "Andreia" where id = 3;

select * from tb_funcionarios;