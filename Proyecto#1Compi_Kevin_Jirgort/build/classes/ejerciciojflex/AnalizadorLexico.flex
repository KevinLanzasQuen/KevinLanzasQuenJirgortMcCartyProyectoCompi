%%
%public
%class AnalizadorLexico
%line
%char
%column
%{
 
 

 private boolean _existenTokens = false;
 
 public boolean existenTokens(){
 return this._existenTokens;
 }
 
%}
 

%type TokenP
 
%init{
%init}
 
%eof{
 
 this._existenTokens = false;
 
%eof}
 
/* Inicio de Expresiones regulares */

letra=[A-Z a-z]
digR=[1-9]
dig=[0-9]
id= {letra} ({letra}|{digR})*
simb = "#" | "?" |"!"|"$"|"~"|"@"|";"|":"
operadores="*"|"+"|"-"|"/"
cero=0
sigN="-"
punto="."
flotante=({sigN} {dig}*|({dig} {dig}*)) {punto}{dig}+
entero= {sigN} {dig}* |({digR} {dig}*)



comillaA='
comillaC='
char= {comillaA} {letra} {comillaC}

string= {comillaA}({letra}|{simb}) ({letra} | {dig}| {simb} )*{comillaC} 
boolean= "True"| "False"
 

 Espacio = " "
 SaltoDeLinea = \n|\r|\r\n
 
/* Fin de expresiones regulares */
 
%%
 
/* Reglas */
 



{flotante} {
 TokenP t = new TokenP(yytext(),yytext(), "FLOTANTE");
 this._existenTokens = true;
 return t;
}
{entero} {
 TokenP t = new TokenP(yytext(),yytext(), "ENTERO");
 this._existenTokens = true;
 return t;
}
{id} {
 TokenP t = new TokenP(yytext(),yytext(), "IDENTIFICADOR");
 this._existenTokens = true;
 return t;
}
{char} {
 TokenP t = new TokenP(yytext(),yytext(), "CHAR");
 this._existenTokens = true;
 return t;
}
{string} {
 TokenP t = new TokenP(yytext(),yytext(), "String");
 this._existenTokens = true;
 return t;
}

{operadores} {
 TokenP t = new TokenP(yytext(),yytext(), "OPERADOR");
 this._existenTokens = true;
 return t;
}

{Espacio} {
 // Ignorar cuando se ingrese un espacio
}
 
{SaltoDeLinea} {
 TokenP t = new TokenP("Enter","Enter", "NUEVA_LINEA");
 this._existenTokens = true;
 return t;
}
<YYINITIAL> . {
String errLex = "Error lexico, caracter irreconocible: '"+yytext()+"' en la linea: "+(yyline+1)+" y columna: "+(yycolumn+1) ;
System.err.println(errLex);
}