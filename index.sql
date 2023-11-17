create schema biblioteca;
use biblioteca;

create table if not exists livros(
id_livro int primary key not null,
titulo varchar(255) not null,
autor varchar(255) not null,
ano_de_publicacao int not null,
disponibilidade tinyint(1) not null
);

insert into livros
(id_livro, titulo, autor, ano_de_publicacao, disponibilidade)
values
(1, 'A Revolta de Atlas', 'Ayn Rand', 1957, 1),
(2, 'Dom Quixote', 'Miguel de Cervantes', 1605, 1),
(3, '1984', 'George Orwell', 1949, 1);

create table if not exists usuarios(
id_usuario int primary key not null,
nome varchar(255) not null,
email varchar(255) not null,
telefone varchar(15) not null
);

insert into usuarios
(id_usuario, nome, email, telefone)
values
(1, 'Bernardo Mendes', 'email1@gmail.com', 99999-99999),
(2, 'Breno Daher', 'email2@gmail.com', 88888-88888),
(3, 'Giseli Rosa', 'email3@gmail.com', 77777-77777);

create table if not exists emprestimos(
id_emprestimo int primary key,
data_emprestimo date not null,
data_devolucao_prev date not null,
devolucao tinyint not null,
id_livro int,
constraint id_livro foreign key (id_livro) references livros(id_livro),
id_usuario int,
constraint id_usuario foreign key (id_usuario) references usuarios(id_usuario)
);

alter table emprestimos
modify column devolucao boolean default false;

insert into emprestimos
(id_emprestimo, data_emprestimo, data_devolucao_prev, id_livro, id_usuario)
values
(1, "2023-08-29", "2023-09-13", 1, 1),
(2, "2023-09-1", "2023-09-16", 2 , 2),
(3, "2023-09-17", "2023-09-30", 2, 1);
