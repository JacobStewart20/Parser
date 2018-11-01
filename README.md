# Parser
recursive descent parser for compiler of generated programming language from a rules.l (lexical analyzer file)

if not using an IDE to run parser: use makefile, lexer.h, rules.l, and parser.cpp to generate lex.yy.c and lex.yy.o. inside of directory, type `make` into terminal to have everything set up and run ./parse.exe to run parser according to grammar rules.

.bc files are test files to use. example terminal input: cat program1.bc | ./parse > program1.out 

## ---GRAMMAR RULES FOR PARSER---

### Grammar Productions:            
- P →{ {S} } 
- S → A | G | O | C | W             
- A → let ID := E ;                 
- E → B {( and | or ) B }           
- B → R [( < | > | == ) R ]          
- R → T {( + | - ) T }               
- T → F {( * | / ) F }               
- F → [ not | - ] U                  
- U → ID | FLOATLIT | (E)            
- G → read [ STRINGLIT ] ID;         
- O → print [ STRINGLIT ] [ ID ];    
- C → if (E) P [ else P ]            
- W → while (E) P 

###  First Token Set:
- P: { { }
- S: { let, read, print, if, while }
- A: { let }
- E: { not, -, (, ID, FLOATLIT }
- B: { not, -, (, ID, FLOATLIT }
- R: { not, -, (, ID, FLOATLIT }
- T: { not, -, (, ID, FLOATLIT }
- F: { not, -, (, ID, FLOATLIT }
- U: { (, ID, FLOATLIT }
- G: { read }
- O: { print }
- C: { if }
- W: { while }
