import java_cup.runtime.*;
import java.io.*;
%%
%type Symbol
%function yylex
%class A5Scanner
%eofval{ return new Symbol(A5Sym.EOF);
%eofval}
%state commentState
%%

<YYINITIAL> "/**" {yybegin(commentState);}
<commentState> . {}
<commentState> "**/" {yybegin(YYINITIAL);}
<YYINITIAL> \"[^\"]*\" { return new Symbol(A5Sym.QSTRING, yytext());}
<YYINITIAL> "WRITE" {return new Symbol(A5Sym.WRITE);}
<YYINITIAL> "READ" {return new Symbol(A5Sym.READ);}
<YYINITIAL> "IF" {return new Symbol(A5Sym.IF);}
<YYINITIAL> "ELSE" {return new Symbol(A5Sym.ELSE);}
<YYINITIAL> "RETURN" {return new Symbol(A5Sym.RETURN);}
<YYINITIAL> "BEGIN" {return new Symbol(A5Sym.BEGIN);}
<YYINITIAL> "END" {return new Symbol(A5Sym.END);}
<YYINITIAL> "MAIN" {return new Symbol(A5Sym.MAIN);}
<YYINITIAL> "STRING" {return new Symbol(A5Sym.STRING);}
<YYINITIAL> "INT" {return new Symbol(A5Sym.INT);}
<YYINITIAL> "REAL" {return new Symbol(A5Sym.REAL);}
<YYINITIAL> "TRUE" {return new Symbol(A5Sym.TRUE);}
<YYINITIAL> "FALSE" {return new Symbol(A5Sym.FALSE);}
<YYINITIAL> ";" {return new Symbol(A5Sym.SEMI);}
<YYINITIAL> "," {return new Symbol(A5Sym.COMMA);}
<YYINITIAL> "(" {return new Symbol(A5Sym.LPAREN);}
<YYINITIAL> ")" {return new Symbol(A5Sym.RPAREN);}
<YYINITIAL> ":=" {return new Symbol(A5Sym.ASSIGN);}
<YYINITIAL> "==" {return new Symbol(A5Sym.EQUAL);}
<YYINITIAL> "!=" {return new Symbol(A5Sym.NEQUAL);}
<YYINITIAL> "+" {return new Symbol(A5Sym.PLUS);}
<YYINITIAL> "-" {return new Symbol(A5Sym.MINUS);}
<YYINITIAL> "*" {return new Symbol(A5Sym.TIMES);}
<YYINITIAL> "/" {return new Symbol(A5Sym.DIVIDE);}
<YYINITIAL> [a-zA-Z][a-zA-Z0-9]* {return new Symbol(A5Sym.ID, yytext());}
<YYINITIAL> [0-9]+(\.[0-9]+)? {return new Symbol(A5Sym.NUM, yytext());}
[ \t\r\n\f] {}
. {System.exit(0);}