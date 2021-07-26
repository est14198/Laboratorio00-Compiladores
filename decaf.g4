grammar decaf;

WHITE  : (' ' | '\n' | '\r' | '\t') -> skip ;
ID     : (('a'..'z') | ('A'..'Z')) ((('a'..'z') | ('A'..'Z')) | ('0'..'9'))* ;
NUM    : ('0'..'9') ('0'..'9')* ;
CHAR   : ('a'..'z') | ('A'..'Z') ;

program           : 'class' 'Program' '{' (declaration)* '}' ;
declaration       : structDeclaration 
                    | varDeclaration 
                    | methodDeclaration ;
structDeclaration :  'struct' ID '{' (varDeclaration)* '}' ;
varDeclaration    : varType ID ';' 
                    | varType ID '[' NUM ']' ';' ;
varType           : 'int' 
                    | 'char' 
                    | 'boolean' 
                    | 'struct' ID 
                    | structDeclaration 
                    | 'void' ;
methodDeclaration : methodType ID '(' (parameter (',' parameter)*)? ')' block ;
methodType        : 'int' 
                    | 'char' 
                    | 'boolean' 
                    | 'void' ;
parameter         : parameterType ID 
                    | parameterType ID '[' ']' ;
parameterType     : 'int' 
                    | 'char' 
                    | 'boolean' ;
block             : '{' (varDeclaration)* (statement)* '}' ;
statement         : 'if' '(' expression ')' block ('else' block)? 
                    | 'while' '(' expression ')' block 
                    | 'return' (expression)? ';' 
                    | methodCall ';' 
                    | block 
                    | location '=' expression 
                    | (expression)? ';' ;
location          : (ID | ID '[' expression ']') ('.' location )? ;
expression        : location 
                    | methodCall 
                    | literal 
                    | expression op expression 
                    | '-' expression 
                    | '!' expression 
                    | '(' expression ')' ;
methodCall        : ID '(' (arg (',' arg)*)? ')' ;
arg               : expression ;
op                : arith_op 
                    | rel_op 
                    | eq_op 
                    | cond_op ;
arith_op          : '+' 
                    | '-' 
                    | '*' 
                    | '/' 
                    | '%' ;
rel_op            : '<' 
                    | '>' 
                    | '<=' 
                    | '>=' ;
eq_op             : '==' 
                    | '!=' ;
cond_op           : '&&' 
                    | '||' ;
literal           : int_literal 
                    | char_literal 
                    | bool_literal ;
int_literal       : NUM ;
char_literal      : '\'' CHAR '\'' ;
bool_literal      : 'true' 
                    | 'false' ;