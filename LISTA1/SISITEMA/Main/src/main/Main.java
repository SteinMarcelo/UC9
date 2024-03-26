import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        GerenciadorSistema gerenciador = new GerenciadorSistema();
        
        boolean continuar = true;
        while (continuar) {
            System.out.println("\nEscolha uma opção:");
            System.out.println("1 - Adicionar Gerente");
            System.out.println("2 - Adicionar Empregado");
            System.out.println("3 - Adicionar Empregado Terceirizado");
            System.out.println("4 - Adicionar Pedido");
            System.out.println("5 - Mostrar Pedidos");
            System.out.println("0 - Sair");
            System.out.print("Opção: ");
            int opcao = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer do scanner
            
            switch (opcao) {
                case 1:
                    System.out.print("Nome do gerente: ");
                    String nomeGerente = scanner.nextLine();
                    System.out.print("Setor do gerente: ");
                    String setorGerente = scanner.nextLine();
                    gerenciador.adicionarGerente(nomeGerente, setorGerente);
                    break;
                case 2:
                    System.out.print("Nome do empregado: ");
                    String nomeEmpregado = scanner.nextLine();
                    System.out.print("Função do empregado: ");
                    String funcaoEmpregado = scanner.nextLine();
                    gerenciador.adicionarEmpregado(nomeEmpregado, funcaoEmpregado);
                    break;
                case 3:
                    System.out.print("Nome do empregado terceirizado: ");
                    String nomeTerceirizado = scanner.nextLine();
                    System.out.print("Atividade do empregado terceirizado: ");
                    String atividadeTerceirizado = scanner.nextLine();
                    gerenciador.adicionarEmpregadoTerceirizado(nomeTerceirizado, atividadeTerceirizado);
                    break;
                case 4:
                    System.out.print("Data de emissão do pedido (DD/MM/AAAA): ");
                    String dataEmissao = scanner.nextLine();
                    System.out.print("Data de finalização do pedido (DD/MM/AAAA): ");
                    String dataFinalizacao = scanner.nextLine();
                    System.out.print("Preço do pedido: ");
                    double precoPedido = scanner.nextDouble();
                    scanner.nextLine(); // Limpar o buffer do scanner
                    Pedido pedido = new Pedido(dataEmissao, dataFinalizacao, precoPedido);
                    System.out.print("Responsável pela venda: ");
                    String responsavelVendas = scanner.nextLine();
                    pedido.setResponsavelVendas(responsavelVendas);
                    gerenciador.adicionarPedido(pedido);
                    break;
                case 5:
                    gerenciador.mostrarPedidos();
                    break;
                case 0:
                    continuar = false;
                    break;
                default:
                    System.out.println("Opção inválida.");
            }
        }
        
        scanner.close();
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
        System.out.println("Gerente adicionado com sucesso!");
    }
    
    public void adicionarEmpregado(String nome, String funcao) {
        empregados.add(new Empregado(nome, funcao));
        System.out.println("Empregado adicionado com sucesso!");
    }
    
    public void adicionarEmpregadoTerceirizado(String nome, String atividade) {
        empregadosTerceirizados.add(new EmpregadoTerceirizado(nome, atividade));
        System.out.println("Empregado terceirizado adicionado com sucesso!");
    }
    
    public void adicionarPedido(Pedido pedido) {
        pedidos.add(pedido);
        System.out.println("Pedido adicionado com sucesso!");
    }
    
    public void mostrarPedidos() {
        if (pedidos.isEmpty()) {
            System.out.println("Não há pedidos cadastrados.");
        } else {
            System.out.println("Pedidos cadastrados:");
            for (Pedido pedido : pedidos) {
                System.out.println(pedido);
            }
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
    
    @Override
    public String toString() {
        return "Gerente [nome=" + nome + ", setor=" + setor + "]";
    }
}

class Empregado {
    private String nome;
    private String funcao;
    
    public Empregado(String nome, String funcao) {
        this.nome = nome;
        this.funcao = funcao;
    }
    
    @Override
    public String toString() {
        return "Empregado [nome=" + nome + ", funcao=" + funcao + "]";
    }
}
