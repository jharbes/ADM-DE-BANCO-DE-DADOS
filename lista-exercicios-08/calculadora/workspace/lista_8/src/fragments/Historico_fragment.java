package fragments;

import java.awt.Dimension;
import java.awt.event.ActionEvent;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingConstants;

import model.Calculadora;
import model.Usuario;
import view.CalculadoraView;

@SuppressWarnings("serial")
public class Historico_fragment extends javax.swing.JInternalFrame{
	
	private javax.swing.JLabel lblHistorico;
	
	private JButton btnExcluir;
	
	private Usuario usuario;
	
	private JTable tabela;
	
	private JScrollPane barraRolagem;	
	public CalculadoraView calculadoraView;
	
	private int baseBuscaDados;
	
	public Historico_fragment(CalculadoraView calculadoraView, int baseBuscaDados) {
		this.calculadoraView = calculadoraView;
		this.baseBuscaDados = baseBuscaDados;
    	this.build();
    	this.events();
    }

	private void build() {
		((javax.swing.plaf.basic.BasicInternalFrameUI) this.getUI()).setNorthPane(null);
        setBorder(null);
        
        usuario = Usuario.buscarDadosUsuario(1, this.baseBuscaDados);
        
        String [] colunas = {"OPERAÇÃO","Identificador"};
        String [][] listaOperacoes =  Calculadora.buscarHistorico(usuario, this.baseBuscaDados);
        
        tabela = new JTable(listaOperacoes, colunas);
        barraRolagem = new JScrollPane(tabela);
        barraRolagem.setPreferredSize(new Dimension(280, 380));
        
        
        lblHistorico = new javax.swing.JLabel("HISTÓRICO");
        lblHistorico.setPreferredSize(new Dimension(285, 15));
        lblHistorico.setHorizontalAlignment(SwingConstants.CENTER);
		
        btnExcluir = new JButton("Excluir");
        
		JPanel panel = new JPanel();
		
		panel.add(lblHistorico);
		panel.add(barraRolagem);
		panel.add(btnExcluir);
		
		add(panel);
        
        setSize(285, 460);
        
        setVisible(true);
	}
	
	private void events() {
		this.btnExcluir.addActionListener(this::excluirHistorico);
	}
	
	public void excluirHistorico(ActionEvent e) {
    	int linha = this.tabela.getSelectedRow();
    	String idHistorico = (String) this.tabela.getValueAt(linha, 1);
    	
    	if(Calculadora.excluirHistorico(idHistorico, this.baseBuscaDados)) {
    		JOptionPane.showMessageDialog(null, "Operação excluída com sucesso");
    		
    		calculadoraView.Historico(null);
    	}else
    		JOptionPane.showMessageDialog(null, "Erro ao excluir operação");
    }
}
