package inc.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import inc.Oferta;
import inc.dao.OfertaDAO;

public class OfertaJPADAO extends GenericJPADAO<Oferta> implements OfertaDAO {

	public OfertaJPADAO() {
		super(Oferta.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Oferta> findByFornecedorName(String fornecedorName) {
		EntityManager em = JPAUtil.getEntityManager();
		Query query = em.createQuery("SELECT o FROM Oferta o WHERE fornecedor_name = :fornecedorName ");
		query.setParameter("fornecedorName", fornecedorName);
		return query.getResultList();
	}
}
