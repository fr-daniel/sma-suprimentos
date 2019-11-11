package inc;

public class Suprimento {

	private String nome;
	private Integer quantidadeEstoque;
	private Integer quantidadeMinima;
	
	public Suprimento() {
	}

	public Suprimento(String nome, Integer quantidadeEstoque, Integer quantidadeMinima) {
		this.nome = nome;
		this.quantidadeEstoque = quantidadeEstoque;
		this.quantidadeMinima = quantidadeMinima;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getQuantidadeEstoque() {
		return quantidadeEstoque;
	}

	public void setQuantidadeEstoque(Integer quantidadeEstoque) {
		this.quantidadeEstoque = quantidadeEstoque;
	}

	public Integer getQuantidadeMinima() {
		return quantidadeMinima;
	}

	public void setQuantidadeMinima(Integer quantidadeMinima) {
		this.quantidadeMinima = quantidadeMinima;
	}

}
