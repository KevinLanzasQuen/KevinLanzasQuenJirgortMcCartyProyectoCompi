package ejerciciojflex;
import java_cup.runtime.Symbol;
%%
%class AnalizadorLexicoCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

boolean= "true" | "false"
tipo = "boolean" | "float"|"char"|"double"
Asig="="
Letra=[a-zA-Z]
nulo="null"
DigR=[1-9]
Dig=[0-9]
L=[a-zA-Z_]+
D=[0-9]+

comillaA='
comillaC='
comillas="\""
String= ({comillaA}({Letra}|{Dig}|{simb}|{operadores}|{ExprLogicas}|{comparadores}|{Separadores}|{ExprFinal}) ({Letra} | {Dig}| {simb}|{operadores}|{ExprLogicas}|{comparadores}|{Separadores}|{ExprFinal}|{Espacio} )*{comillaC}) 

operadores="*"|"+"|"-"|"/"
Separadores=")"|"("|"}"|"{"|"["|"]"|","|":"
simb = "?" |"$"|"~"|"@"|";"|":"|"%"|"$"|"%"
Espacio = " "|"	"
Id = {Letra}({Letra}|{Dig})*
ExprLogicas="|"|"&"|"!"
comparadores=">"|"<"|"=="|">="|"<="|"!="
ExprFinal="#"
sigN="-"
punto="."
flotante=({sigN} {Dig}*|({Dig} {Dig}*)) {punto}{Dig}+
Entero= {sigN} {Dig}* |({DigR} {Dig}*)
Comentario = "//" ({Id}{Espacio})*(\r|\n|\r\n)?
ComentarioMultilinea="/*" [^*] ~"*/" 
char= {comillaA} {Letra} {comillaC}
ParentesisAb="("
ParentesisCe=")"
Coma=","
Parametros= ({Id}|{Entero}|{char}|{flotante}|{String}|{boolean}) ((coma({Id}|{Entero}|{char}|{flotante}|{String}|{boolean}))*)?
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

("int") {return new Symbol(sym.Int, yychar, yyline, yytext());}

("string") {return new Symbol(sym.String, yychar, yyline, yytext());}

("if") {return new Symbol(sym.If, yychar, yyline, yytext());}

("else") {return new Symbol(sym.Else, yychar, yyline, yytext());}

("while") {return new Symbol(sym.While, yychar, yyline, yytext());}

("for") {return new Symbol(sym.For, yychar, yyline, yytext());}

("switch") {return new Symbol(sym.Switch, yychar, yyline, yytext());}

("return") {return new Symbol(sym.Return, yychar, yyline, yytext());}

("break") {return new Symbol(sym.Break, yychar, yyline, yytext());}

("case") {return new Symbol(sym.Case, yychar, yyline, yytext());}

("default") {return new Symbol(sym.Default, yychar, yyline, yytext());}

("print") {return new Symbol(sym.Print, yychar, yyline, yytext());}

("*") {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

("+") {return new Symbol(sym.Suma, yychar, yyline, yytext());}

("-") {return new Symbol(sym.Resta, yychar, yyline, yytext());}

("/") {return new Symbol(sym.Division, yychar, yyline, yytext());}

(")") {return new Symbol(sym.ParentesisC, yychar, yyline, yytext());}

("(") {return new Symbol(sym.ParentesisA, yychar, yyline, yytext());}

("}") {return new Symbol(sym.LlaveC, yychar, yyline, yytext());}

("{") {return new Symbol(sym.LlaveA, yychar, yyline, yytext());}

("[") {return new Symbol(sym.CorcheteA, yychar, yyline, yytext());}

("]") {return new Symbol(sym.CorcheteC, yychar, yyline, yytext());}

(",") {return new Symbol(sym.Coma, yychar, yyline, yytext());}

(":") {return new Symbol(sym.DosPuntos, yychar, yyline, yytext());}

("++"|"--") {return new Symbol(sym.DecInc, yychar, yyline, yytext());}

("main") {return new Symbol(sym.main, yychar, yyline, yytext());}
{Asig} {
 return new Symbol(sym.Asig, yychar, yyline, yytext());
}
{nulo} {
 return new Symbol(sym.Nulo, yychar, yyline, yytext());
}
{ExprFinal} {
 return new Symbol(sym.ExprFinal, yychar, yyline, yytext());
}

{Parametros} {
 return new Symbol(sym.Parametros, yychar, yyline, yytext());
}

{char}* {
    return new Symbol(sym.Char, yychar, yyline, yytext());
}

{ExprLogicas} {
 return new Symbol(sym.ExprLogica, yychar, yyline, yytext());
}

{comparadores} {
  return new Symbol(sym.Comparador, yychar, yyline, yytext());
}
{boolean}* {
 return new Symbol(sym.Boolean, yychar, yyline, yytext());
}

{flotante}* {
 return new Symbol(sym.Flotante, yychar, yyline, yytext());
}
{Entero}* {
 return new Symbol(sym.Entero, yychar, yyline, yytext());
}

{String}* {
 return new Symbol(sym.Cadena, yychar, yyline, yytext());
}
{comillas} {
 return new Symbol(sym.Comillas, yychar, yyline, yytext());
}
{Espacio} {
 /*Ignore*/
}

{L}({L}|{D})* {return new Symbol(sym.Id, yychar, yyline, yytext());}
{SaltoDeLinea} {
 /*Ignore*/
}

. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

