@import java.util.List
@import java.util.Map
@import br.com.despesas.model.Categoria
@param List<Categoria> categorias
@param Map<Integer, Long> contagemPorCategoria

@template.layout(
    titulo = "Categorias",
    paginaAtiva = "categorias",
    conteudo = @`
        <div class="page-header flex-between">
            <div>
                <h1>Categorias (${categorias.size()})</h1>
                <p>Grupos cadastrados para organizar suas despesas.</p>
            </div>
            <a href="/categorias/nova" class="btn btn-primario">+ Nova</a>
        </div>

        @if(categorias.isEmpty())
            <div class="card empty-state">
                <p>Nenhuma categoria cadastrada ainda.</p>
                <a href="/categorias/nova" class="btn btn-primario">Cadastrar primeira categoria</a>
            </div>
        @else
            <div class="card table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Descrição</th>
                            <th>Limite</th>
                            <th>Qtd. despesas</th>
                        </tr>
                    </thead>
                    <tbody>
                        @for(var c : categorias)
                            <tr>
                                <td><strong>${c.getNome()}</strong></td>
                                <td>${c.getDescricao()}</td>
                                <td>${c.getLimiteFormatado()}</td>
                                <td>
                                    <span class="badge">${contagemPorCategoria.getOrDefault(c.getId(), 0L)}</span>
                                </td>
                            </tr>
                        @endfor
                    </tbody>
                </table>
            </div>
        @endif
    `
)
