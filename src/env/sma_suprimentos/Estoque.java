// CArtAgO artifact code for project sma_suprimentos

package sma_suprimentos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.OpFeedbackParam;
import inc.Suprimento;
import inc.dao.SuprimentoDAO;
import inc.dao.jpa.SuprimentoJPADAO;

public class Estoque extends Artifact {
	
	void init() {
		EntityManagerFactory emf =	Persistence.createEntityManagerFactory("dev");
		EntityManager em = emf.createEntityManager();
		
		em.close();
	}
	
	@OPERATION
	void loadSuprimentos() {
		SuprimentoDAO suprimentoDAO = new SuprimentoJPADAO();
		List<Suprimento> suprimentos = suprimentoDAO.findAll();
		suprimentoDAO.close();
		
		for(Suprimento s : suprimentos) {
			signal("suprimento", s.getNome(), s.getQuantidadeEstoque(), s.getQuantidadeMinima());
		}
	}
	
	@OPERATION
	void addSuprimento(String nome, Integer quantidadeEstoque, Integer quantidadeMinima) {
		Suprimento suprimento = new Suprimento(nome, quantidadeEstoque, quantidadeMinima);
		
		SuprimentoDAO suprimentoDAO = new SuprimentoJPADAO();
		
		suprimentoDAO.beginTransaction();
		suprimentoDAO.save(suprimento);
		suprimentoDAO.commit();
		
		signal("suprimento", suprimento.getNome(), suprimento.getQuantidadeEstoque(), suprimento.getQuantidadeMinima());
	}
	
	@OPERATION
	void removeSuprimento(Integer id, OpFeedbackParam<Object> res)  {
		SuprimentoDAO suprimentoDAO = new SuprimentoJPADAO();
		
		suprimentoDAO.beginTransaction();
		suprimentoDAO.deleteById(id);
		suprimentoDAO.commit();
	}
	

}

