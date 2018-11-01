/*****************************************************************************
 // CSE 4713 / 6713 Assignment 2 example flex file
 // Jacob Stewart, jrs1173
 // 10/5/18
 *****************************************************************************/
%option noyywrap
%{
    #include "lexer.h"
    int yyLine = 1;
    %}

%%

if { return TOK_IF; }
else { return TOK_ELSE; }
for { return TOK_FOR; }
while { return TOK_WHILE; }
print { return TOK_PRINT; }
return { return TOK_RETURN; }
continue { return TOK_CONTINUE; }
break { return TOK_BREAK; }
debug { return TOK_DEBUG; }
read { return TOK_READ; }
let { return TOK_LET; }
int { return TOK_INT; }
float { return TOK_FLOAT; }
string { return TOL_STRING; }

[+] { return TOK_PLUS; }
[-] { return TOK_MINUS; }
[*] { return TOK_MULTIPLY; }
[/] { return TOK_DIVIDE; }
[:][=] { return TOK_ASSIGN; }
[=][=] { return TOK_EQUALTO; }
[<] { return TOK_LESSTHAN; }
[>] { return TOK_GREATERTHAN; }
[<][>] { return TOK_NOTEQUALTO; }
and { return TOK_AND; }
or { return TOK_OR; }
not { return TOK_NOT; }
length { return TOK_LENGTH; }

[;] { return TOK_SEMICOLON; }
[(] { return TOK_OPENPAREN; }
[)] { return TOK_CLOSEPAREN; }
[[] { return TOK_OPENBRACKET; }
[]] { return TOK_CLOSEBRACKET; }
[{] { return TOK_OPENBRACE; }
    [}] { return TOK_CLOSEBRACE; }
[,] { return TOK_COMMA;}

[a-zA-Z][_a-zA-Z0-9]{0,99} { return TOK_IDENTIFIER; } //regex for indentifier

(\"[^\"\\]*(?:\\.[^\"\\]*)*\") { return TOK_STRINGLIT; } // regex for string literal

(\"[^\"\\]*) { return TOK_UT_SL; } // regex for unterminated string

[0-9]+\.?[0-9]* { return TOK_FLOATIT; } // regex for floats

(\r\n|\r|\n|\t) // new line eater

[ ] // white space eater

[#|@|^|%|$|!|`|~|=|&|'|:|_|.] { return TOK_UNKNOWN; } // all unknown tokens


<<EOF>> { return TOK_EOF; }
[\n] { yyLine++; }
