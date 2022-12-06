-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE banco_museu;
USE banco_museu;


CREATE TABLE autor (
cod_autor int PRIMARY KEY,
nacionalidade_autor char(3) not null,
nome_autor varchar(80) not null
);

CREATE TABLE salao (
cod_salao int PRIMARY KEY,
num_salao int not null,
andar_museu int not null,
salao varchar(80) not null
);

CREATE TABLE salao_obra (
salao_cod_salao int not null,
obra_cod_obra int not null,
posicao_salao varchar(80) not null,
FOREIGN KEY(salao_cod_salao) REFERENCES salao (cod_salao)
);

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int PRIMARY KEY,
tipo_funcionario varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

CREATE TABLE obra (
cod_obra int PRIMARY KEY,
ano_obra year not null,
titu_obra varchar(80) not null unique,
peso_obra decimal(10,2) null,
material_obra varchar(80) null,
desc_estilo_obra varchar(80) null,
cod_autor int not null,
cod_tipo_obra int not null,
FOREIGN KEY(cod_autor) REFERENCES autor (cod_autor)
);

CREATE TABLE tipo_obra (
cod_tipo_obra int PRIMARY KEY,
desc_tipo_obra varchar(80) not null
);

CREATE TABLE atividade (
ob_cod_obra int not null,
func_id_funcionario int not null,
hora_entrada time not null,
hora_saida time not null,
data_atividade date not null,
FOREIGN KEY(ob_cod_obra) REFERENCES obra (cod_obra),
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE manutencao (
mnt_obra int PRIMARY KEY,
data_termi_mnt date not null,
custo_mnt decimal(10,2) not null,
data_ini_mnt date not null,
desc_mnt varchar(80) not null,
cod_obra int not null,
func_id_funcionario int not null,
FOREIGN KEY(cod_obra) REFERENCES obra (cod_obra),
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE materia_prima (
cod_mat_prima int PRIMARY KEY,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);

CREATE TABLE manu_mat (
Campo_1 int not null,
Campo_2 int not null,
qtd_mat_mnt varchar(15) not null,
FOREIGN KEY(Campo_1) REFERENCES manutencao (mnt_obra),
FOREIGN KEY(Campo_2) REFERENCES materia_prima (cod_mat_prima)
);

ALTER TABLE salao_obra ADD FOREIGN KEY(obra_cod_obra) REFERENCES obra (cod_obra);
ALTER TABLE obra ADD FOREIGN KEY(cod_tipo_obra) REFERENCES tipo_obra (cod_tipo_obra);

insert into tipo_obra (cod_tipo_obra, desc_tipo_obra) VALUES
(1,"Pintura"),
(2,"Escultura");


insert into obra (cod_obra, ano_obra, titu_obra, desc_estilo_obra, cod_autor, cod_tipo_obra) values
(1, 1964, "O Choro", "Impressionismo", 4, 1),
(2, 1998, "A Última Ceia","Surrealismo", 9, 1),
(3, 1989, "A Noite Estrelada","Cubismo", 18, 1),
(4, 1998, "A Persistência", "Neoimpressionismo", 13, 1),
(5, 1942, "A Criação de Adão", "Futurismo", 8, 1),
(6, 2011, "Medusa", "Realista", 1, 1),
(7, 1954,"A Ronda Noturna", "Surrealismo" ,3, 1),
(8, 1921, "O Massacre dos Inocentes", "Impressionismo", 8, 1),
(9, 1948, "A Escola de Atenas", "Cubismo", 17,1),
(10, 1911, "Olympia", "Barroco", 20, 1);

insert into obra (cod_obra, ano_obra, titu_obra, peso_obra, material_obra, cod_autor, cod_tipo_obra) values
(11, 1904, "David", 5000, "Mármore", 1, 2),
(12, 1999, "Pietà", 5000, "Mármore", 1, 2),
(13, 1920, "Vênus de Milo", 900, "Mármore", 2, 2),
(14, 2000, "Balloon Dog", 1000, "Aço", 3, 2),
(15, 1996, "Spider", 280, "Aço", 4, 2),
(16, 1908, "Vénus de Willendorf", 2200, "Argila", 5,2),
(17, 1945, "Busto de Nefertiti", 2660, "Barro", 6, 2),
(18, 1924, "Exército de Terracota", 10000, "Barro", 7, 2),
(19, 1904, "O Pensador", 3000, "Mármore", 8, 2),
(20, 1972, "Anjo do Norte", 1994, "Aço", 9, 2);


insert into tipo_funcionario (cod_tipo_funcionario, tipo_funcionario) VALUES
(1, "Guarda"),
(2, "Restaurador"),
(3, "Operário de Limpeza");

insert into funcionario(id_funcionario,nome_funcionario, salario_funcionario, cpf_funcionario,cod_tipo_funcionario)
VALUES
(1,"Ivo Marcos Riegel", 3.500, "103.285.523-37",1 ),
(2,"Rosana da Silva", 2.500, "123.234.238-44",2 ),
(3,"Tobias Ferraz", 2.000, "532.724.849-56" ,3),
(4,"Angelita Chortazsko", 2.500, "753.056.476-45",1 ),
(5,"Adão Luís da Rocha", 2.000, "098.726.093-34",2 ),
(6,"Héder Luciano Lyra Rosa", 3.500, "042.826.258-98",3 ),
(7,"Eduardo da Silva", 3.500, "172.183.195-23",1 ),
(8,"Ana Luiza Dias da Rocha", 4.500, "152.396.134-76",2 ),
(9,"Rosângela Dias dos Santos", 2.500, "256.268.152-21",3 ),
(10,"Inês Gomes da Silva", 2.500, "258.245.149-08" ,1),
(11,"Marco Antônio Rojas", 2.000, "213.368.244-11", 2),
(12,"Ademilton Azevedo de Arruda Júnior", 3.500, "124.978.481-33",3 ),
(13,"Larissa Bileski", 4.500, "234.846.571-54",1 ),
(14,"João Paulo Orlando ", 3.500, "369.426.358-13",2 ),
(15,"Vinicius Henrique da Silva", 1.000, "216.435.252.11",3 ),
(16,"Ana Paula de Souza", 4.500, "359.875.984-87",1 ),
(17,"Lui Fellippe da Silva Bellincantta Mollossi", 3.500, "456.846.351-22",2 ),
(18,"Greice Ane Barbieri", 2.000, "357.478.474-56",3 ),
(19,"Fábio Longo de Mouro", 2.000, "568.283.292-10",1 ),
(20,"Clodoaldo José Figueredo", 2.500, "486.465.261-29",2 );

insert into manutencao (mnt_obra, data_termi_mnt, custo_mnt, data_ini_mnt, desc_mnt, cod_obra, func_id_funcionario)
values 
(2, '2005-04-12', 2.300, '2008-09-21', "Manutenção Corretiva ", 2, 2),
(3, '2010-03-16', 1.000, '2005-12-07', "Manutenção Preditiva", 3, 3),
(4, '2004-02-06', 3.500, '2013-09-20', "Manutenção Corretiva", 4, 4),
(5, '2004-05-09', 4.000, '2006-09-09', "Manutenção Preditiva", 5, 5),
(6, '2009-01-08', 2.300, '2001-09-21', "Manutenção Preventiva", 6, 6),
(7, '2011-05-09', 2.700, '2004-09-03', "Manutenção Corretiva", 7, 7),
(8, '2001-04-09', 3.000, '2008-10-11', "Manutenção Preventiva", 8, 8),
(9, '2008-05-09', 2.040, '2007-10-09', "Manutenção Preditiva", 9, 9),
(10, '2003-05-30', 4.000, '2009-08-09', "Manutenção Preventiva", 10, 10),
(11, '2005-09-21', 7.000, '2004-08-09', "Manutenção Corretiva", 11, 11),
(12, '2009-04-08', 2.200, '2003-09-05', "Manutenção Preventiva", 12, 12),
(13, '2005-09-26', 5.000, '2010-03-09', "Manutenção Preditiva", 13, 13),
(14, '2006-11-09', 2.000, '2009-01-02', "Manutenção Preventiva", 14, 14),
(15, '2007-05-14', 5.300, '2001-02-03', "Manutenção Corretiva", 15, 15),
(16, '2005-07-13', 1.900, '2010-09-03', "Manutenção Preventiva", 16, 16),
(17, '2002-09-12', 2.050, '2009-01-06', "Manutenção Corretiva", 17, 17),
(18, '2008-10-09', 3.500, '2008-09-04', "Manutenção Preditiva", 18, 18),
(19, '2010-09-21', 2.500, '2010-06-08', "Manutenção Preventiva", 19, 19),
(20, '2008-09-19', 5.000, '2010-08-08', "Manutenção Corretiva", 20, 20);

insert into atividade(ob_cod_obra, func_id_funcionario, hora_entrada, hora_saida, data_atividade)
values
(1, 1, "11:30:10","11:30:10", '2022-04-22' ),
(2, 2, "12:30:10","12:30:10", '2022-01-12' ),
(3, 3, "13:30:10","13:30:10", '2022-03-13' ),
(4, 4, "14:30:10","14:30:10", '2022-06-23' ),
(5, 5, "15:30:10","15:30:10", '2022-09-20' ),
(6, 6, "16:30:10","16:30:10", '2022-03-15' ),
(7, 7, "17:30:10","17:30:10", '2022-06-05' ),
(8, 8, "18:30:10","18:30:10", '2022-03-13' ),
(9, 9, "19:30:10","19:30:10", '2022-07-02' ),
(10, 10, "11:30:10","20:30:10", '2022-03-08' ),
(11, 11, "12:30:10","21:30:10", '2022-03-07' ),
(12, 12, "13:30:10","22:30:10", '2022-03-04' ),
(13, 13, "14:30:10","22:30:10", '2022-03-02' ),
(14, 14, "15:30:10","23:30:10", '2022-09-20' ),
(15, 15, "16:30:10","23:30:10", '2022-04-22' ),
(16, 16, "17:30:10","24:30:10", '2022-03-13' ),
(17, 17, "18:30:10","11:30:10", '2022-07-12' ),
(18, 18, "19:30:10","13:30:10", '2022-03-19' ),
(19, 19, "20:30:10","16:30:10", '2022-07-11' ),
(20, 20, "19:30:10","15:30:10", '2022-08-04' );

insert into salao (cod_salao, num_salao, andar_museu, salao)
values 
(1,101, 1, "Salão de arte Brasileira"),
(2,102, 1, "Salão de arte Francesa"),
(3,103, 1, "Salão de arte Italiana"),
(4,104, 1, "Salão de arte Alemã"),
(5,105, 1, "Salão de arte Canadense"),
(6,201, 2, "Salão de arte Aquarela"),
(7,202, 2, "Salão de arte Oléo"),
(8,203, 2, "Salão de arte Giz"),
(9,204, 2, "Salão de arte Ultra Violeta"),
(10,205, 2, "Salão de arte Grafite"),
(11,301, 3, "Salão de arte Surrealista"),
(12,302, 3, "Salão de arte Minimalista"),
(13,303, 3, "Salão de arte Cubista"),
(14,304, 3, "Salão de arte Abstrata"),
(15,305, 3, "Salão de arte Futurista"),
(16,401, 4, "Salão de arte Expressionista"),
(17,402, 4, "Salão de arte Dadaísta"),
(18,403, 4, "Salão de arte Falvista"),
(19,404, 4, "Salão de arte Realista"),
(20,405, 4, "Salão de arte Minimalista");

insert into salao_obra (salao_cod_salao, obra_cod_obra, posicao_salao)
values 
(1,1,"centro"),
(2,2,"canto superior esquerdo"),
(3,3,"canto superior esquerdo"),
(4,4,"canto inferior esquerdo"),
(5,5,"canto inferior direito"),
(6,6,"canto superior direito"),
(7,7,"canto inferior esquerdo"),
(8,8,"canto superior esquerdo"),
(9,9,"centro"),
(10,10,"canto inferior esquerdo"),
(11,11,"canto inferior direito"),
(12,12,"canto superior direito"),
(13,13,"canto inferior esquerdo"),
(14,14,"centro"),
(15,15,"canto inferior direito"),
(16,16,"canto superior direito"),
(17,17,"canto inferior esquerdo"),
(18,18,"canto superior esquerdo"),
(19,19,"centro"),
(20,20,"canto inferior esquerdo");

insert into autor(cod_autor, nacionalidade_autor, nome_autor)
values 
(1,"BRA", "Klaus Mikaelson"),
(2,"ALE", "Dwight Schrute"),
(3,"EUA", "Barney Stinson"),
(4,"ALE", "Phil Dunphy"),
(5,"ING", "Michael Scott"),
(6,"BRA", "Marshall Eriksen"),
(7,"ING", "Claire Dunphy"),
(8,"SUE", "Jim Halpert"),
(9,"FIN", "Elena Gilbert"),
(10,"POR", "Lorerai Gilmore"),
(11,"ALE", "Lukes Danes"),
(12,"FRA", "Caroline Forbes"),
(13,"ITA", "Jesse Pinkman"),
(14,"ITA", "Serena Vanderousen"),
(15,"ING", "Blair Waldorf"),
(16,"ALE", "Cameron Tucker"),
(17,"JAP", "George Omaley"),
(18,"MEX", "Izzie Stevens"),
(19,"CAN", "Robin Scherbatsky"),
(20,"BRA", "Lamar Janes");

insert into materia_prima (cod_mat_prima, qtd_est_mat, nome_mat_prima)
values 
(1, 5, "argila"),
(2, 3, "barro"),
(3, 5, "ceramica"),
(4, 8, "barro"),
(5, 3, "argila"),
(6, 10, "marmore"),
(7, 5, "ouro"),
(8, 5, "perola"),
(9, 3, "pedra"),
(10, 2, "pedra"),
(11, 10, "barro"),
(12, 15, "argila"),
(13, 3, "argila"),
(14, 2, "ouro"),
(15, 3, "barro"),
(16, 7, "perola"),
(17, 2, "barro"),
(18, 9, "ceramica"),
(19, 4, "marmore"),
(20, 6, "madeira");


insert into manu_mat(Campo_1, Campo_2, qtd_mat_mnt)
values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2),
(6, 6, 3),
(7, 7, 1),
(8, 8, 2),
(9, 9, 3),
(10, 10, 1),
(11, 11, 2),
(12, 12, 3),
(13, 13, 1),
(14, 14, 2),
(15, 15, 3),
(16, 16, 2),
(17, 17, 1),
(18, 18, 1),
(19, 19, 2),
(20, 20, 2);

