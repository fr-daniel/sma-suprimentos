package inc;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
		
@Entity
public class Oferta {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "fornecedor_name")
	private String fornecedorName;
	
	@Column(name = "suprimento_name")
	private String suprimentoName;
	
	private Double valor;

	public Oferta() {
	}
	
	public Oferta(Integer id, String fornecedorName, String suprimentoName, Double valor) {
		this.id = id;
		this.fornecedorName = fornecedorName;
		this.suprimentoName = suprimentoName;
		this.valor = valor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFornecedorName() {
		return fornecedorName;
	}

	public void setFornecedorName(String fornecedorName) {
		this.fornecedorName = fornecedorName;
	}

	public String getSuprimentoName() {
		return suprimentoName;
	}

	public void setSuprimentoId(String suprimentoName) {
		this.suprimentoName = suprimentoName;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}
}
