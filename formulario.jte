@template.layout(
    titulo = "Adicionar Prato",
    paginaAtiva = "novo",
    conteudo = @`
        <div class="page-header">
            <h1>Novo prato</h1>
            <p>Preencha os detalhes da refeição para adicionar ao planejamento.</p>
        </div>

        <div class="form-layout">
            <form method="post" action="/pratos" class="card form-card">
                <div class="form-group">
                    <label for="nome">Nome do prato</label>
                    <input type="text" id="nome" name="nome" placeholder="Ex: Lasanha à Bolonhesa" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Tipo</label>
                        <div class="radio-group">
                            <label class="radio-label">
                                <input type="radio" name="tipo" value="Almoço" checked> Almoço
                            </label>
                            <label class="radio-label">
                                <input type="radio" name="tipo" value="Jantar"> Jantar
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="porcoes">Porções</label>
                        <input type="number" id="porcoes" name="porcoes" min="1" max="50" value="4" placeholder="Ex: 4" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="categoria">Categoria</label>
                        <select id="categoria" name="categoria" required>
                            <option value="Massa">Massa</option>
                            <option value="Salada">Salada</option>
                            <option value="Carne">Carne</option>
                            <option value="Vegano">Vegano</option>
                            <option value="Sobremesa">Sobremesa</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="dataPlanejada">Data planejada</label>
                        <input type="date" id="dataPlanejada" name="dataPlanejada" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="observacao">Observação (opcional)</label>
                    <textarea id="observacao" name="observacao" rows="3" placeholder="Ex: levar sobremesa na festa de sábado"></textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primario">Salvar</button>
                    <a href="/pratos" class="btn btn-cancelar">Cancelar</a>
                </div>
            </form>

            <aside class="card preview-card">
                <h3>Resumo do prato</h3>
                <p class="preview-hint">Veja como ficará no seu cardápio:</p>

                <div class="preview-box">
                    <h4 id="prev-nome">Lasanha à Bolonhesa</h4>
                    <div class="preview-badges">
                        <span class="badge" id="prev-categoria">Massa</span>
                        <span class="badge badge-tipo" id="prev-tipo">Almoço</span>
                    </div>
                    <ul class="preview-detalhes">
                        <li><strong>Porções:</strong> <span id="prev-porcoes">4 porções</span></li>
                        <li><strong>Data:</strong> <span id="prev-data">A definir</span></li>
                    </ul>
                    <p class="preview-obs" id="prev-obs"></p>
                </div>
            </aside>
        </div>

        <script>
            const inputNome = document.getElementById('nome');
            const radiosTipo = document.querySelectorAll('input[name="tipo"]');
            const inputPorcoes = document.getElementById('porcoes');
            const selectCategoria = document.getElementById('categoria');
            const inputData = document.getElementById('dataPlanejada');
            const inputObs = document.getElementById('observacao');

            function atualizarResumo() {
                document.getElementById('prev-nome').textContent = inputNome.value.trim() || 'Nome do prato';
                const tipoSelecionado = document.querySelector('input[name="tipo"]:checked');
                document.getElementById('prev-tipo').textContent = tipoSelecionado ? tipoSelecionado.value : 'Almoço';
                const qtd = inputPorcoes.value || 1;
                document.getElementById('prev-porcoes').textContent = qtd + (qtd == 1 ? ' porção' : ' porções');
                document.getElementById('prev-categoria').textContent = selectCategoria.value;
                if (inputData.value) {
                    const partes = inputData.value.split('-');
                    document.getElementById('prev-data').textContent = partes[2] + '/' + partes[1] + '/' + partes[0];
                } else {
                    document.getElementById('prev-data').textContent = 'A definir';
                }
                const obs = inputObs.value.trim();
                document.getElementById('prev-obs').textContent = obs ? '📝 ' + obs : '';
            }

            inputNome.addEventListener('input', atualizarResumo);
            radiosTipo.forEach(r => r.addEventListener('change', atualizarResumo));
            inputPorcoes.addEventListener('input', atualizarResumo);
            selectCategoria.addEventListener('change', atualizarResumo);
            inputData.addEventListener('change', atualizarResumo);
            inputObs.addEventListener('input', atualizarResumo);
        </script>
    `
)
