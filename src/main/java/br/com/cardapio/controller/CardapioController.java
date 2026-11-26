package br.com.cardapio.controller;

import br.com.cardapio.model.Prato;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicLong;

@Controller
public class CardapioController {

    private final List<Prato> pratos = new ArrayList<>();
    private final List<Prato> feitos = new ArrayList<>();
    private final AtomicLong contadorId = new AtomicLong(1);

    public CardapioController() {
        pratos.add(new Prato(contadorId.getAndIncrement(), "Lasanha à Bolonhesa", "Almoço", "Massa", 4, LocalDate.of(2026, 11, 14), "Usar queijo mussarela ralado na hora"));
        pratos.add(new Prato(contadorId.getAndIncrement(), "Salada de Grão-de-Bico", "Jantar", "Salada", 2, LocalDate.of(2026, 11, 16), ""));
        pratos.add(new Prato(contadorId.getAndIncrement(), "Frango Xadrez", "Almoço", "Carne", 3, LocalDate.of(2026, 11, 21), "Caprichar no pimentão"));
        pratos.add(new Prato(contadorId.getAndIncrement(), "Bolo de Cenoura", "Jantar", "Sobremesa", 8, LocalDate.of(2026, 11, 22), "Levar sobremesa na festa de sábado"));

        Prato f1 = new Prato(contadorId.getAndIncrement(), "Escondidinho de Carne Seca", "Almoço", "Carne", 4, LocalDate.of(2026, 11, 3), "");
        f1.setDataFeito(LocalDate.of(2026, 11, 3));
        f1.setNota(5);

        Prato f2 = new Prato(contadorId.getAndIncrement(), "Macarrão de Panela de Pressão", "Jantar", "Massa", 3, LocalDate.of(2026, 11, 7), "");
        f2.setDataFeito(LocalDate.of(2026, 11, 7));
        f2.setNota(4);

        Prato f3 = new Prato(contadorId.getAndIncrement(), "Pudim de Leite", "Jantar", "Sobremesa", 6, LocalDate.of(2026, 11, 9), "");
        f3.setDataFeito(LocalDate.of(2026, 11, 9));
        f3.setNota(5);

        feitos.add(f1);
        feitos.add(f2);
        feitos.add(f3);
    }

    @GetMapping("/")
    public String inicio(Model model) {
        model.addAttribute("total", pratos.size());
        model.addAttribute("feitos", feitos.size());

        Optional<Prato> proximo = pratos.stream()
                .filter(p -> p.getDataPlanejada() != null)
                .min(Comparator.comparing(Prato::getDataPlanejada));

        model.addAttribute("proximoPrato", proximo.orElse(null));
        return "index";
    }

    @GetMapping("/pratos")
    public String listarPratos(Model model) {
        model.addAttribute("pratos", pratos);
        return "lista";
    }

    @GetMapping("/pratos/novo")
    public String novoPratoForm() {
        return "formulario";
    }

    @PostMapping("/pratos")
    public String salvarPrato(Prato prato) {
        prato.setId(contadorId.getAndIncrement());
        if (prato.getTipo() == null || prato.getTipo().isBlank()) {
            prato.setTipo("Almoço");
        }
        pratos.add(prato);
        return "redirect:/pratos";
    }

    @PostMapping("/pratos/{id}/fazer")
    public String marcarComoFeito(@PathVariable Long id) {
        Optional<Prato> pratoEncontrado = pratos.stream()
                .filter(p -> p.getId().equals(id))
                .findFirst();

        if (pratoEncontrado.isPresent()) {
            Prato prato = pratoEncontrado.get();
            pratos.remove(prato);
            prato.setDataFeito(LocalDate.now());
            prato.setNota(5);
            feitos.add(0, prato);
        }

        return "redirect:/pratos";
    }

    @GetMapping("/feitos")
    public String listarFeitos(Model model) {
        model.addAttribute("feitos", feitos);
        return "feitos";
    }

    @PostMapping("/feitos/{id}/avaliar")
    public String avaliarPrato(@PathVariable Long id, @RequestParam("nota") int nota) {
        feitos.stream()
                .filter(f -> f.getId().equals(id))
                .findFirst()
                .ifPresent(f -> f.setNota(Math.max(1, Math.min(5, nota))));

        return "redirect:/feitos";
    }
}
