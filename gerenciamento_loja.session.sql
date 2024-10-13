DROP DATABASE gerenciamento_loja;
CREATE DATABASE gerenciamento_loja;
USE gerenciamento_loja;

--criação das tabelas
CREATE TABLE endereco(
    endereco_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL
);

CREATE TABLE usuario(
    usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco_id INT UNSIGNED,
    FOREIGN KEY (endereco_id) REFERENCES endereco(endereco_id)
);

CREATE TABLE funcionario(
    funcionario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL
);

CREATE TABLE pedido(
    pedido_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME NOT NULL,
    usuario_id INT UNSIGNED, 
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE categoria(
    categoria_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    categoria_nome VARCHAR(100) NOT NULL,
    categoria_descricao TEXT NOT NULL
);

CREATE TABLE produto(
    produto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    descricao TEXT NOT NULL,
    estoque INT NOT NULL,
    data_fabricacao DATE NOT NULL,
    valor FLOAT NOT NULL,
    categoria_id INT UNSIGNED,
    funcionario_id INT UNSIGNED,
    FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(funcionario_id)
);

CREATE TABLE pedido_produto(
    pedido_produto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    produto_id INT UNSIGNED,
    pedido_id INT UNSIGNED,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES produto(produto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id)
);

/*=========================================================================================*/

-- Inserção de dados:
INSERT INTO endereco(rua, bairro, numero, cidade, estado) VALUES  
    ('Capitão Rodrigo', 'Centro', '678', 'Novo Oriente', 'Ceará'),
    ('Dom Pedro II', 'Fátima II', '1221', 'Crateús', 'Ceará'),
    ('Cazza Rocha', 'Centro', '1342', 'Novo Oriente', 'Ceará'),
    ('15 de Março', 'Lagoa das Goiabeiras', '873', 'São Benedito', 'Ceará'),
    ('Castelo Branco', 'São Vicente', '345', 'Xexéu', 'Pernambuco'),
    ('Rua das Flores', 'Jardim Primavera', '987', 'Fortaleza', 'Ceará'),
    ('Avenida Brasil', 'Centro', '456', 'Recife', 'Pernambuco'),
    ('Rua São José', 'Vila Nova', '231', 'Juazeiro do Norte', 'Ceará'),
    ('Rua Rio Branco', 'Boa Vista', '112', 'Natal', 'Rio Grande do Norte'),
    ('Avenida Santos Dumont', 'Meireles', '1234', 'Fortaleza', 'Ceará'),
    ('Rua das Pedrinhas', 'Centro', '0020', 'Crateús', 'Ceará'
);

--alterando categoria de VARCHAR para TEXT para caber mais caracteres:
ALTER TABLE categoria MODIFY categoria_descricao TEXT;

INSERT INTO categoria (categoria_nome, categoria_descricao) VALUES
    ('Componentes de PC', 'Peças internas como processadores, placas-mãe, memória RAM e placas de vídeo que são essenciais para montar ou atualizar um computador.'),
    ('Periféricos para PC', 'Equipamentos externos como mouses, teclados, monitores e impressoras que melhoram a interação e a produtividade ao usar um computador.'),
    ('Celulares', 'Dispositivos móveis multifuncionais que permitem chamadas, mensagens, navegação na internet e acesso a aplicativos, com variações de marcas e especificações.'),
    ('Acessórios para Celulares', 'Itens complementares como capas, películas protetoras, carregadores e fones de ouvido que melhoram a funcionalidade e a proteção de smartphones.'),
    ('Software para PC e Celulares','Programas e aplicativos que otimizam o uso de computadores e celulares, abrangendo sistemas operacionais, suítes de escritório, ferramentas de segurança e entretenimento.'),
    ('Televisores', 'Aparelhos de TV com diferentes tamanhos e resoluções, desde LED até 4K, para entretenimento em casa.'),
    ('Eletrodomésticos', 'Equipamentos para uso doméstico como geladeiras, máquinas de lavar, micro-ondas e aspiradores de pó que facilitam as tarefas diárias.'),
    ('Consoles de Videogame', 'Plataformas de jogos eletrônicos como PlayStation, Xbox e Nintendo Switch, oferecendo uma variedade de jogos e experiências interativas.'),
    ('Câmeras e Equipamentos Fotográficos', 'Dispositivos e acessórios para fotografia, como câmeras digitais, lentes e tripés, destinados a amadores e profissionais.'),
    ('Audio e Som', 'Produtos de áudio como fones de ouvido, caixas de som, sistemas de som surround e home theaters, para experiências de som imersivas.'
);

INSERT INTO usuario (nome, email, cpf, data_nascimento, endereco_id) VALUES
    ('123 da Silva 4', '123silva@gmail.com', '22233344455', '2000-01-01', 1),
    ('Jackson Costa', 'costajack@gmail.com', '09885413209', '1999-02-02', 2),
    ('Paula Pontes','paulap@yahoo.com', '3245687690', '2003-05-14', 3),
    ('Fabio Lima','lima123@gmail.com', '85490215343', '1998-03-03', 4),
    ('Junior Azevedo','azevedo@gmail.com','09313245698', '1985-10-10', 5),
    ('Carla Souza', 'carlasouza@gmail.com', '56789012345', '1990-07-07', 6),
    ('Lucas Mendes', 'lucasmendes@hotmail.com', '34567890123', '1995-06-15', 7),
    ('Amanda Rocha', 'amandar@hotmail.com', '12345678901', '1992-08-22', 8),
    ('Felipe Santos', 'felipe.santos@outlook.com', '23456789012', '1988-11-30', 9),
    ('Mariana Lima', 'mariana.lima@gmail.com', '45678901234', '1994-04-04', 10
);

INSERT INTO funcionario (nome, cpf) VALUES 
    ('Maria','00011122233' ),
    ('Mikael','11122233344'),
    ('Vicente', '22233344455'),
    ('Aguiar','33344455566'),
    ('Joel','44455566677'),
    ('Lucas', '40028921065'),
    ('Camila', '22233344455'),
    ('Sofia', '12345678910'),
    ('Rafael', '09876554321'),
    ('Fernanda', '11122233344'
);

INSERT INTO produto (nome, descricao, estoque, data_fabricacao, valor, categoria_id, funcionario_id) VALUES 
    ('Processador Intel i7', 'Processador de alto desempenho', 10, '2022-01-15', 2500.00, 1, 1),
    ('Teclado Mecânico', 'Teclado mecânico RGB', 15, '2023-01-10', 450.00, 2, 2),
    ('Smartphone Android', 'Smartphone com tela de 6.5"', 30, '2023-01-05', 1200.00, 3, 3),
    ('Capinha para celular', 'Capinha protetora de silicone', 100, '2022-03-20', 25.00, 4, 1),
    ('Windows 11', 'Sistema operacional', 50, '2021-12-01', 500.00, 5, 2),
    ('Smart TV 50"', 'Smart TV com resolução 4K', 20, '2022-06-15', 3000.00, 6, 1),
    ('Geladeira Inox', 'Geladeira com dispenser de água', 5, '2023-02-01', 4000.00, 7, 2),
    ('PlayStation 5', 'Console de videogame', 10, '2021-11-10', 4500.00, 8, 3),
    ('Câmera Digital', 'Câmera com lente intercambiável', 8, '2022-07-20', 2000.00, 9, 2),
    ('Fone de Ouvido Bluetooth', 'Fone sem fio com boa qualidade de som', 50, '2023-03-01', 300.00, 10, 3
);

INSERT INTO pedido (data_pedido, usuario_id) VALUES
    ('2024-03-09 11:09:00', 3),
    ('2024-09-18 17:00:00', 2),
    ('2024-01-09 11:09:00', 1),
    ('2024-02-18 17:00:00', 2),
    ('2024-04-15 12:43:00', 4),
    ('2024-05-20 18:00:00', 5),
    ('2024-06-02 19:00:00', 6),
    ('2024-07-11 20:00:00', 7),
    ('2024-08-17 21:00:00', 8),
    ('2024-09-23 03:00:00', 9),
    ('2024-10-16 04:00:00', 10),
    ('2024-01-22 23:59:59', 10
);
    
INSERT INTO pedido_produto(produto_id, pedido_id, quantidade) VALUES
    (1, 1, 5),
    (2, 2, 2),
    (3, 3, 5),
    (4, 4, 7),
    (5, 5, 12),
    (6, 6, 3),
    (7, 7, 9),
    (8, 8, 11),
    (9, 9, 1),
    (10, 10, 1
);

SELECT * FROM endereco;
SELECT * FROM categoria;
SELECT * FROM usuario;
SELECT * FROM funcionario;
SELECT * FROM produto;
SELECT * FROM pedido;
SELECT * FROM pedido_produto;

/*=========================================================================================*/
CREATE INDEX prod1_index ON produto(nome, estoque, produto_id);
SELECT produto_id, nome, estoque FROM produto WHERE nome = 'Processador Intel i7' AND estoque > 5;

CREATE index ped1_index ON pedido(pedido_id, data_pedido, usuario_id);
SELECT pedido_id, data_pedido, usuario_id FROM pedido WHERE usuario_id = 6 ORDER BY data_pedido;

/*=========================================================================================*/
-- Fazer update do estoque após uma venda
CREATE TRIGGER AtualizaEstoqueAposVenda
AFTER INSERT ON pedido_produto
FOR EACH ROW
BEGIN
    UPDATE produto
    SET estoque = estoque - NEW.quantidade
    WHERE produto_id = NEW.produto_id;
END;

-- verficar estoque
SELECT produto_id, estoque FROM produto WHERE produto_id = 5;
SELECT * FROM produto;

-- inserir um novo pedido de produto
INSERT INTO pedido_produto (produto_id, pedido_id, quantidade) VALUES (5, 1, 5);

/*=========================================================================================*/
--Verificação de estoque suficiente antes da inserção de pedidos
CREATE TRIGGER VerificaEstoqueAntesDeInserirPedido
BEFORE INSERT ON pedido_produto
FOR EACH ROW
BEGIN
   DECLARE estoque_atual INT;

   -- Verifica se o produto existe e obtém o estoque atual
   SELECT estoque INTO estoque_atual
   FROM produto
   WHERE produto_id = NEW.produto_id;

   -- Verifica se o produto foi encontrado
   IF estoque_atual IS NULL THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Produto não encontrado.';
   -- Verifica se a quantidade do pedido é maior que o estoque
   ELSEIF NEW.quantidade > estoque_atual THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Quantidade do pedido excede o estoque disponível.';
   END IF;
END;

-- Verificae o estoque do produto
SELECT produto_id, estoque FROM produto WHERE produto_id = 4;

-- Testar a inserção quando o estoque é suficiente
INSERT INTO pedido_produto (produto_id, pedido_id, quantidade) VALUES (4, 2, 2);

-- Testar a inserção quando o estoque é insuficiente
INSERT INTO pedido_produto (produto_id, pedido_id, quantidade) VALUES (4, 2, 200);

-- Testar a inserção de um produto que não existe
INSERT INTO pedido_produto (produto_id, pedido_id, quantidade) VALUES (999, 1, 1); 

SELECT * FROM produto;
/*=========================================================================================*/
-- Atualização automática da data do pedido
CREATE TRIGGER AtualizaDataPedido
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN
   IF NEW.data_pedido IS NULL THEN
      SET NEW.data_pedido = NOW();  
   END IF;
END;

-- Inserir um pedido sem especificar a data_pedido
INSERT INTO pedido (usuario_id) VALUES (1); 

-- verificar se data_pedido foi preenchido corretamente
SELECT * FROM pedido WHERE usuario_id = 1;

-- inserir um pedido com data_pedido especificado
INSERT INTO pedido (data_pedido, usuario_id) VALUES ('2024-10-01 12:00:00', 2);

-- verificar se data_pedido foi mantida conforme especificado
SELECT * FROM pedido WHERE usuario_id = 2;

SELECT * FROM pedido;
/*=========================================================================================*/
-- Verificar a idade do usuário ao inserir um novo pedido
CREATE TRIGGER VerificaIdadeAntesDeInserirPedido
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN
    DECLARE idade_usuario INT;

    -- Obtemos a idade do usuário a partir da tabela usuario
    SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())
    INTO idade_usuario
    FROM usuario
    WHERE usuario_id = NEW.usuario_id;

    -- Verifica se a idade é menor que 18 anos
    IF idade_usuario IS NULL OR idade_usuario < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário deve ter pelo menos 18 anos para fazer um pedido.';
    END IF;
END;

-- inserindo um usuário menor de 18 anos
INSERT INTO usuario (nome, email, cpf, data_nascimento, endereco_id) VALUES
('João', 'joao@example.com', '12345678901', '2009-01-01', NULL); 

-- inserir um pedido para esse usuário
INSERT INTO pedido (data_pedido, usuario_id) VALUES (NOW(), LAST_INSERT_ID());

-- Inserir um usuário com idade igual ou superior a 18 anos
INSERT INTO usuario (nome, email, cpf, data_nascimento, endereco_id) VALUES
('Maria', 'maria@example.com', '12345678902', '2000-01-01', NULL);  

-- inserir um pedido para esse usuário
INSERT INTO pedido (data_pedido, usuario_id) VALUES (NOW(), LAST_INSERT_ID());

SELECT * FROM usuario;

/*=========================================================================================*/
--fazer update no nome e na descrição de um produto:
UPDATE categoria SET categoria_nome = 'Perifericos gerais', categoria_descricao = 'Perifericos de celulares e computadores.'
WHERE categoria_id = 2; 
SELECT * FROM categoria;

--fazer update no valor de um produto
UPDATE produto SET valor = 2499.99  WHERE produto_id = 1; 

SELECT * FROM produto;
/*=========================================================================================*/
--deletar usuário e todos os pedidos associados a id dele:
DELETE FROM pedido_produto WHERE pedido_id IN (SELECT pedido_id FROM pedido WHERE usuario_id = 1);
DELETE FROM pedido WHERE usuario_id = 1; 
DELETE FROM usuario WHERE usuario_id = 1;

SELECT * FROM pedido_produto;
SELECT * FROM usuario;
SELECT * FROM pedido ;
/*=========================================================================================*/
-- deletar os pedidos de um mês específicos:
DELETE FROM pedido_produto WHERE pedido_id IN (
    SELECT pedido_id FROM pedido WHERE MONTH(data_pedido) = 2 AND YEAR(data_pedido) = 2024
);

DELETE FROM pedido WHERE MONTH(data_pedido) = 2 AND YEAR(data_pedido) = 2024;
SELECT * FROM pedido;




