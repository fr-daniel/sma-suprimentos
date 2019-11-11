// CArtAgO artifact code for project sma_suprimentos

package sma_suprimentos;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import cartago.*;
import inc.Suprimento;

public class Estoque extends Artifact {
	
	private List<Suprimento> suprimentos = new ArrayList<Suprimento>();
	
	@OPERATION
	void loadSuprimentos() {
		Suprimento suprimento = new Suprimento("cerveja", 10, 3);
		Suprimento suprimento2 = new Suprimento("arroz", 3, 5);
		Suprimento suprimento3 = new Suprimento("feijão", 10, 4);
		Suprimento suprimento4 = new Suprimento("açúcar", 4, 6);
		
		suprimentos.addAll(Arrays.asList(suprimento, suprimento2, suprimento3, suprimento4));
		
		for (Suprimento s : suprimentos) {
			signal("suprimento", s.getNome(), s.getQuantidadeEstoque(), s.getQuantidadeMinima());
		}
	}
	
	@OPERATION
	void addSuprimento(String nome, Integer quantidadeEstoque, Integer quantidadeMinima) {
		Suprimento suprimento = new Suprimento(nome, quantidadeEstoque, quantidadeMinima);
		suprimentos.add(suprimento);
		
		signal("suprimento", suprimento.getNome(), suprimento.getQuantidadeEstoque(), suprimento.getQuantidadeMinima());
	}
	
	@OPERATION(guard="suprimentosAvailable")
	void removeSuprimento(OpFeedbackParam<Object> res)  {
		
	}
	
	@GUARD
	boolean suprimentosAvailable(OpFeedbackParam<Object> res){
		return suprimentos.size() > 0;
	}
	
}

