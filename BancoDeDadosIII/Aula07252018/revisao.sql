create database if not exists escola;

use escola;

drop table if exists alunos;
create table alunos (
    rm int primary key auto_increment,
    data_nasc_al date,
    cpf_al int,
    sexo char,
    filiacao_al varchar(30),
    naturalidade_al varchar(30),
    nome_al varchar(30),
    endereco_al varchar(40),
    complemento_al varchar(40),
    bairro_al varchar(20),
    cidade_al varchar(20),
    uf_al varchar(20),
    rg_al varchar(20),
    cep_al int,
    fone_al int,
    email_al varchar(30)
);

drop table if exists funcionarios;
create table funcionarios (
    id_fun int primary key auto_increment,
    nome_fun varchar(30),
    rg_fun varchar(20)
);

drop table if exists professores;
create table professores ( 
    id_prof int primary key auto_increment,
    nome_prof varchar(30),
    rg_prof varchar(20)
);

drop table if exists emprestimos;
create table emprestimos( 
    id_emp int primary key auto_increment,
    data_emp date,
    data_dev date,
    id_liv int, 
    id_periodico int,
    id_tcc int,
    id_prof int,
    rm int,
    id_fun int
);

drop table if exists livros;
create table livros (
    id_liv int primary key auto_increment,
    titulo_livro varchar(30),
    isbn int,
    editora_liv varchar(40),
    autores varchar(50),
    ano int,
    edicao varchar(30)
);

drop table if exists periodicos;
create table periodicos (
    id_periodico int primary key auto_increment,
    nome_periodico varchar(20),
    data_periodico date
);

drop table if exists tccs;
create table tccs (
    id_tcc int primary key auto_increment,
    titulo_tcc varchar(20),
    autores_tcc varchar(50),
    data_tcc date
);

alter table emprestimos
    add foreign key (id_liv) references livros (id_liv),
    add foreign key (id_periodico) references periodicos (id_periodico),
    add foreign key (id_tcc) references tccs (id_tcc), 
    add foreign key (id_prof) references professores (id_prof),
    add foreign key (id_fun) references funcionarios (id_fun),
    add foreign key (rm) references alunos (rm);