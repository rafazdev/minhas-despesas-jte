@import java.util.List
@import br.com.cardapio.model.Prato
@param List<Prato> pratos

@template.layout(
    titulo = "Meu Cardápio",
    paginaAtiva = "cardapio",
    conteudo = @`
        <div class="page-header flex-between">
            <div>
                <h1>Planejados (${pratos.size()})</h1>
                <p>Refeições organizadas para os próximos dias.</p>
            </div>
            <a href="/pratos/novo" class="btn btn-primario">+ Adicionar</a>
        </div>

        @if(pratos.isEmpty())
            <div class="card empty-state">
                <p>Nenhum prato ainda. Que tal planejar o jantar de hoje? 🍳</p>
                <a href="/pratos/novo" class="btn btn-primario">Planejar primeiro prato</a>
            </div>
        @else
            <div class="card table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Nome do prato</th>
                            <th>Tipo</th>
                            <th>Categoria</th>
                            <th>Porções</th>
                            <th>Data planejada</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        @for(var p : pratos)
                            <tr>
                                <td>
                                    <strong>${p.getNome()}</strong>
                                    @if(p.getObservacao() != null && !p.getObservacao().isBlank())
                                        <small class="obs-linha">${p.getObservacao()}</small>
                                    @endif
                                </td>
                                <td><span class="badge badge-tipo">${p.getTipo()}</span></td>
                                <td><span class="badge">${p.getCategoria()}</span></td>
                                <td>${p.getPorcoes()}</td>
                                <td>${p.getDataPlanejadaFormatada()}</td>
                                <td>
                                    <form method="post" action="/pratos/${p.getId()}/fazer">
                                        <button type="submit" class="btn btn-feito">Fiz!</button>
                                    </form>
                                </td>
                            </tr>
                        @endfor
                    </tbody>
                </table>
            </div>
        @endif
    `
)
