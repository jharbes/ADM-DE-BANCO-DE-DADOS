package view;

import fragments.*;
import java.awt.event.ActionEvent;

import javax.swing.*;

@SuppressWarnings("serial")
public class CalculadoraView extends JFrame {
	
	private javax.swing.JMenuBar menuBar;
	private javax.swing.JMenu menuCalculadora;
	private javax.swing.JMenuItem calculadora;
	private javax.swing.JMenuItem historico;
	private javax.swing.JMenuItem baseDeDados;
	private javax.swing.JMenuItem meusDados;
	
	private javax.swing.JDesktopPane mainContent;
	
	private Calcular_fragment telaCalcular;
	private Historico_fragment telaHistorico;
	private BaseDeDados_fragment telaBaseDeDados;
	private MeusDados_fragment telaMeusDados;
	
	private int baseBuscaDados;

    public CalculadoraView() {
        this.build();
        this.events();
    }
    
    public void build() {
    	
    	setTitle("Calculadora");
    	
    	menuBar = new javax.swing.JMenuBar();
        menuCalculadora = new javax.swing.JMenu();
        calculadora = new javax.swing.JMenuItem();
        historico = new javax.swing.JMenuItem();
        baseDeDados = new javax.swing.JMenuItem();
        meusDados = new javax.swing.JMenuItem();
        
        mainContent = new javax.swing.JDesktopPane();

        telaCalcular = new Calcular_fragment(0);
		
        
        menuCalculadora.setText("Opções");
        calculadora.setText("Calculadora");
        historico.setText("Histórico");
        baseDeDados.setText("Base de dados");
        meusDados.setText("Meus dados");
        
        menuCalculadora.add(calculadora);
        menuCalculadora.add(historico);
        menuCalculadora.add(baseDeDados);
        menuCalculadora.add(meusDados);
        
        menuBar.add(menuCalculadora);
        
        
        mainContent.add(telaCalcular);

        
        setJMenuBar(menuBar);
        
        getContentPane().add(mainContent);

        setSize(300, 510);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }
    
    public void events() {
    	this.calculadora.addActionListener(this::Calcular);
    	this.historico.addActionListener(this::Historico);
    	this.baseDeDados.addActionListener(this::escolherBaseDeDados);
    	this.meusDados.addActionListener(this::manterDados);
    }
    
    private void Calcular(ActionEvent e) {
		this.mainContent.remove(this.mainContent.getComponent(0));
		
		if(telaBaseDeDados == null)
    		this.telaBaseDeDados = new BaseDeDados_fragment();
		
		this.baseBuscaDados = this.retornaBaseDeDados(this.telaBaseDeDados);
		
		telaCalcular = new Calcular_fragment(this.baseBuscaDados);
		
		this.mainContent.add(this.telaCalcular);
		this.telaCalcular.show();
    }
    
    public void Historico(ActionEvent e) {
    	this.mainContent.remove(this.mainContent.getComponent(0));
    	
    	if(telaBaseDeDados == null)
    		this.telaBaseDeDados = new BaseDeDados_fragment();
    	
    	this.baseBuscaDados = this.retornaBaseDeDados(this.telaBaseDeDados);
    	
    	this.telaHistorico = new Historico_fragment(this, this.baseBuscaDados);
		
		this.mainContent.add(this.telaHistorico);
		this.telaHistorico.show();
    }
    
    private void escolherBaseDeDados(ActionEvent e) {
    	this.mainContent.remove(this.mainContent.getComponent(0));
    	
    	if(telaBaseDeDados == null)
    		this.telaBaseDeDados = new BaseDeDados_fragment();
		
		this.mainContent.add(this.telaBaseDeDados);
		this.telaBaseDeDados.show();
    }
    
    private void manterDados(ActionEvent e) {
    	this.mainContent.remove(this.mainContent.getComponent(0));
    	
    	if(telaBaseDeDados == null)
    		this.telaBaseDeDados = new BaseDeDados_fragment();
    	
        this.baseBuscaDados = this.retornaBaseDeDados(this.telaBaseDeDados);
    	
    	telaMeusDados = new MeusDados_fragment(this.baseBuscaDados);
		
		this.mainContent.add(this.telaMeusDados);
		this.telaMeusDados.show();
    }
    
    private int retornaBaseDeDados(BaseDeDados_fragment tela) {
    	return tela.buttonGroup.getSelection().getMnemonic();
    }
}