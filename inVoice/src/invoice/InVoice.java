package invoice;

public class InVoice {
    private int codigo;
    private String descricao;
    private double quantidade;
    private double preco;

    public static void main(String[] args) {
        InVoice invoice = new InVoice();
        invoice.setCodigo(1);
        invoice.setDescricao("Produto");
        invoice.setQuantidade(4);
        invoice.setPreco(10.50);

        double total = invoice.getTotal();
        System.out.println("Total: " + total);
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setQuantidade(double quantidade) {
        if (quantidade < 0) {
            this.quantidade = 0;
        } else {
            this.quantidade = quantidade;
        }
    }

    public void setPreco(double preco) {
        if (preco < 0) {
            this.preco = 0.0;
        } else {
            this.preco = preco;
        }
    }

    public int getCodigo() {
        return codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public double getQuantidade() {
        return quantidade;
    }

    public double getPreco() {
        return preco;
    }
    
    public double getTotal() {
        return quantidade * preco;
    }
}
