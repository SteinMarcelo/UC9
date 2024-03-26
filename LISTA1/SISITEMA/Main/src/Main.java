import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        GerenciadorSistema gerenciador = new GerenciadorSistema();
        
        gerenciador.adicionarGerente("Gerente Financeiro", "Financeiro");
        gerenciador.adicionarEmpregado("Empregado1", "Produção");
        gerenciador.adicionarEmpregadoTerceirizado("EmpregadoTerceirizado1", "Limpeza");
        
        Pedido pedido = new Pedido("01/01/2024", "02/01/2024", 100.00);
        pedido.setResponsavelVendas("Vendedor1");
        
        Produto banner = new Produto("Banner", 50.00);
        pedido.adicionarProduto(banner);
        
        gerenciador.adicionarPedido(pedido);
        
        gerenciador.mostrarPedidos();
    }
}

class GerenciadorSistema {
    private List<Gerente> gerentes;
    private List<Empregado> empregados;
    private List<EmpregadoTerceirizado> empregadosTerceirizados;
    private List<Pedido> pedidos;
    
    public GerenciadorSistema() {
        gerentes = new ArrayList<>();
        empregados = new ArrayList<>();
        empregadosTerceirizados = new ArrayList<>();
        pedidos = new ArrayList<>();
    }
    
    public void adicionarGerente(String nome, String setor) {
        gerentes.add(new Gerente(nome, setor));
    }
    
    public void adicionarEmpregado(String nome, String funcao) {
        empregados.add(new Empregado(nome, funcao));
    }
    
    public void adicionarEmpregadoTerceirizado(String nome, String atividade) {
        empregadosTerceirizados.add(new EmpregadoTerceirizado(nome, atividade));
    }
    
    public void adicionarPedido(Pedido pedido) {
        pedidos.add(pedido);
    }
    
    public void mostrarPedidos() {
        for (Pedido pedido : pedidos) {
            System.out.println(pedido);
        }
    }
}

class Gerente {
    private String nome;
    private String setor;
    
    public Gerente(String nome, String setor) {
        this.nome = nome;
        this.setor = setor;
    }
}

class Empregado {
    private String nome;
    private String funcao;
    
    public Empregado(String nome, String funcao) {
        this.nome = nome;
        this.funcao = funcao;
    }
}

class EmpregadoTerceirizado {
    private String nome;
    private String atividade;
    
    public EmpregadoTerceirizado(String nome, String atividade) {
        this.nome = nome;
        this.atividade = atividade;
    }
}

class Pedido {
    private String dataEmissao;
    private String dataFinalizacao;
    private double preco;
    private String responsavelVendas;
    private List<Produto> produtos;
    
    public Pedido(String dataEmissao, String dataFinalizacao, double preco) {
        this.dataEmissao = dataEmissao;
        this.dataFinalizacao = dataFinalizacao;
        this.preco = preco;
        produtos = new ArrayList<>();
    }
    
    public void setResponsavelVendas(String responsavelVendas) {
        this.responsavelVendas = responsavelVendas;
    }
    
    public void adicionarProduto(Produto produto) {
        produtos.add(produto);
    }
    
    @Override
    public String toString() {
        return "Pedido [dataEmissao=" + dataEmissao + ", dataFinalizacao=" + dataFinalizacao + ", preco=" + preco
                + ", responsavelVendas=" + responsavelVendas + ", produtos=" + produtos + "]";
    }
}

class Produto {
    private String tipo;
    private double preco;
    
    public Produto(String tipo, double preco) {
        this.tipo = tipo;
        this.preco = preco;
    }
    
    @Override
    public String toString() {
        return "Produto [tipo=" + tipo + ", preco=" + preco + "]";
    }
}
