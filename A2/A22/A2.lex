import java.io.*;


%%
%{
    static int identifiers=0;
    static int keywords=0;
    static int numbers=0;
    static int comments=0;
    static int quotedStrings=0;

    public static void main(String argv[]) throws java.io.IOException {
      A2 yy = new A2(new FileInputStream(new File("A2.input"))); 
      yy.yylex();
      FileWriter fw = new FileWriter(new File("A2.output"));
      fw.write("identifiers: "+new Integer(identifiers).toString()+"\n");
      fw.write("keywords: "+new Integer(keywords).toString()+"\n");
      fw.write("numbers: "+new Integer(numbers).toString()+"\n");
      fw.write("comments: "+new Integer(comments).toString()+"\n");
      fw.write("quotedStrings: "+new Integer(quotedStrings).toString()+"\n");
      fw.close();
    }
%}

%state commentState, quoteState
%class A2
%integer

%%

<YYINITIAL> "/**" {yybegin(commentState);} 
<commentState> "**/" {
    comments++; 
    yybegin(YYINITIAL); 
}

<YYINITIAL> "\"" {yybegin(quoteState);}
<quoteState> "\"" {
    quotedStrings++;
    yybegin(YYINITIAL);
}


<YYINITIAL>WRITE|READ|IF|ELSE|RETURN|BEGIN|END|MAIN|STRING|INT|REAL {keywords++;} 
<YYINITIAL>[a-zA-Z_][a-zA-Z0-9_]* {identifiers++;} 
<YYINITIAL>[0-9]+(\.[0-9]+)? {numbers++;} 

.|\n|\r {} 



