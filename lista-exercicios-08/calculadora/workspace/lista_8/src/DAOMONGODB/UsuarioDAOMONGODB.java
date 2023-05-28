package DAOMONGODB;

import model.Usuario;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.client.MongoCollection;

public class UsuarioDAOMONGODB {
	private static MongoCollection<Document> _users;
	
	public static boolean salvarDados(Usuario usuario) {

		try {
			_users = ConexaoDAOMONGODB.getConnection().getCollection("usuario");
			
			Document found = _users.find(new Document("idUser", usuario.idUser)).first();
			
			if(found != null) {
				List<Bson> updateDocument = new ArrayList<Bson>();
				updateDocument.add(new Document("$set", new Document("email", usuario.email)));
				updateDocument.add(new Document("$set", new Document("nome", usuario.nome)));
				updateDocument.add(new Document("$set", new Document("telefone", usuario.telefone)));
				_users.updateOne(found, updateDocument);
				return true;
			}
			
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static Document buscarDados(int idUser) {
		try {
			_users = ConexaoDAOMONGODB.getConnection().getCollection("usuario");
			
			return _users.find(new Document("idUser", idUser)).first();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}