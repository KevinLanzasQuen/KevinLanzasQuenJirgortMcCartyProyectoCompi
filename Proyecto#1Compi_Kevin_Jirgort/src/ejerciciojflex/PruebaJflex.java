import java.io.BufferedReader;
import java.io.FileReader;

/**
 *
 * @author Andrey McCarty
 */
public class PruebaJflex {
 
  public static void main(String[] args) {
 
  try{
  String archivo = "codigo.txt";
  BufferedReader buffer = new BufferedReader(new FileReader(archivo));
  AnalizadorLexico analizadorJFlex = new AnalizadorLexico(buffer);
 
  while(true){
  TokenP token = analizadorJFlex.yylex();
 
  if (!analizadorJFlex.existenTokens())
   break;
 
  System.out.println(token.toString());
 }
 }
 catch (Exception e){
   System.out.println(e.toString());
 }
 }
}
