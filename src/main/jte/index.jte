@import br.com.cardapio.model.Prato
@param int total
@param int feitos
@param Prato proximoPrato

@template.layout(
    titulo = "Página Inicial",
    paginaAtiva = "inicio",
    conteudo = @`
        <section class="hero-card">
            <div class="hero-texto">
                <h1>Bem-vindo(a) à sua cozinha!</h1>
                <p>Planeje as refeições da semana e marque o que já saiu do fogão.</p>
                <div class="hero-acoes">
                    <a href="/pratos" class="btn btn-primario">Ver meu cardápio</a>
                    <a href="/pratos/novo" class="btn btn-secundario">+ Novo prato</a>
                </div>
            </div>
            <div class="hero-ilustracao" aria-hidden="true">
                🥘🥗🍝
            </div>
        </section>

        <section class="stats-grid">
            <div class="stat-card">
                <span class="stat-numero">${total}</span>
                <span class="stat-label">pratos planejados</span>
            </div>

            <div class="stat-card">
                <span class="stat-numero">${feitos}</span>
                <span class="stat-label">pratos feitos</span>
            </div>

            <div class="stat-card destaque">
                @if(proximoPrato != null)
                    <span class="stat-numero">${proximoPrato.getDiaMesFormatado()}</span>
                    <span class="stat-label">próximo prato (${proximoPrato.getNome()})</span>
                @else
                    <span class="stat-numero">--/--</span>
                    <span class="stat-label">nenhum prato agendado</span>
                @endif
            </div>
        </section>
    `
)
