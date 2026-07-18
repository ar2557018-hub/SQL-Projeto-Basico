-- Caso as tabelas já existam, esse comando limpa elas para não dar erro de "already exists"
-- Limpeza total do banco antigo (na ordem certa de dependência)
DROP TABLE IF EXISTS fluxo_caixa;
DROP TABLE IF EXISTS itens_venda;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS fornecedores;
DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    bairro VARCHAR(50)
);

CREATE TABLE funcionarios (
    id_funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);
CREATE TABLE fornecedores (
    id_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_empresa VARCHAR(100) NOT NULL,
    contato VARCHAR(50),
    telefone VARCHAR(20)
);

CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    estoque_atual INT DEFAULT 0,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);
CREATE TABLE vendas (
    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INT,
    id_funcionario INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE itens_venda (
    id_item INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
CREATE TABLE fluxo_caixa (
    id_movimentacao INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo VARCHAR(7) CHECK(tipo IN ('ENTRADA', 'SAIDA')), -- Só aceita essas duas palavras
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- 1. POPULANDO A TABELA DE CLIENTES (50 REGISTROS DE TESTE)
-- ====================================================================
INSERT INTO clientes (nome, telefone, bairro, email) VALUES
('Ana Silva', '63992011111', 'Plano Diretor Sul', 'ana.silva@email.com'),
('Bruno Costa', '63992012222', 'Plano Diretor Norte', 'bruno.costa@email.com'),
('Carlos Souza', '63992013333', 'Taquaralto', 'carlos.souza@email.com'),
('Daniela Oliveira', '63992014444', 'Aureny I', 'daniela.oliveira@email.com'),
('Eduardo Santos', '63992015555', 'Jardim Aureny III', 'eduardo.santos@email.com'),
('Fernanda Lima', '63992016666', 'Plano Diretor Sul', 'fernanda.lima@email.com'),
('Gabriel Almeida', '63992017777', 'Plano Diretor Norte', 'gabriel.almeida@email.com'),
('Amanda Rocha', '63992018888', 'Taquaralto', 'amanda.rocha@email.com'),
('Igor Ribeiro', '63992019999', 'Aureny II', 'igor.ribeiro@email.com'),
('Juliana Carvalho', '63992020000', 'Plano Diretor Sul', 'juliana.carvalho@email.com'),
('Lucas Pereira', '63992021111', 'Plano Diretor Norte', 'lucas.pereira@email.com'),
('Mariana Gomes', '63992022222', 'Taquaralto', 'mariana.gomes@email.com'),
('Nicolas Martins', '63992023333', 'Aureny III', 'nicolas.martins@email.com'),
('Olivia Barbosa', '63992024444', 'Plano Diretor Sul', 'olivia.barbosa@email.com'),
('Pedro Rodrigues', '63992025555', 'Plano Diretor Norte', 'pedro.rodriguez@email.com'),
('Beatriz Melo', '63992026666', 'Taquaralto', 'beatriz.melo@email.com'),
('Rodrigo Cruz', '63992027777', 'Aureny IV', 'rodrigo.cruz@email.com'),
('Sofia Dias', '63992028888', 'Plano Diretor Sul', 'sofia.dias@email.com'),
('Thiago Reis', '63992029999', 'Plano Diretor Norte', 'thiago.reis@email.com'),
('Larissa Novaes', '63992030000', 'Taquaralto', 'larissa.novaes@email.com'),
('Vitor Correia', '63992031111', 'Aureny I', 'vitor.correia@email.com'),
('Yasmin Freire', '63992032222', 'Plano Diretor Sul', 'yasmin.freire@email.com'),
('Arthur Pinto', '63992033333', 'Plano Diretor Norte', 'arthur.pinto@email.com'),
('Manuela Castro', '63992034444', 'Taquaralto', 'manuela.castro@email.com'),
('Gustavo cavalcanti', '63992035555', 'Aureny II', 'gustavo.c@email.com'),
('Camila Campos', '63992036666', 'Plano Diretor Sul', 'camila.campos@email.com'),
('Leonardo nunes', '63992037777', 'Plano Diretor Norte', 'leonardo.nunes@email.com'),
('Caroline Cardoso', '63992038888', 'Taquaralto', 'caroline.cardoso@email.com'),
('Matheus Teixeira', '63992039999', 'Aureny III', 'matheus.teixeira@email.com'),
('Letitia Moura', '63992040000', 'Plano Diretor Sul', 'letitia.moura@email.com'),
('Rafael Rocha', '63992041111', 'Plano Diretor Norte', 'rafael.rocha@email.com'),
('Elena Viana', '63992042222', 'Taquaralto', 'elena.viana@email.com'),
('Samuel Moraes', '63992043333', 'Aureny IV', 'samuel.moraes@email.com'),
('Valentina Andrade', '63992044444', 'Plano Diretor Sul', 'valentina.andrade@email.com'),
('Daniel Assis', '63992045555', 'Plano Diretor Norte', 'daniel.assis@email.com'),
('Isadora farias', '63992046666', 'Taquaralto', 'isadora.farias@email.com'),
('Murilo Peixoto', '63992047777', 'Aureny I', 'murilo.peixoto@email.com'),
('Lorena Barros', '63992048888', 'Plano Diretor Sul', 'lorena.barros@email.com'),
('Henrique Fontes', '63992049999', 'Plano Diretor Norte', 'henrique.fontes@email.com'),
('Livia Ramos', '63992051111', 'Taquaralto', 'livia.ramos@email.com'),
('Felipe guimaraes', '63992052222', 'Aureny II', 'felipe.g@email.com'),
('Catarina Leitão', '63992053333', 'Plano Diretor Sul', 'catarina.leitao@email.com'),
('Vinicius Sales', '63992054444', 'Plano Diretor Norte', 'vinicius.sales@email.com'),
('Alice porto', '63992055555', 'Taquaralto', 'alice.porto@email.com'),
('Eduarda Caldeira', '63992056666', 'Aureny III', 'eduarda.caldeira@email.com'),
('Joao Marin', '63992057777', 'Plano Diretor Sul', 'joao.marin@email.com'),
('Cecilia Couto', '63992058888', 'Plano Diretor Norte', 'cecilia.couto@email.com'),
('Erick florencio', '63992059999', 'Taquaralto', 'erick.f@email.com'),
('Lara Silveira', '63992060000', 'Aureny IV', 'lara.silveira@email.com'),
('Marcos Silva', '63992061111', 'Plano Diretor Sul', 'marcos.silva@email.com');


-- ====================================================================
-- 2. REGISTRO DE UMA VENDA COMPLETA (3 PASSOS)
-- ====================================================================

-- Passo A: Cabeçalho da venda (Valor total, Cliente e Funcionário)
INSERT INTO vendas (id_cliente, id_funcionario, valor_total) 
VALUES (3, 1, 10500.00);

-- Passo B: Itens da venda (O que foi comprado na venda acima)
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_unitario) 
VALUES (2, 1, 3, 3500.00);

-- Passo C: Registro de Entrada no Fluxo de Caixa da empresa
INSERT INTO fluxo_caixa (tipo_movimento, valor, descricao) 
VALUES ('entrada', 10500.00, 'Venda de 3x Notebooks - Cliente ID 3');


-- ====================================================================
-- 3. CRIAÇÃO DA VIEW (TABELA VIRTUAL DE RELATÓRIO DETALHADO)
-- ====================================================================
CREATE VIEW relatorio_vendas_detalhado AS
SELECT 
    vendas.id_venda AS "Nº Venda",
    clientes.nome AS "Cliente",
    funcionarios.nome AS "Vendedor",
    produtos.nome_produto AS "Produto",
    itens_venda.quantidade AS "Qtd",
    vendas.valor_total AS "Total Gasto"
FROM itens_venda
JOIN vendas ON itens_venda.id_venda = vendas.id_venda
JOIN clientes ON vendas.id_cliente = clientes.id_cliente
JOIN funcionarios ON vendas.id_funcionario = funcionarios.id_funcionario
JOIN produtos ON itens_venda.id_produto = produtos.id_produto;