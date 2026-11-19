# 💰 Minhas Despesas — Spring Boot + JTE (Relacionamento 1:N)

Aplicação web desenvolvida em **Java com Spring Boot** e **JTE (Java Template Engine)** para controle financeiro pessoal, implementando um relacionamento **1:N** entre `Categoria` e `Despesa` armazenado em memória (`List`), com menu reaproveitado em todas as páginas.

## 👥 Integrantes do Grupo
- **Jessé**
- **João Pedro**
- **Kauã Levik**
- **Rafael Marinho**

## 🚀 Funcionalidades Implementadas

- **Layout Reaproveitado (`layout.jte`):** Barra de navegação superior fixa presente em todas as telas com destaque na página ativa.
- **Página Inicial (`GET /`):** Apresentação do sistema e cartões de resumo com total de categorias, total de despesas e soma total dos gastos do mês.
- **Cadastro e Listagem de Categorias (`GET /categorias/nova`, `POST /categorias`, `GET /categorias`):** Criação de categorias com ID sequencial e exibição em tabela com contagem dinâmica de despesas vinculadas.
- **Cadastro e Listagem de Despesas (`GET /despesas/nova`, `POST /despesas`, `GET /despesas`):**
  - Verificação automática caso não existam categorias cadastradas.
  - Carregamento dinâmico das categorias em `<select>`.
  - Associação do objeto `Categoria` à `Despesa` no Controller.
  - Exibição do nome da categoria (`d.getCategoria().getNome()`), totalizador no rodapé e botão **Excluir**.

## 🛠️ Tecnologias Utilizadas

- Java 17
- Spring Boot 3.3.5 (Spring Web)
- JTE 3.1.12 (Java Template Engine)
- HTML5 e CSS3

## ▶️ Como Executar o Projeto

1. Clone este repositório:
   ```bash
   git clone https://github.com/rafazdev/minhas-despesas-jte.git
   cd minhas-despesas-jte
   ```

2. Execute a aplicação via Maven:
   ```bash
   ./mvnw spring-boot:run
   ```
   *(No Windows, utilize `mvnw.cmd spring-boot:run` ou execute a classe `MinhasDespesasApplication.java` pela sua IDE).*

3. Acesse no navegador:
   ```
   http://localhost:8080/
   ```
