package DAOMARIADB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import model.Usuario;

public class UsuarioDAOMARIADB {
	public static ResultSet buscarDados(int idUser) {
		Statement stmt = ConexaoDAOMARIADB.conect();
		
		String query = "select idUser, nome, email, telefone from usuario where idUser = '" + idUser +"'";
		
		try {
			ResultSet rs = stmt.executeQuery(query);
			return rs;
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao carregar os dados do banco de dados. \nDetalhes: "+ e.getMessage());
			return null;
		}
	}
	
	public static boolean salvarDados(Usuario usuario) {
		int retorno;
		Statement stmt = ConexaoDAOMARIADB.conect();
		
		String query = "update calculadora.usuario set nome = '"+ usuario.nome +"', email = '"+ usuario.email +"', telefone = '"+ usuario.telefone +"' where idUser = "+ usuario.idUser;
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
}
