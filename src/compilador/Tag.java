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
			case NUMBER: return "N�mero";
			case SEMICOLON: return "Ponto e v�rgula";
			case COMMA: return "V�rgula";
			case PARENTHESES: return "Par�nteses";
			case COMMENT: return "Coment�rio";
			case MULT_OPERATOR: return "Operador de multiplica��o/divis�o";
			case ADD_OPERATOR: return "Operador de adi��o/subtra��o";
			case ASSIGN_OPERATOR: return "Operador de atribui��o";
			case RELATIONAL_OPERATOR: return "Operador relacional";
    		default: return "";
    	}
    }

}
