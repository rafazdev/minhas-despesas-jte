@template.layout(
    titulo = "Nova Categoria",
    paginaAtiva = "nova-categoria",
    conteudo = @`
        <div class="page-header">
            <h1>Nova Categoria</h1>
            <p>Crie grupos de gastos para classificar suas despesas.</p>
        </div>

        <form method="post" action="/categorias" class="card form-card">
            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" placeholder="Ex: Alimentação" required>
            </div>

            <div class="form-group">
                <label for="descricao">Descrição</label>
                <input type="text" id="descricao" name="descricao" placeholder="Ex: Mercado, RU, Lanches" required>
            </div>

            <div class="form-group">
                <label for="limite">Limite de alerta (R$, opcional)</label>
                <input type="number" id="limite" name="limite" step="0.01" min="0" placeholder="Ex: 400.00">
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primario">Salvar categoria</button>
                <a href="/categorias" class="btn btn-cancelar">Cancelar</a>
            </div>
        </form>
    `
)
