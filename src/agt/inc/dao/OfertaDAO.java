package inc.dao;

import java.util.List;

import inc.Oferta;

public interface OfertaDAO extends GenericDAO<Oferta>  {

	List<Oferta> findByFornecedorName(String fornecedorName);

	
}
