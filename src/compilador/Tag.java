package compilador;

public class Tag {

	public final static int
		KEYWORD = 1;

    public final static int
    	ID = 101, LITERAL = 102, NUMBER = 103, SEMICOLON = 104, COMMA = 105, PARENTHESES = 106, COMMENT = 107;

    public final static int
    	MULT_OPERATOR = 201, ADD_OPERATOR = 202, ASSIGN_OPERATOR = 203, RELATIONAL_OPERATOR = 204;

    public static String getDescription(int tag) {
    	switch(tag) {
			case KEYWORD: return "Palavra chave";
			case ID: return "Identificador";
			case LITERAL: return "Cadeia de caracteres";
			case NUMBER: return "Número";
			case SEMICOLON: return "Ponto e vírgula";
			case COMMA: return "Vírgula";
			case PARENTHESES: return "Parênteses";
			case COMMENT: return "Comentário";
			case MULT_OPERATOR: return "Operador de multiplicação/divisão";
			case ADD_OPERATOR: return "Operador de adição/subtração";
			case ASSIGN_OPERATOR: return "Operador de atribuição";
			case RELATIONAL_OPERATOR: return "Operador relacional";
    		default: return "";
    	}
    }

}
