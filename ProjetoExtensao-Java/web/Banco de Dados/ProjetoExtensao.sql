create database projetoExtensao;
use projetoExtensao;

create table projeto(
idProj int(11) primary key auto_increment not null,
nomeProj varchar(150) not null,
objGeral longtext not null,
objEspe longtext not null,
professor varchar(250) not null,
curso varchar(20) not null
);

create table relatorio(
idRel int(11) primary key auto_increment not null,
atividadeRel longText not null,
dataRel varchar(11) not null,
fkProj int(11) not null
);


create table viceReitora(
idReitora int(11) primary key auto_increment not null,
usuario varchar(150) not null,
senha varchar(150) not null
);

insert into viceReitora(usuario, senha)
value
	("admin", "1234");
    
