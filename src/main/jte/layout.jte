@param String titulo
@param String paginaAtiva
@param gg.jte.Content conteudo

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo} - Cardápio da Semana</title>
    <link rel="stylesheet" href="/css/estilo.css">
</head>
<body>
    <div class="app-container">
        <aside class="sidebar">
            <div class="brand">
                <span class="brand-icon">🍳</span>
                <h2>Cardápio da Semana</h2>
            </div>

            <nav class="menu">
                <a href="/" class="menu-item ${"inicio".equals(paginaAtiva) ? "ativo" : ""}">
                    <span>🏠</span> Início
                </a>
                <a href="/pratos" class="menu-item ${"cardapio".equals(paginaAtiva) ? "ativo" : ""}">
                    <span>📋</span> Meu Cardápio
                </a>
                <a href="/pratos/novo" class="menu-item ${"novo".equals(paginaAtiva) ? "ativo" : ""}">
                    <span>➕</span> Adicionar Prato
                </a>
                <a href="/feitos" class="menu-item ${"feitos".equals(paginaAtiva) ? "ativo" : ""}">
                    <span>✔</span> Feitos
                </a>
            </nav>

            <div class="sidebar-footer">
                <small>Spring Boot + JTE v2</small>
            </div>
        </aside>

        <main class="main-content">
            ${conteudo}
        </main>
    </div>
</body>
</html>
