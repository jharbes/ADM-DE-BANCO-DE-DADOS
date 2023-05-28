package fragments;

import java.awt.Dimension;

import javax.swing.ButtonGroup;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.SwingConstants;

@SuppressWarnings("serial")
public class BaseDeDados_fragment extends javax.swing.JInternalFrame{
	
	private javax.swing.JLabel lblInstrucao;
	
	public ButtonGroup buttonGroup;
	
	private JRadioButton rbMariaDB;
    private JRadioButton rbMongoDB;
	
	public BaseDeDados_fragment() {
    	this.build();
    	this.events();
    }

	private void build() {
		((javax.swing.plaf.basic.BasicInternalFrameUI) this.getUI()).setNorthPane(null);
        setBorder(null);
		
        lblInstrucao = new javax.swing.JLabel("SELECIONE A BASE DE DADOS");
        lblInstrucao.setPreferredSize(new Dimension(285, 15));
        lblInstrucao.setHorizontalAlignment(SwingConstants.CENTER);
        
        buttonGroup = new ButtonGroup();
        
        rbMariaDB = new JRadioButton();
        rbMongoDB = new JRadioButton();
        
        
        rbMariaDB.setText("MariaDB");
        rbMariaDB.setSelected(true);
        rbMariaDB.setToolTipText("MariaDB");
        rbMariaDB.setMnemonic(0);
        
        rbMongoDB.setText("MongoDB");
        rbMongoDB.setToolTipText("MongoDB");
        rbMongoDB.setMnemonic(1);
        
        buttonGroup.add(rbMariaDB);
        buttonGroup.add(rbMongoDB);
		
		JPanel panel = new JPanel();
		
		panel.add(lblInstrucao);
		panel.add(rbMariaDB);
		panel.add(rbMongoDB);
		
		add(panel);
        
        setSize(285, 460);
        
        setVisible(true);
	}
	
	private void events() {
		
	}
}
