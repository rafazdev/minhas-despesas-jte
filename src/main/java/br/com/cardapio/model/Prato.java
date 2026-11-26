package br.com.cardapio.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Prato {

    private Long id;
    private String nome;
    private String tipo;
    private String categoria;
    private int porcoes;
    private LocalDate dataPlanejada;
    private String observacao;
    private LocalDate dataFeito;
    private Integer nota;

    public Prato() {
    }

    public Prato(Long id, String nome, String tipo, String categoria, int porcoes, LocalDate dataPlanejada, String observacao) {
        this.id = id;
        this.nome = nome;
        this.tipo = tipo;
        this.categoria = categoria;
        this.porcoes = porcoes;
        this.dataPlanejada = dataPlanejada;
        this.observacao = observacao;
    }

    public String getDataPlanejadaFormatada() {
        if (this.dataPlanejada == null) {
            return "-";
        }
        return this.dataPlanejada.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String getDiaMesFormatado() {
        if (this.dataPlanejada == null) {
            return "--/--";
        }
        return this.dataPlanejada.format(DateTimeFormatter.ofPattern("dd/MM"));
    }

    public String getDataFeitoFormatada() {
        if (this.dataFeito == null) {
            return "-";
        }
        return this.dataFeito.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public int getPorcoes() { return porcoes; }
    public void setPorcoes(int porcoes) { this.porcoes = porcoes; }

    public LocalDate getDataPlanejada() { return dataPlanejada; }
    public void setDataPlanejada(LocalDate dataPlanejada) { this.dataPlanejada = dataPlanejada; }

    public String getObservacao() { return observacao; }
    public void setObservacao(String observacao) { this.observacao = observacao; }

    public LocalDate getDataFeito() { return dataFeito; }
    public void setDataFeito(LocalDate dataFeito) { this.dataFeito = dataFeito; }

    public Integer getNota() { return nota; }
    public void setNota(Integer nota) { this.nota = nota; }
}
