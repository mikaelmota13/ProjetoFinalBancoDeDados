# Sistema de Gerenciamento de Loja

Este repositório contém o script SQL para a criação de um banco de dados para gerenciar uma loja, com funcionalidades que abrangem desde o cadastro de produtos e pedidos até a validação de dados, como o controle de estoque e a verificação da idade dos usuários. O sistema é estruturado em tabelas relacionais e utiliza gatilhos (triggers) para automatizar e validar operações críticas, como:

- **Criação de Tabelas**: Estruturação das tabelas `usuario`, `endereco`, `funcionario`, `produto`, `categoria`, `pedido` e `pedido_produto` com relações adequadas.
- **Inserção de Dados**: População inicial das tabelas com dados fictícios de produtos, funcionários, categorias e pedidos.
- **Triggers (Gatilhos)**:
  - Atualização automática do estoque após uma venda.
  - Verificação de estoque antes da criação de um pedido, garantindo que a quantidade não exceda o disponível.
  - Verificação de idade do usuário antes de permitir a inserção de um pedido (restrição para menores de 18 anos).
  - Definição automática da data de criação de pedidos.

### Funcionalidades
- **Validação de Estoque**: O sistema verifica se há estoque suficiente antes de permitir a criação de um pedido.
- **Verificação de Idade**: Apenas usuários com 18 anos ou mais podem realizar pedidos.
- **Atualização Automática**: O estoque dos produtos é atualizado automaticamente após a confirmação de um pedido.
- **Consultas Otimizadas**: Uso de índices para otimizar consultas frequentes.
  
Esse script SQL serve como base para um sistema de gerenciamento de pedidos de uma loja, com o foco em garantir integridade de dados e facilitar a administração dos pedidos e produtos.
