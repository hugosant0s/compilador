package compilador;

public class Tag {

	public final static int
		INTEGER = 1, READ = 2, WRITE = 3, DO = 4, WHILE = 5, IF = 6, ELSE = 7, THEN = 8, BEGIN = 9, END = 10, DECLARE = 11, PROGRAM = 12;

    public final static int
    	IDENTIFIER = 101, LITERAL = 102, CONSTANT = 103, SEMICOLON = 104, COMMA = 105, PARENTHESE_LEFT = 106, PARENTHESE_RIGHT = 107, COMMENT = 108;

    public final static int
    	MULT_OPERATOR = 201, ADD_OPERATOR = 202, ASSIGN_OPERATOR = 203, RELATIONAL_OPERATOR = 204;

    public static String getDescription(int tag) {
    	switch(tag) {
			case INTEGER: return "Palavra chave: inteiro";
			case READ: return "Palavra chave: read";
			case WRITE: return "Palavra chave: write";
			case DO: return "Palavra chave: do";
			case WHILE: return "Palavra chave: while";
			case IF: return "Palavra chave: if";
			case ELSE: return "Palavra chave: else";
			case THEN: return "Palavra chave: then";
			case BEGIN: return "Palavra chave: begin";
			case END: return "Palavra chave: end";
			case DECLARE: return "Palavra chave: declare";
			case PROGRAM: return "Palavra chave: program";
			case IDENTIFIER: return "Identificador";
			case LITERAL: return "Cadeia de caracteres";
			case CONSTANT: return "Número";
			case SEMICOLON: return "Ponto e vírgula";
			case COMMA: return "Vírgula";
			case PARENTHESE_LEFT: return "Parênteses esquerdo";
			case PARENTHESE_RIGHT: return "Parênteses direito";
			case COMMENT: return "Comentário";
			case MULT_OPERATOR: return "Operador de multiplicação/divisão";
			case ADD_OPERATOR: return "Operador de adição/subtração";
			case ASSIGN_OPERATOR: return "Operador de atribuição";
			case RELATIONAL_OPERATOR: return "Operador relacional";
    		default: return "";
    	}
    }

}
