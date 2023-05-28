package model;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bson.Document;

import DAOMARIADB.*;
import DAOMONGODB.UsuarioDAOMONGODB;

public class Usuario {
	public int idUser;
	public String nome;
	public String email;
	public String telefone;
	
	public Usuario() {
		super();
	}
	
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public static Usuario buscarDadosUsuario(int idUser, int baseBuscaDados) {
		if(baseBuscaDados == 0) {
			ResultSet rs = UsuarioDAOMARIADB.buscarDados(idUser);
			Usuario usuario = new Usuario();
			
			try {
				while(rs.next()) {
					usuario.setIdUser(rs.getInt("idUser"));
					usuario.setNome(rs.getString("nome"));
					usuario.setEmail(rs.getString("email"));
					usuario.setTelefone(rs.getString("telefone"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return usuario;
		}else{
			Document userMongo = UsuarioDAOMONGODB.buscarDados(idUser);
			Usuario usuario = new Usuario();
			
			usuario.setIdUser(((Integer) userMongo.get("idUser")));
			usuario.setNome((String) userMongo.get("nome"));
			usuario.setEmail((String) userMongo.get("email"));
			usuario.setTelefone((String) userMongo.get("telefone"));
			
			return usuario;
		}
	}

	public static boolean salvarDadosUsuario(Usuario usuario, int baseBuscaDados) {
		if(baseBuscaDados == 0)
			return UsuarioDAOMARIADB.salvarDados(usuario);
		else 
			return UsuarioDAOMONGODB.salvarDados(usuario);
	}
}