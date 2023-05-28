package expression;

import java.util.Stack;

public class CalculateExpression {

    public static double calcularExpressao(String expressao) {
        // Remover espaços em branco da expressão
        expressao = expressao.replaceAll("\\s+", "");

        // Pilha para armazenar os números
        Stack<Double> numeros = new Stack<>();
        // Pilha para armazenar os operadores
        Stack<Character> operadores = new Stack<>();

        for (int i = 0; i < expressao.length(); i++) {
            char caractere = expressao.charAt(i);
            if (Character.isDigit(caractere)) {
                // Extrair o número da expressão
                StringBuilder sb = new StringBuilder();
                while (i < expressao.length() && (Character.isDigit(expressao.charAt(i)) || expressao.charAt(i) == '.')) {
                    sb.append(expressao.charAt(i));
                    i++;
                }
                i--;

                // Converter o número para double e adicioná-lo à pilha de números
                numeros.push(Double.parseDouble(sb.toString()));
            } else if (caractere == '(') {
                // Adicionar o parêntese de abertura à pilha de operadores
                operadores.push(caractere);
            } else if (caractere == ')') {
                // Resolver a expressão entre parênteses
                while (!operadores.isEmpty() && operadores.peek() != '(') {
                    calcular(numeros, operadores);
                }
                operadores.pop(); // Remover o parêntese de abertura da pilha de operadores
            } else if (isOperador(caractere)) {
                // Processar operadores
                while (!operadores.isEmpty() && precedence(caractere) <= precedence(operadores.peek())) {
                    calcular(numeros, operadores);
                }
                operadores.push(caractere);
            }
        }

        // Calcular o restante da expressão
        while (!operadores.isEmpty()) {
            calcular(numeros, operadores);
        }

        // O resultado final será o único número restante na pilha de números
        return numeros.pop();
    }

    private static void calcular(Stack<Double> numeros, Stack<Character> operadores) {
        double numero2 = numeros.pop();
        double numero1 = numeros.pop();
        char operador = operadores.pop();
        double resultado = 0.0;

        switch (operador) {
            case '+':
                resultado = numero1 + numero2;
                break;
            case '-':
                resultado = numero1 - numero2;
                break;
            case '*':
                resultado = numero1 * numero2;
                break;
            case '/':
                resultado = numero1 / numero2;
                break;
        }

        numeros.push(resultado);
    }

    private static boolean isOperador(char caractere) {
        return caractere == '+' || caractere == '-' || caractere == '*' || caractere == '/';
    }

    private static int precedence(char operador) {
        switch (operador) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
        }
        return -1;
    }
}