package compilador;

public class Token {

    public int tag;
    public String lexema;

    public Token(int tag, String lexema) {
        this.tag = tag;
        this.lexema = lexema;
    }

}
