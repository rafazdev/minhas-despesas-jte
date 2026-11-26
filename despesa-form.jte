@import java.util.List
@import br.com.despesas.model.Categoria
@param List<Categoria> categorias

@template.layout(
    titulo = "Nova Despesa",
    paginaAtiva = "nova-despesa",
    conteudo = @`
        <div class="page-header">
            <h1>Nova Despesa</h1>
            <p>Registre um novo gasto vinculando a uma categoria existente.</p>
        </div>

        @if(categorias.isEmpty())
            <div class="card empty-state alerta-vazio">
                <h2>⚠️ Sem categorias cadastradas</h2>
                <p>Cadastre uma categoria primeiro antes de registrar uma despesa.</p>
                <a href="/categorias/nova" class="btn btn-primario">Ir para Nova Categoria</a>
            </div>
        @else
            <form method="post" action="/despesas" class="card form-card">
                <div class="form-group">
                    <label for="descricao">Descrição</label>
                    <input type="text" id="descricao" name="descricao" placeholder="Ex: Almoço RU" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="valor">Valor (R$)</label>
                        <input type="number" id="valor" name="valor" step="0.01" min="0.01" placeholder="Ex: 4.50" required>
                    </div>

                    <div class="form-group">
                        <label for="data">Data</label>
                        <input type="date" id="data" name="data" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="categoriaId">Categoria</label>
                    <select id="categoriaId" name="categoriaId" required>
                        <option value="" disabled selected>Selecione...</option>
                        @for(var c : categorias)
                            <option value="${c.getId()}">${c.getNome()}</option>
                        @endfor
                    </select>
                </div>

                <div class="form-group">
                    <label>Forma de pagamento</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="formaPagamento" value="Pix" checked> Pix
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="formaPagamento" value="Cartão"> Cartão
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="formaPagamento" value="Dinheiro"> Dinheiro
                        </label>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primario">Salvar despesa</button>
                    <a href="/despesas" class="btn btn-cancelar">Cancelar</a>
                </div>
            </form>
        @endif
    `
)
