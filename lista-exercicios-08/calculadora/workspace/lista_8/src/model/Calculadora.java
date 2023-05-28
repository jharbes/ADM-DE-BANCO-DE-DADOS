package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import org.bson.Document;

import com.mongodb.client.MongoCursor;

import expression.*;

import DAOMARIADB.*;
import DAOMONGODB.CalculadoraDAOMONGODB;

public class Calculadora {

    public String concat(String btnValue, String resultValue) {
    	return resultValue + btnValue;
    }

	public String addOperacao(String btnValue, String resultValue) {
		String s = resultValue, operations = "+-*/.";
		
		return (operations.indexOf(s.charAt(s.length() - 1)) < 0) ? s + btnValue : s;
	}
	
	public String addPi(String resultValue) {
		String s = resultValue, operations = "+-*/";
		
		if(resultValue.isEmpty()) return "3.14";
		
		return (operations.indexOf(s.charAt(s.length() - 1)) < 0) ? s : s  + "3.14";
	}
	
	public String addPonto(String resultValue) {
		boolean isset = false;
		String operations = "+-*/", aResultValue [] = resultValue.split("");
		
		if(operations.indexOf(resultValue.charAt(resultValue.length() - 1)) >= 0) return resultValue;
		
		for(String character : aResultValue) {
			if(character.equals("."))
				isset = true;
			else if(operations.indexOf(character) >= 0)
				isset = false;
		}
		
		return isset ? resultValue : resultValue + ".";
	}

	private static String arredondar(Double resultado) {
		return new DecimalFormat("#,##0.00").format(resultado);
	}

	
	public String calcularResultado(String equacao, int idUser, int baseBuscaDados) {
		String operations = "+-*/", resultadoEquacao;
				
		if(operations.indexOf(equacao.charAt(equacao.length() - 1)) >= 0) {
			equacao = equacao.substring(0, equacao.length() - 1);
		}
		
		resultadoEquacao = Calculadora.arredondar(CalculateExpression.calcularExpressao(equacao)).replace(",", ".");
		
		if(baseBuscaDados == 0)
			return CalculadoraDAOMARIADB.inserirHistorico(equacao, idUser) ? resultadoEquacao : "erro";
		else
			return CalculadoraDAOMONGODB.inserirHistorico(equacao, idUser) ? resultadoEquacao : "erro";
	}
	
	public static boolean excluirHistorico(String idHistorico, int baseBuscaDados) {
		if(baseBuscaDados == 0)
			return CalculadoraDAOMARIADB.excluirHistorico(idHistorico);
		else
			return CalculadoraDAOMONGODB.excluirHistorico(idHistorico);
	}
	
	public static String [][] buscarHistorico(Usuario usuario, int baseBuscaDados){
		if(baseBuscaDados == 0) {
			ResultSet rs = CalculadoraDAOMARIADB.buscarHistorico(usuario.idUser);
			
			ArrayList<String> operacoes = new ArrayList<String>();
			ArrayList<Integer> identificador = new ArrayList<Integer>();
			
			try {
				while(rs.next()) {
					identificador.add(rs.getInt("idHistorico"));
					operacoes.add(rs.getString("operacao"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String [][] listaOperacoes = new String[operacoes.size()][2];
			
			
			for(int i = 0; i < operacoes.size(); i++) {
	        	listaOperacoes[i][0] = operacoes.get(i);
	        	listaOperacoes[i][1] = Integer.toString(identificador.get(i));
	        }
			
			return listaOperacoes;
		}else {
			MongoCursor<Document> historicoMongo = CalculadoraDAOMONGODB.buscarHistorico(usuario.idUser);
			
			ArrayList<String> operacoes = new ArrayList<String>();
			ArrayList<Integer> identificador = new ArrayList<Integer>();
			
			while(historicoMongo.hasNext()) {
				Document docAux = historicoMongo.next();
				
				identificador.add(((Integer) docAux.get("idHistorico")));
				operacoes.add(((String) docAux.get("operacao")));
			}
			
			String [][] listaOperacoes = new String[operacoes.size()][2];
			
			
			for(int i = 0; i < operacoes.size(); i++) {
	        	listaOperacoes[i][0] = operacoes.get(i);
	        	listaOperacoes[i][1] = Integer.toString(identificador.get(i));
	        }
			
			return listaOperacoes;
		}
	}
}