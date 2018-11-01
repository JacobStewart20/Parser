# Parser
recursive descent parser for compiler of generated programming language from a rules.l (lexical analyzer file)

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
