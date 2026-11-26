@param String titulo
@param String paginaAtiva
@param gg.jte.Content conteudo

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo} - Minhas Despesas</title>
    <link rel="stylesheet" href="/css/estilo.css">
</head>
<body>
    <header class="topbar">
        <div class="topbar-container">
            <a href="/" class="brand">
                <span class="brand-icon">💰</span>
                <span>Minhas Despesas</span>
            </a>

            <nav class="nav-links">
                <a href="/" class="nav-item ${"inicio".equals(paginaAtiva) ? "ativo" : ""}">Início</a>
                <a href="/categorias" class="nav-item ${"categorias".equals(paginaAtiva) ? "ativo" : ""}">Categorias</a>
                <a href="/categorias/nova" class="nav-item ${"nova-categoria".equals(paginaAtiva) ? "ativo" : ""}">Nova Categoria</a>
                <a href="/despesas" class="nav-item ${"despesas".equals(paginaAtiva) ? "ativo" : ""}">Despesas</a>
                <a href="/despesas/nova" class="nav-item ${"nova-despesa".equals(paginaAtiva) ? "ativo" : ""}">Nova Despesa</a>
            </nav>
        </div>
    </header>

    <main class="container">
        ${conteudo}
    </main>
</body>
</html>
