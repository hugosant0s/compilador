package compilador;

public class Yytoken {

    public int m_index;
    public String m_text;
    public int m_line;

    public Yytoken (int tag, String text, int line) {
        m_index = tag;
        m_text = text;
        m_line = line;
    }

    public String toString() {
        return "TAG: " + m_index + " | TAG DESCRIPTION: " + Tag.getDescription(m_index) +  " | TEXT: " + m_text + " | LINE: " + m_line;
    }

}