# Laboratorio 00

### Construcción de compiladores - Sección 10
### María Fernanda Estrada 14198

#### Para generar scanner y parser
antlr4 decaf.g4
javac decaf*.java

#### Para leer archivo de prueba y generar árbol sintáctico
grun decaf program test.txt -tokens -gui

#### ---------------------------------
La gramática de Decaf se encuentra en el archivo decaf.g4
El programa de prueba escrito en lenguaje Decaf se encuentra en test.txt