/* 
 * Template para programa flex.
 * Autora: Christina von Flach
 */

%option noyywrap nodefault yylineno

%{
#include "e1.tab.h"

extern int yyparse();

%}

%%

"//".*                { /* void */ }

const                 { return CONST; }
int                   { return INT; }
return                { return RETURN; }
void                  { return VOID; }

[0-9]+                { return NUM; }
[a-zA-Z][a-zA-Z0-9_]* { return ID; }  

"+"                   { return PLUS; }
"-"                   { return MINUS; }
"*"                   { return MULT; }
"/"                   { return DIV; }
"="                   { return EQUAL; }
";"                   { return SCOLON; }
"("                   { return OP; }
")"                   { return CP; }
"{"                   { return OC; }
"}"                   { return CC; }
[ \n\t\r]+            { /* void */ }

.                     { yyerror(yytext); } 

%%

/* Programa para simples conferência (ad-hoc) da saída yylex() */
//#define N 16

int main(int argc, char **argv) {
    //int token;
    // const int N = 14; // número de classes de tokens: olhar programa .y

    // nomes das classes de token (só serve para mostrar e ajudar a conferir) 
    // array token_name precisa ser ajustado ao incluir outros token codes
    
    //char *token_name[N] = {"CONST","INT","RETURN","VOID","NUM","ID","PLUS","MINUS","MULT","DIV","EQUAL","SCOLON","OP","CP","OC","CC"};

    //while ((token = yylex())) {
      //fprintf(stdout,"token code: %d", token);
      //fprintf(stdout,", token class: %s", token_name[token-258]);
      //fprintf(stdout,", lexeme: %s\n", yytext);
    //}

    if(yyparse()== 0) {
        printf("Sintaxe correta\n");
    } else {
        printf("Sintaxe incorreta\n");
    }
}
