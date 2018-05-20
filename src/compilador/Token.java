package compilador;

public class Token extends java_cup.runtime.Symbol {

    public int tag;
    public String lexema;

    private int line;
    private int column;

    public Token(int tag, String lexema) {
    	super(tag);
        this.tag = tag;
        this.lexema = lexema;
    }

    public Token(int tag, String lexema, int line, int column) {
    	super(tag, line, column);
    	this.tag = tag;
    	this.lexema = lexema;
    	this.line = line;
    	this.column = column;
    }

	public int getTag() {
		return tag;
	}

	public String getLexema() {
		return lexema;
	}

	public int getLine() {
		return line;
	}

	public int getColumn() {
		return column;
	}

	@Override
	public String toString() {
		return "TAG: " + tag + " | Lexema: " + lexema + " | Line: " + line + " | Column: " + column;
	}

}
