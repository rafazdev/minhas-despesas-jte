@import java.util.List
@import br.com.cardapio.model.Prato
@param List<Prato> feitos

@template.layout(
    titulo = "Pratos Feitos",
    paginaAtiva = "feitos",
    conteudo = @`
        <div class="page-header">
            <h1>Feitos esta semana (${feitos.size()})</h1>
            <p>Histórico de pratos que já saíram do fogão.</p>
        </div>

        @if(feitos.isEmpty())
            <div class="card empty-state">
                <p>Você ainda não marcou nenhum prato como feito esta semana.</p>
                <a href="/pratos" class="btn btn-primario">Ver pratos planejados</a>
            </div>
        @else
            <div class="card table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Nome do prato</th>
                            <th>Nota</th>
                            <th>Feito em</th>
                        </tr>
                    </thead>
                    <tbody>
                        @for(var f : feitos)
                            <tr>
                                <td><strong>${f.getNome()}</strong></td>
                                <td>
                                    <form method="post" action="/feitos/${f.getId()}/avaliar" class="nota-form">
                                        <span class="estrelas" title="Nota atual: ${f.getNota() != null ? f.getNota() : 5} de 5">
                                            @for(int i = 1; i <= 5; i++)
                                                @if(f.getNota() != null && i <= f.getNota())
                                                    ★
                                                @else
                                                    ☆
                                                @endif
                                            @endfor
                                        </span>
                                        <input type="number" name="nota" min="1" max="5" value="${f.getNota() != null ? f.getNota() : 5}" class="input-nota" aria-label="Nota de 1 a 5">
                                        <button type="submit" class="btn btn-mini">OK</button>
                                    </form>
                                </td>
                                <td>${f.getDataFeitoFormatada()}</td>
                            </tr>
                        @endfor
                    </tbody>
                </table>
            </div>
        @endif
    `
)
