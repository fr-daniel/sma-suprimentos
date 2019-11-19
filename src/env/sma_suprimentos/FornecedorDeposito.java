package sma_suprimentos;

import java.util.List;

import cartago.Artifact;
import cartago.OPERATION;
import inc.Oferta;
import inc.dao.OfertaDAO;
import inc.dao.jpa.OfertaJPADAO;

public class FornecedorDeposito extends Artifact {

	@OPERATION
	public void loadOfertas(String fornecedor) {
	
		OfertaDAO ofertaDAO = new OfertaJPADAO();
		List<Oferta> ofertas = ofertaDAO.findByFornecedorName(fornecedor);
		ofertaDAO.close();
		
		for(Oferta oferta : ofertas) {
			signal("oferta", oferta.getSuprimentoName(), oferta.getValor());
		}
	
	}
	
}
