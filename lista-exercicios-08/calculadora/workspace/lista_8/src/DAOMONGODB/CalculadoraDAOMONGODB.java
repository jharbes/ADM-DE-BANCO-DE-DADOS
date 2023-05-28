package DAOMONGODB;

import java.util.Arrays;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;

public class CalculadoraDAOMONGODB {
	private static MongoCollection<Document> _historico;

	public static boolean inserirHistorico(String equacao, int idUser) {
		try {
			_historico = ConexaoDAOMONGODB.getConnection().getCollection("historico");
			
			Document found = _historico.aggregate(Arrays.asList(Aggregates.group(null, Accumulators.max("maxx", "$idHistorico")))).first();
			
			int id = 0;
			if(found != null)
				id = ((Integer) found.get("maxx")) + 1;
			
			_historico.insertOne(new Document().append("_id", new ObjectId())
											   .append("idHistorico", id)
											   .append("operacao", equacao)
											   .append("idUser", idUser));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean excluirHistorico(String idHistorico) {
		try {
			_historico = ConexaoDAOMONGODB.getConnection().getCollection("historico");
			
			Document filtro = new Document("idHistorico", Integer.parseInt(idHistorico));
			
			_historico.deleteOne(filtro);
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static MongoCursor<Document> buscarHistorico(int idUser) {
		try {
			_historico = ConexaoDAOMONGODB.getConnection().getCollection("historico");
			
			return _historico.find().iterator();
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}
	}

}