package DAOMARIADB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class CalculadoraDAOMARIADB {
	
	public static boolean inserirHistorico(String operacao, int idUser) {
		int last_insert_id = 0;
		Statement stmt = ConexaoDAOMARIADB.conect();
		String query = "insert into historico (operacao, idUser) values ('" + operacao + "', "+ idUser +")";
		
		try {
			last_insert_id = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
			if(last_insert_id != 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao gravar histórico no banco de dados. \nDetalhes: "+ e.getMessage());
			return false;
		}
	}
	
	public static boolean excluirHistorico(String idHistorico) {
		int retorno;
		Statement stmt = ConexaoDAOMARIADB.conect();
		
		String query = "delete from historico where idHistorico = "+ idHistorico;
		try {
			retorno = stmt.executeUpdate(query);
			if(retorno != 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao salvar dados no banco de dados. \nDetalhes: "+ e.getMessage());
			return false;
		}
	}
	
	public static ResultSet buscarHistorico(int idUser) {
		Statement stmt = ConexaoDAOMARIADB.conect();
		
		String query = "select operacao, idHistorico from historico where idUser = '" + idUser +"'";
		
		try {
			ResultSet rs = stmt.executeQuery(query);
			return rs;
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao historico do banco de dados. \nDetalhes: "+ e.getMessage());
			return null;
		}
	}
	
}