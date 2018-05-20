package compilador;

%%

%line
%column
%type Token
%cup

%standalone

%{
	public final int yylenght() {
		return yytext().length();
	}

	public final int yyline() {
		return yyline;
	}

	public final int yycolumn() {
		return yycolumn;
	}

	public boolean isZzAtEOF() {
		return zzAtEOF;
	}

	public void printSuccessMessage(int tag) {
		Token token = new Token(tag, yytext(), yyline(), yycolumn());
	
		System.out.println(token.toString() + "\n");
		Utility.printSpace();
	}

	public void printErrorMessage() {
		System.out.println("Illegal character: <" + yytext().toString() + ">" + "\n");
    	Utility.error(Utility.E_UNMATCHED);
    	Utility.printSpace();
	}
%}

INTEGER = "integer"
READ = "read"
WRITE = "write"
DO = "do"
WHILE = "while"
IF = "if"
ELSE = "else"
THEN = "then"
BEGIN = "begin"
END = "end"
DECLARE = "declare"
PROGRAM = "program"

NONNEWLINE_WHITE_SPACE_CHAR = [\ \t\b]
NEWLINE = \r | \n | \r\n

BREAKLINE = [^\r\n]
LETTER = [A-Za-z]
DIGIT = [0-9]

MULOP = "*" | "/"
ADDOP = "+" | "-"
ASSOP = ":="
RELOP = "<" | "<=" | ">" | ">=" | "<>" | "="

COMMA = ","
SEMICOLON = ";"
PARENTHESE_LEFT = "("
PARENTHESE_RIGHT = ")"

IDENTIFIER = ({LETTER} | _) ({LETTER} | {DIGIT} | _)*	
LITERAL = "\"" [^\"]* "\""
CONSTANT = {DIGIT} | ([1-9] {DIGIT})*

%%

<YYINITIAL> {
    {PROGRAM} { printSuccessMessage(Tag.PROGRAM); }
    {DECLARE} { printSuccessMessage(Tag.DECLARE); }
    {BEGIN} { printSuccessMessage(Tag.BEGIN); }
    {END} { printSuccessMessage(Tag.END); }
    {READ} { printSuccessMessage(Tag.READ); }
    {WRITE} { printSuccessMessage(Tag.WRITE); }
    {INTEGER} { printSuccessMessage(Tag.INTEGER); }
    {DO} { printSuccessMessage(Tag.DO); }
    {WHILE} { printSuccessMessage(Tag.WHILE); }
    {IF} { printSuccessMessage(Tag.IF); }
    {ELSE} { printSuccessMessage(Tag.ELSE); }
    {THEN} { printSuccessMessage(Tag.THEN); }

    {COMMA} { printSuccessMessage(Tag.COMMA); }
    {SEMICOLON} { printSuccessMessage(Tag.SEMICOLON); }
    {PARENTHESE_LEFT} { printSuccessMessage(Tag.PARENTHESE_LEFT); }
    {PARENTHESE_RIGHT} { printSuccessMessage(Tag.PARENTHESE_RIGHT); }

    {IDENTIFIER} { printSuccessMessage(Tag.IDENTIFIER); }
    {CONSTANT} { printSuccessMessage(Tag.CONSTANT); }
    {LITERAL} { printSuccessMessage(Tag.LITERAL); }

	{MULOP} { printSuccessMessage(Tag.MULT_OPERATOR); }
    {ADDOP} { printSuccessMessage(Tag.ADD_OPERATOR); }
    {ASSOP} { printSuccessMessage(Tag.ASSIGN_OPERATOR); }
    {RELOP} { printSuccessMessage(Tag.RELATIONAL_OPERATOR); }

    {NONNEWLINE_WHITE_SPACE_CHAR}+ { }
    {NEWLINE} { }
}

. {
    printErrorMessage();
}
