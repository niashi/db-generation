create database exercicio_escola;

use exercicio_escola;

create table tb_alunos (
	id bigint(5) auto_increment,
	nome varchar(20) not null,
    matricula bigint(5),
    professor varchar(20),
    serie bigint(3),
    nota decimal(10,2),
	primary key(id)
);

select * from tb_alunos;

insert into tb_alunos(nome, matricula, professor, serie, nota) values("Jaqueline Azambuja", 10254, "Guanabara", 8, 10);
insert into tb_alunos(nome, matricula, professor, serie, nota) values("Mathias Niashi", 10255, "Ed", 8, 10);
insert into tb_alunos(nome, matricula, professor, serie, nota) values("José Silva", 1044, "Cristian", 6, 5.9);
insert into tb_alunos(nome, matricula, professor, serie, nota) values("Ingrid Guimarães", 399, "Renato", 3, 3);
insert into tb_alunos(nome, matricula, professor, serie, nota) values("Felipe Melo", 1044, "Amélia", 7, 6.5);

select * from tb_alunos;

select * from tb_alunos where nota > 7;

select * from tb_alunos where nota < 7;

update tb_alunos set nome = "Felipe Neto", professor = "Anastácia" where id = 5;

select * from tb_alunos;