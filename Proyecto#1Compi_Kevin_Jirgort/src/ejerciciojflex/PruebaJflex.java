import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

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
  int identificadorChar = 1;
  int identificadorString = 1;
  int identificadorEntero = 1;
  int identificadorOperador = 1;
  int identificadorFlotante = 1;
  int identificadorId = 1;
  int identificadorBool = 1;
  int identificadorComp = 1;
  int identificadorExpL = 1;
  int identificadorExpF = 1;
  int identificadorSeparador = 1;
  int identificadorNulo= 1;
  int identificadorAsig= 1;
  int identificadorTipo= 1;
  int identificadorEstC= 1;
  while(true){
  TokenP token = analizadorJFlex.yylex();
 
  if (!analizadorJFlex.existenTokens())
   break;
  File archivoN=new File("tokens.txt");
  FileWriter escribir=new FileWriter(archivoN,true);
  if(token.arbola =="ENTERO"){
      escribir.write("["+token.arbola +", "+ String.valueOf(identificadorEntero)+"], "+token.lexemal);
      identificadorEntero=identificadorEntero+1;
  }else{
      if(token.arbola=="CHAR"){
           escribir.write("["+token.arbola +", "+ String.valueOf(identificadorChar)+"], "+token.lexemal);
           identificadorChar=identificadorChar+1;
          
      
      }else{
          if(token.arbola=="STRING"){
              escribir.write("["+token.arbola +", "+ String.valueOf(identificadorString)+"], "+token.lexemal);
              identificadorString=identificadorString+1;
          
          }else{
              if(token.arbola=="OPERADOR"){
                  escribir.write("["+token.arbola +", "+ String.valueOf(identificadorOperador)+"], "+token.lexemal);
                  identificadorOperador=identificadorOperador+1;
              
              }else{
                  if(token.arbola=="FLOTANTE"){
                    escribir.write("["+token.arbola +", "+String.valueOf(identificadorFlotante)+"], "+token.lexemal);
                    identificadorFlotante=identificadorFlotante+1;  
                  }else{
                      if(token.arbola=="IDENTIFICADOR"){
                          escribir.write("["+token.arbola +","+ String.valueOf(identificadorId)+"], "+token.lexemal);
                          identificadorId=identificadorId+1;
                      }else{
                          if(token.arbola=="BOOLEAN"){
                              escribir.write("["+token.arbola +","+ String.valueOf(identificadorBool)+"], "+token.lexemal);
                              identificadorBool=identificadorBool+1;
                            }else{
                              if(token.arbola=="COMPARADOR"){
                                  escribir.write("["+token.arbola +","+ String.valueOf(identificadorComp)+"], "+token.lexemal);
                                  identificadorComp=identificadorComp+1;
                              
                              }else{
                                  if(token.arbola=="EXPRESION_LOGICA"){
                                      escribir.write("["+token.arbola +","+ String.valueOf(identificadorExpL)+"], "+token.lexemal);
                                      identificadorExpL=identificadorExpL+1;
                                  }else{
                                      if(token.arbola=="FINAL_EXPRESION"){
                                          escribir.write("["+token.arbola +","+ String.valueOf(identificadorExpF)+"], "+token.lexemal);
                                          identificadorExpF=identificadorExpF+1;
                                          
                                      }else{
                                          if(token.arbola=="SEPARADOR"){
                                              escribir.write("["+token.arbola +","+ String.valueOf(identificadorSeparador)+"], "+token.lexemal);
                                              identificadorSeparador=identificadorSeparador+1;
                                          }else{
                                              if(token.arbola=="NULO"){
                                                  escribir.write("["+token.arbola +","+ String.valueOf(identificadorNulo)+"], "+token.lexemal);
                                                  identificadorNulo=identificadorNulo+1;
                                              }else{
                                                  if(token.arbola=="ASIGNACION"){
                                                      escribir.write("["+token.arbola +","+ String.valueOf(identificadorAsig)+"], "+token.lexemal);
                                                      identificadorAsig=identificadorAsig+1;
                                                  
                                                  }else{
                                                      if(token.arbola=="TIPO_DATO"){
                                                          escribir.write("["+token.arbola +","+ String.valueOf(identificadorTipo)+"], "+token.lexemal);
                                                          identificadorTipo=identificadorTipo+1;
                                                      }else{
                                                          if(token.arbola=="ESTRUCTURA_CONTROL"){
                                                              escribir.write("["+token.arbola +","+ String.valueOf(identificadorEstC)+"], "+token.lexemal);
                                                              identificadorEstC=identificadorEstC+1;
                                                          }
                                                      }
                                                  }
                                              }
                                          }
                                      }
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  }
      
  
  escribir.write("\r\n");
  escribir.close();
 
  
 }
 }
 catch (Exception e){
   System.out.println(e.toString());
 }
 }
}
