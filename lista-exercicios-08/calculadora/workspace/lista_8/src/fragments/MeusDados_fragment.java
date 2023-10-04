package fragments;

import java.awt.event.ActionEvent;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import model.Usuario;

@SuppressWarnings("serial")
public class MeusDados_fragment extends javax.swing.JInternalFrame{
	
	private javax.swing.JLabel lblNome;
	private JTextField nomeField;
	
	private javax.swing.JLabel lblEmail;
	private JTextField emailField;
	
	private javax.swing.JLabel lblTelefone;
	private JTextField telefoneField;
	
	private JButton btnSalvar;
	private JButton btnBuscar;
	
	private Usuario usuario;
	
	private int baseBuscaDados;
	
	public MeusDados_fragment(int baseBuscaDados) {
		this.baseBuscaDados = baseBuscaDados;
    	this.build();
    	this.events();
    }

	private void build() {
		((javax.swing.plaf.basic.BasicInternalFrameUI) this.getUI()).setNorthPane(null);
        setBorder(null);
        
        usuario = Usuario.buscarDadosUsuario(1, this.baseBuscaDados);
        
        lblNome = new javax.swing.JLabel("Nome");
        nomeField = new JTextField(22);
        nomeField.setText(this.usuario.nome);
        
        lblEmail = new javax.swing.JLabel("E-mail");
        emailField = new JTextField(22);
        emailField.setText(this.usuario.email);
        
        lblTelefone = new javax.swing.JLabel("Telefone");
        telefoneField = new JTextField(22);
        telefoneField.setText(this.usuario.telefone);
        
        btnBuscar = new JButton("Buscar");
        btnBuscar.setVerticalAlignment(SwingConstants.BOTTOM);
        btnSalvar = new JButton("Salvar");
        btnSalvar.setVerticalAlignment(SwingConstants.BOTTOM);
        
        
        JPanel panel = new JPanel();
        
        panel.add(lblNome);
        panel.add(nomeField);
        
        panel.add(lblEmail);
        panel.add(emailField);
        
        panel.add(lblTelefone);
        panel.add(telefoneField);

        panel.add(btnBuscar);
        panel.add(btnSalvar);
        
        add(panel);
        
        setSize(285, 460);
        
        setVisible(true);
	}

	private void events() {
		this.btnBuscar.addActionListener(this::buscarDados);
		this.btnSalvar.addActionListener(this::salvarDados);
	}
	
	public void buscarDados(ActionEvent e) {
    	Usuario usuario = Usuario.buscarDadosUsuario(this.usuario.idUser, this.baseBuscaDados);
    	
    	this.nomeField.setText(usuario.nome);
    	this.emailField.setText(usuario.email);
    	this.telefoneField.setText(usuario.telefone);
    }
	
	public void salvarDados(ActionEvent e) {
		usuario.setNome(this.nomeField.getText());
		usuario.setEmail(this.emailField.getText());
		usuario.setTelefone(this.telefoneField.getText());
		
		if(Usuario.salvarDadosUsuario(this.usuario, this.baseBuscaDados)) {
			JOptionPane.showMessageDialog(null, "Dados salvos com sucesso");
			this.nomeField.setText("");
	    	this.emailField.setText("");
	    	this.telefoneField.setText("");
		}else 
			JOptionPane.showMessageDialog(null, "Erro ao salvar os dados");
    }
}