/* 
 * Template de programa bison para a linguagem E1.
 * Serve apenas para definir tokens associados ao analisador léxico implentado com flex.
 * Executar  'bison -d e1.y' para gerar arquivos e1.tab.c e e1.tab.h.
 */

%{
/* includes, C defs */

#include <stdio.h>

int yylex();
int yyparse();
extern int yylineno;
extern char * yytext;
void yyerror(const char * msg){
  fprintf(stderr, "Erro: %s, linha: %d, símbolo: %s\n", msg, yylineno, yytext);
}

%}

/* declare tokens */

%token CONST
%token INT
%token RETURN
%token VOID
%token NUM
%token ID
%token PLUS
%token MINUS
%token MULT
%token DIV
%token EQUAL
%token SCOLON
%token OP
%token CP
%token OC
%token CC


%%

program: declaration-list compound-stmt
       ;

declaration-list : declaration-list declaration 
                 | declaration
                 ;

declaration : var-declaration 
            | const-declaration
            ;

var-declaration : type-specifier ID SCOLON
                ; 

type-specifier : INT 
               | VOID
               ;

const-declaration : CONST type-specifier ID EQUAL NUM SCOLON
                  ;

compound-stmt : OC local-declarations statement-list CC
              ;    

local-declarations : local-declarations var-declaration 
                   |
                   ;

statement-list : statement-list statement 
               |
               ;

statement : expression-stmt 
          | return-stmt
          ;

expression-stmt : expression SCOLON 
                | SCOLON
                ;

return-stmt : RETURN SCOLON 
            | RETURN expression SCOLON
            ;

expression : ID EQUAL additive-expression
           ;

additive-expression : additive-expression addop term
                    | term
                    ;
addop : PLUS
      | MINUS
      ;

term : term mulop factor
     | factor
     ;

mulop : MULT
      | DIV
      ;

factor : OP additive-expression CP
       | ID
       | NUM
       ;

%%

//int main ()
//{
//    yyparse();
//}
