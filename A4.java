import java.lang.*;
import java.io.*;
public class A4 {
static BufferedReader _br;
public static void main(String args[]) throws Exception{
int X;
X=5;
{
double Z;
_br = new BufferedReader(new FileReader("A51.INPUT"));
Z = new Integer(_br.readLine()).intValue();
FileWriter fileWriter = new FileWriter("XKOUTPUT");
PrintWriter printWriter = new PrintWriter(fileWriter);
printWriter.print(X*3.25+Z);
printWriter.close();
}
}
}