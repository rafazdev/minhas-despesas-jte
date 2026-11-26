@import java.util.List
@import br.com.despesas.model.Despesa
@param List<Despesa> despesas
@param String totalGeralFormatado

@template.layout(
    titulo = "Despesas",
    paginaAtiva = "despesas",
    conteudo = @`
        <div class="page-header flex-between">
            <div>
                <h1>Despesas (${despesas.size()})</h1>
                <p>Histórico detalhado dos gastos registrados.</p>
            </div>
            <a href="/despesas/nova" class="btn btn-primario">+ Nova</a>
        </div>

        @if(despesas.isEmpty())
            <div class="card empty-state">
                <p>Nenhuma despesa registrada ainda.</p>
                <a href="/despesas/nova" class="btn btn-primario">Registrar primeira despesa</a>
            </div>
        @else
            <div class="card table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Descrição</th>
                            <th>Categoria</th>
                            <th>Valor</th>
                            <th>Data</th>
                            <th>Pagamento</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        @for(var d : despesas)
                            <tr>
                                <td><strong>${d.getDescricao()}</strong></td>
                                <td><span class="badge badge-categoria">${d.getCategoria().getNome()}</span></td>
                                <td class="valor-coluna">${d.getValorFormatado()}</td>
                                <td>${d.getDataFormatada()}</td>
                                <td><span class="badge">${d.getFormaPagamento()}</span></td>
                                <td>
                                    <form method="post" action="/despesas/${d.getId()}/excluir">
                                        <button type="submit" class="btn btn-excluir">Excluir</button>
                                    </form>
                                </td>
                            </tr>
                        @endfor
                    </tbody>
                    <tfoot>
                        <tr class="linha-total">
                            <td colspan="2"><strong>Total:</strong></td>
                            <td colspan="4"><strong>${totalGeralFormatado}</strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        @endif
    `
)
