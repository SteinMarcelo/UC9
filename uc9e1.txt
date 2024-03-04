#EXERCÍCIO 1
#VENDEDOR (nrvendedor, nomevendedor, idade, salario)
#PEDIDO (nr_pedido, nrvendedor, nrcliente, quantidade_itens, valor_total)
#CLIENTE (nrcliente, nomecliente, cidade, tipo)


CREATE DATABASE uc9e1;

CREATE TABLE `vendedor` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) DEFAULT '',
  `dt_nasc` DATE DEFAULT '0000-00-00',
  `salario` DECIMAL(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`));

CREATE TABLE pedido (
id INT(10) NOT NULL AUTO_INCREMENT,
id_vendedor INT(10) NOT NULL DEFAULT '0',
id_cliente INT(10) NOT NULL DEFAULT '0',
qtd_item INT(10) NOT NULL DEFAULT '0',
vlr_total DECIMAL(10,2) DEFAULT '0.0',
PRIMARY KEY (id),
FOREIGN KEY (id_vendedor) REFERENCES vendedor(id),
FOREIGN KEY (id_cliente) REFERENCES cliente(id)) ;

CREATE TABLE cliente (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) DEFAULT '',
  `cidade` VARCHAR(50) DEFAULT '' ,
  `tipo` VARCHAR(30) DEFAULT '',
  PRIMARY KEY (id));
  
  
  
 INSERT INTO uc9e1.vendedor (nome, dt_nasc, salario) VALUES
  ('João Silva', '1980-03-15', 60000.00),
  ('Maria Oliveira', '1985-07-22', 55000.00),
  ('Carlos Pereira', '1992-01-10', 48000.00),
  ('Ana Santos', '1988-09-05', 52000.00),
  ('Rafael Costa', '1995-04-18', 58000.00),
  ('Isabela Lima', '1982-12-30', 62000.00),
  ('Pedro Oliveira', '1990-06-12', 55000.00),
  ('Camila Almeida', '1987-08-25', 51000.00),
  ('Lucas Souza', '1993-11-08', 49000.00),
  ('Larissa Mendes', '1984-02-20', 54000.00),
  ('Fernando Santos', '1998-07-01', 60000.00),
  ('Mariana Costa', '1989-04-14', 53000.00),
  ('Daniel Lima', '1994-09-28', 57000.00),
  ('Carolina Pereira', '1986-03-03', 56000.00),
  ('Gustavo Oliveira', '1991-12-10', 60000.00),
  ('Lívia Almeida', '1983-06-22', 52000.00),
  ('Roberto Souza', '1996-11-05', 48000.00),
  ('Amanda Mendes', '1981-08-18', 55000.00),
  ('Eduardo Costa', '1997-02-15', 59000.00),
  ('Juliana Lima', '1985-05-29', 51000.00);
 
 INSERT INTO cliente (nome, cidade, tipo) VALUES
  ('Maria Oliveira', 'São Paulo', 'Regular'),
  ('José Silva', 'Rio de Janeiro', 'VIP'),
  ('Ana Costa', 'Belo Horizonte', 'Regular'),
  ('Carlos Pereira', 'Porto Alegre', 'Premium'),
  ('Fernanda Santos', 'Salvador', 'VIP'),
  ('Roberto Lima', 'Brasília', 'Regular'),
  ('Juliana Souza', 'Fortaleza', 'Premium'),
  ('Rafael Almeida', 'Recife', 'Regular'),
  ('Larissa Oliveira', 'Curitiba', 'VIP'),
  ('Lucas Mendes', 'Manaus', 'Regular'),
  ('Mariana Costa', 'Belém', 'VIP'),
  ('Pedro Santos', 'Vitória', 'Regular'),
  ('Giovanna Lima', 'Florianópolis', 'Premium'),
  ('Renato Oliveira', 'Natal', 'Regular'),
  ('Amanda Almeida', 'Goiania', 'VIP'),
  ('Gabriel Costa', 'Maceió', 'Regular'),
  ('Isabela Lima', 'São Luís', 'Regular'),
  ('Vinícius Souza', 'João Pessoa', 'Premium'),
  ('Laura Pereira', 'Teresina', 'Regular'),
  ('Daniel Santos', 'Campo Grande', 'VIP');


INSERT INTO pedido (id_vendedor, id_cliente, qtd_item, vlr_total) VALUES
  (1, 1, 5, 250.00),
  (2, 2, 8, 400.00),
  (3, 3, 10, 500.00),
  (1, 4, 15, 750.00),
  (2, 5, 3, 150.00), 
  (4, 6, 7, 350.00),
  (3, 7, 9, 450.00), 
  (5, 8, 6, 300.00),
  (4, 9, 11, 550.00),
  (5, 10, 14, 700.00); 

#1. Quais os nomes de todos os vendedores?
SELECT nome FROM vendedor;

#2. Quais os números dos vendedores que realizaram algum pedido?
SELECT vendedor.`id` AS numero ,vendedor.nome FROM pedido 
JOIN vendedor ON pedido.`id_vendedor` = vendedor.`id` 
GROUP BY vendedor.`id`;

#3. Quais os números dos vendedores que não realizaram pedidos?
SELECT vendedor.id,vendedor.nome FROM vendedor
LEFT JOIN pedido ON vendedor.id = pedido.id_vendedor
WHERE pedido.id IS NULL;

#4. Quais os nomes dos vendedores que realizaram pedido para clientes do tipo “INDÚSTRIA”?
SELECT vendedor.nome
FROM vendedor JOIN pedido ON vendedor.id = pedido.id_vendedor
JOIN cliente ON pedido.id_cliente = cliente.id WHERE cliente.tipo = 'INDUSTRIA';

#5. Qual o tipo do cliente que foram atendidos (realizaram pedido) com o vendedor “JOÃO”?
SELECT cliente.nome,cliente.`tipo` FROM cliente JOIN pedido ON pedido.`id_cliente` = cliente.`id`
JOIN vendedor ON pedido.`id_vendedor` = vendedor.`id` WHERE vendedor.nome LIKE  '%João%';

#6. Quais os nomes e tipos dos clientes com pedidos acima de 5000 reais?
SELECT cliente.nome,cliente.`tipo` FROM cliente JOIN pedido ON pedido.`id_cliente` = cliente.`id`
 WHERE pedido.`vlr_total` > 5000;
