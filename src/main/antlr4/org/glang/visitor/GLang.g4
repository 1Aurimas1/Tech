grammar GLang;

program
 : statement+ EOF
 ;

statement
 : assignment
 | systemFunctionCall
 | ifInsteadStatement
 ;

assignment
 : IDENTIFIER '=' expression'.'
 ;

systemFunctionCall
 : PRINT '[' expression ']''.'                   #printFunctionCall
 ;

//paramList : IDENTIFIER (',' IDENTIFIER)* ;
//
//functionBody : '{' statement* '}' ; //TODO cannot return from the midle of function
//
//variableDeclaration
// : 'var' IDENTIFIER '=' expression
// ;

//assignment
// : PRINT '=' expression
// ;

//functionCall
// : IDENTIFIER '(' expressionList? ')'
// ;

//systemFunctionCall
// : PRINT '(' expression ')'                             #printFunctionCall
// ;

ifInsteadStatement : 'if' expression block ('instead' expression? block)*;

block : '[' statement* ']';
//'instead' '[' statement* ']' ;

//returnStatement : 'return' expression? ;

constant: INTEGER | DOUBLE | CHAR ;

//expressionList
// : expression (',' expression)*
// ;
//
//expression
// : constant                                             #constantExpression
// | IDENTIFIER                                           #identifierExpression
// | '(' expression ')'                                   #parenthesesExpression
// | '!' expression                                       #booleanUnaryOpExpression
// | expression ('||' | '&&') expression                  #booleanBinaryOpExpression
// | expression ('*' | '/' | '%') expression              #numericMultiOpExpression
// | expression ('+' | '-') expression                    #numericAddOpExpression
// | expression '..' expression                           #stringBinaryOpExpression
//// | functionCall                                         #functionCallExpression
//;

expression
 : constant                                             #constantExpression
 | IDENTIFIER                                           #identifierExpression
 | '(' expression ')'                                   #parenthesesExpression
 | booleanUnaryOp expression                            #booleanUnaryOpExpression
 | expression booleanBinaryOp expression                #booleanBinaryOpExpression
 | expression numericMultiOp expression                 #numericMultiOpExpression
 | expression numericAddOp expression                   #numericAddOpExpression
 | expression stringBinaryOp expression                 #stringBinaryOpExpression
// | functionCall                                         #functionCallExpression
;

booleanUnaryOp : '!' ;

booleanBinaryOp : '||' | '&&' ;

numericMultiOp : '*' | '/' | '%' ;

numericAddOp : '+' | '-' ;

stringBinaryOp : '__' ; //concat

PRINT : 'printOutput';

INTEGER : [-]?[0-9]+;
DOUBLE : ([-]?[0-9]+[,][0-9]+);   // paima -01111,5, nereikia 0 prieky
//DOUBLE : ([-] ([1-9][0-9]+ | [0]) [,] [0-9]+) | ([0-9]+[,][0-9]+);
CHAR : ['].['];
//CHAR : ['][\\]?.['] ;


// other
//INTEGER : [-][0-9]+ | [0-9]+;
//DOUBLE: [-][0-9]+ [,] [0-9]+ | [0-9]+ [,] [0-9]+;
//CHAR : ['].['];

IDENTIFIER : [a-zA-Z_][a-zA-Z_0-9]* ;

COMMENT : ( '//' ~[\r\n]* | '/*' .*? '*/' ) -> skip ;

WS : [ \t\f\r\n]+ -> skip ;