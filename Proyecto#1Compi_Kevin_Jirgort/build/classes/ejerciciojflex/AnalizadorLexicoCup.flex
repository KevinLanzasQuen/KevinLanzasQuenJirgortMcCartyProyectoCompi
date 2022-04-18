package ejerciciojflex;
import java_cup.runtime.Symbol;
%%
%class AnalizadorLexicoCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char


boolean= "true"| "false"
tipo = "int"| "string" | "boolean" | "float"|"char"|"double"
estruControl="if"|"else"|"switch"|"return"|"break"|"case"|"while"|"default"|"print"|"for"
Asig="="
letra=[A-Za-z]
nulo="null"
digR=[1-9]
dig=[0-9]
comillaA='
comillaC='
string= {comillaA}({letra}|{dig}|{simb}|{operadores}|{ExprLogicas}|{comparadores}|{Separadores}|{ExprFinal}) ({letra} | {dig}| {simb}|{operadores}|{ExprLogicas}|{comparadores}|{Separadores}|{ExprFinal}|{Espacio} )*{comillaC} 
simb = "?" |"$"|"~"|"@"|";"|":"|"%"|"$"|"%"

Espacio = " "|"	"
id= {letra}({letra}|{digR})*

operadores="*"|"+"|"-"|"/"
ExprLogicas="|"|"&"|"!"
comparadores=">"|"<"|"=="|">="|"<="|"!="
ExprFinal="#"
Separadores=")"|"("|"}"|"{"|"["|"]"|","|":"
sigN="-"

punto="."
flotante=({sigN} {dig}*|({dig} {dig}*)) {punto}{dig}+
entero= {sigN} {dig}* |({digR} {dig}*)

Comentario = "//" ({id}{Espacio})*(\r|\n|\r\n)?

ComentarioMultilinea="/*" [^*] ~"*/" 



char= {comillaA} {letra} {comillaC}



 


 SaltoDeLinea = \n|\r|\r\n



%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
{Espacio} {
 /*Ignore*/
}

{Comentario} {
 /*Ignore*/
}
{ComentarioMultilinea} {
 /*Ignore*/
}

{tipo} {return new Symbol(sym.Tipo, yychar, yyline, yytext());}



{estruControl} {
  return new Symbol(sym.EstruControl, yychar, yyline, yytext());
}
{Asig} {
 return new Symbol(sym.Asig, yychar, yyline, yytext());
}
{nulo} {
 return new Symbol(sym.Nulo, yychar, yyline, yytext());
}
{ExprFinal} {
 return new Symbol(sym.ExprFinal, yychar, yyline, yytext());
}

{char} {
    return new Symbol(sym.Char, yychar, yyline, yytext());
}

{Separadores} {
 return new Symbol(sym.Separador, yychar, yyline, yytext());
}

{ExprLogicas} {
 return new Symbol(sym.ExprLogica, yychar, yyline, yytext());
}

{comparadores} {
  return new Symbol(sym.Comparador, yychar, yyline, yytext());
}
{boolean} {
 return new Symbol(sym.Boolean, yychar, yyline, yytext());
}

{flotante} {
 return new Symbol(sym.Flotante, yychar, yyline, yytext());
}
{entero} {
 return new Symbol(sym.Entero, yychar, yyline, yytext());
}

{string} {
 return new Symbol(sym.String, yychar, yyline, yytext());
}
{Espacio} {
 /*Ignore*/
}
{id} {
 return new Symbol(sym.Id, yychar, yyline, yytext());
}




{operadores} {
 return new Symbol(sym.Operador, yychar, yyline, yytext());
}


 
{SaltoDeLinea} {
 /*Ignore*/
}

. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

