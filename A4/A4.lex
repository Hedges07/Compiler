import java_cup.runtime.*;
import java.io.*;
%%
%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%class A4Scanner
%eofval{ return null;
%eofval}
%state commentState
%%

<YYINITIAL> "/**" {yybegin(commentState);}
<commentState> . {}
<commentState> "**/" {yybegin(YYINITIAL);}
<YYINITIAL> \"[^\"]*\" { return new Symbol(A4Symbol.QSTRING, yytext());}
<YYINITIAL> "WRITE" {return new Symbol(A4Symbol.WRITE);}
<YYINITIAL> "READ" {return new Symbol(A4Symbol.READ);}
<YYINITIAL> "IF" {return new Symbol(A4Symbol.IF);}
<YYINITIAL> "ELSE" {return new Symbol(A4Symbol.ELSE);}
<YYINITIAL> "RETURN" {return new Symbol(A4Symbol.RETURN);}
<YYINITIAL> "BEGIN" {return new Symbol(A4Symbol.BEGIN);}
<YYINITIAL> "END" {return new Symbol(A4Symbol.END);}
<YYINITIAL> "MAIN" {return new Symbol(A4Symbol.MAIN);}
<YYINITIAL> "STRING" {return new Symbol(A4Symbol.STRING);}
<YYINITIAL> "INT" {return new Symbol(A4Symbol.INT);}
<YYINITIAL> "REAL" {return new Symbol(A4Symbol.REAL);}
<YYINITIAL> "TRUE" {return new Symbol(A4Symbol.TRUE);}
<YYINITIAL> "FALSE" {return new Symbol(A4Symbol.FALSE);}
<YYINITIAL> ";" {return new Symbol(A4Symbol.SEMI);}
<YYINITIAL> "," {return new Symbol(A4Symbol.COMMA);}
<YYINITIAL> "(" {return new Symbol(A4Symbol.LPAREN);}
<YYINITIAL> ")" {return new Symbol(A4Symbol.RPAREN);}
<YYINITIAL> ":=" {return new Symbol(A4Symbol.ASSIGN);}
<YYINITIAL> "==" {return new Symbol(A4Symbol.EQUAL);}
<YYINITIAL> "!=" {return new Symbol(A4Symbol.NEQUAL);}
<YYINITIAL> "+" {return new Symbol(A4Symbol.PLUS);}
<YYINITIAL> "-" {return new Symbol(A4Symbol.MINUS);}
<YYINITIAL> "*" {return new Symbol(A4Symbol.TIMES);}
<YYINITIAL> "/" {return new Symbol(A4Symbol.DIVIDE);}
<YYINITIAL> [a-zA-Z][a-zA-Z0-9]* {return new Symbol(A4Symbol.ID, yytext());}
<YYINITIAL> [0-9]+(\.[0-9]+)? {return new Symbol(A4Symbol.NUM, yytext());}
[ \t\r\n\f] {}
. {System.exit(0);}