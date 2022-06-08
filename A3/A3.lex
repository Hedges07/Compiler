import java_cup.runtime.*;
import java.io.*;
%%
%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%class A3Scanner
%eofval{ return null;
%eofval}
%state commentState
%%

<YYINITIAL> "/**" {yybegin(commentState);}
<commentState> . {}
<commentState> "**/" {yybegin(YYINITIAL);}
<YYINITIAL> \"[^\"]*\" { return new Symbol(A3Symbol.QSTRING, yytext());}
<YYINITIAL> "WRITE" {return new Symbol(A3Symbol.WRITE);}
<YYINITIAL> "READ" {return new Symbol(A3Symbol.READ);}
<YYINITIAL> "IF" {return new Symbol(A3Symbol.IF);}
<YYINITIAL> "ELSE" {return new Symbol(A3Symbol.ELSE);}
<YYINITIAL> "RETURN" {return new Symbol(A3Symbol.RETURN);}
<YYINITIAL> "BEGIN" {return new Symbol(A3Symbol.BEGIN);}
<YYINITIAL> "END" {return new Symbol(A3Symbol.END);}
<YYINITIAL> "MAIN" {return new Symbol(A3Symbol.MAIN);}
<YYINITIAL> "STRING" {return new Symbol(A3Symbol.STRING);}
<YYINITIAL> "INT" {return new Symbol(A3Symbol.INT);}
<YYINITIAL> "REAL" {return new Symbol(A3Symbol.REAL);}
<YYINITIAL> ";" {return new Symbol(A3Symbol.SEMI);}
<YYINITIAL> "," {return new Symbol(A3Symbol.COMMA);}
<YYINITIAL> "(" {return new Symbol(A3Symbol.LPAREN);}
<YYINITIAL> ")" {return new Symbol(A3Symbol.RPAREN);}
<YYINITIAL> ":=" {return new Symbol(A3Symbol.ASSIGN);}
<YYINITIAL> "==" {return new Symbol(A3Symbol.EQUAL);}
<YYINITIAL> "!=" {return new Symbol(A3Symbol.NEQUAL);}
<YYINITIAL> "+" { return new Symbol(A3Symbol.PLUS);}
<YYINITIAL> "-" { return new Symbol(A3Symbol.MINUS);}
<YYINITIAL> "*" { return new Symbol(A3Symbol.TIMES);}
<YYINITIAL> "/" { return new Symbol(A3Symbol.DIVIDE);}
<YYINITIAL> [a-zA-Z][a-zA-Z0-9]* {return new Symbol(A3Symbol.ID, yytext());}
<YYINITIAL> [0-9]*(\.[0-9]*)? {return new Symbol(A3Symbol.NUM, yytext());}
[ \t\r\n\f] {}
. {System.exit(0);}