package compilador;

%%

%line
%column

%standalone

%{
  	public final int yylenght() {
    	return yytext().length();
  	}

  	public final int yyline() {
    	return yyline;
  	}

  	public boolean isZzAtEOF() {
    	return zzAtEOF;
	}

	public void printSuccessMessage(int tag) {
		Yytoken token = new Yytoken(tag, yytext(), yyline());
	
		System.out.println(token.toString() + "\n");
		Utility.printSpace();
	}

	public void printErrorMessage() {
		System.out.println("Illegal character: <" + yytext().toString() + ">" + "\n");
    	Utility.error(Utility.E_UNMATCHED);
    	Utility.printSpace();
	}
%}

NONNEWLINE_WHITE_SPACE_CHAR = [\ \t\b]
NEWLINE = \r | \n | \r\n

CHARACTERE = [^\r\n]
LETTER = [A-Za-z]
DIGIT = [0-9]

MULOP = "*" | "/"
ADDOP = "+" | "-"
ASSOP = ":="
RELOP = "<" | "<=" | ">" | ">=" | "<>" | "="

PROGRAM = "program" IDENTIFY BODY
BODY = "declare" DECL_LIST "begin" STMT_LIST "end" | "begin" STMT_LIST "end"
DECL_LIST = DECL | DECL ";" DECL_LIST
DECL = TYPE IDENT_LIST
IDENT_LIST = IDENTIFY | IDENTIFY "," IDENT_LIST
TYPE = "integer"

STMT_LIST = STMT | STMT ";" STMT_LIST
STMT = ASSIGN_STMT | IF_STMT | WHILE_STMT | READ_STMT | WRITE_STMT
IF_STMT = "if" CONDITION "then" STMT_LIST "end" | "if" CONDITION "then" STMT_LIST "else" STMT_LIST "end"
CONDITION = EXPRESSION
WHILE_STMT = "do" STMT_LIST STMT_SUFFIX
STMT_SUFFIX = "while" CONDITION

ASSIGN_STMT = IDENTIFY ":=" SIMPLE_EXPR
READ_STMT = "read" "(" IDENTIFY ")"
WRITE_STMT = "write" "(" WRITEABLE ")"
WRITEABLE = SIMPLE_EXPR | LITERAL

EXPRESSION = SIMPLE_EXPR | SIMPLE_EXPR RELOP SIMPLE_EXPR
SIMPLE_EXPR = TERM | SIMPLE_EXPR ADDOP TERM
TERM = FACTOR | TERM MULOP FACTOR
FACTOR = IDENTIFIER | CONSTANT | "(" EXPRESSION ")"

COMMENT = {TRADITIONAL_COMMENT} | {END_OF_LINE_COMMENT} | {DOCUMENTATION_COMMENT}
END_OF_LINE_COMMENT     = "//" {CHARACTERE}* {NEWLINE}?
COMMENT_CONTENT = ([^*] | \*+ [^/*])*
DOCUMENTATION_COMMENT = "/**" {CHARACTERE} "*"+ "/"
TRADITIONAL_COMMENT   = "/*" [^*] ~"*/" | "/*" "*"+ "/"

COMMA = ","
SEMICOLON = ";"
PARENTHESES = "(" | ")"

IDENTIFIER = ({LETTER} | _) ({LETTER} | {DIGIT} | _)*	
LITERAL = "\"" [^\"]* "\""
CONSTANT = {DIGIT} | ([1-9] {DIGIT})*

%%

<YYINITIAL> "program"|"declare"|"begin"|"if"|"else"|"do"|"while"|"end"|"integer"  { printSuccessMessage(Tag.KEYWORD); }

<YYINITIAL> {
    {COMMENT} { printSuccessMessage(Tag.COMMENT); }
    {SEMICOLON} { printSuccessMessage(Tag.SEMICOLON); }
    {COMMA} { printSuccessMessage(Tag.COMMA); }
    {PARENTHESES} { printSuccessMessage(Tag.PARENTHESES); }

    {LITERAL} { printSuccessMessage(Tag.LITERAL); }
    {IDENTIFIER} { printSuccessMessage(Tag.ID); }
    {CONSTANT} { printSuccessMessage(Tag.NUMBER); }

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
