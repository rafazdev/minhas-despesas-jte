@param int totalCategorias
@param int totalDespesas
@param String totalMesFormatado

@template.layout(
    titulo = "Página Inicial",
    paginaAtiva = "inicio",
    conteudo = @`
        <section class="hero-card">
            <div class="hero-texto">
                <h1>Para onde foi meu dinheiro?</h1>
                <p>Cadastre categorias e registre cada gasto do mês de forma simples e organizada.</p>

                <div class="hero-acoes">
                    <a href="/categorias/nova" class="btn btn-secundario">1º Criar categoria</a>
                    <a href="/despesas/nova" class="btn btn-primario">2º Registrar despesa</a>
                </div>
            </div>
        </section>

        <section class="stats-grid">
            <a href="/categorias" class="stat-card">
                <span class="stat-numero">${totalCategorias}</span>
                <span class="stat-label">categorias</span>
            </a>

            <a href="/despesas" class="stat-card">
                <span class="stat-numero">${totalDespesas}</span>
                <span class="stat-label">despesas</span>
            </a>

            <a href="/despesas" class="stat-card destaque">
                <span class="stat-numero">${totalMesFormatado}</span>
                <span class="stat-label">total do mês</span>
            </a>
        </section>
    `
)
