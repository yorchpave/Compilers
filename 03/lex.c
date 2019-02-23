#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdlib.h>


int main(int argc, char *argv[]) {
       char * my_file = argv[1];
       FILE *file = fopen(my_file,"r"); // open example.ac

       char c;
       bool isFloat;

       while((c = fgetc(file)) != EOF){

               isFloat = false;


               if(c == '\n'){  // if EOF then println
                       printf("\n");
                       continue;
               }

               if(c == ' '){ // ignore space
                       continue;
               }

               // check if digit is float or int
               if(isdigit(c)){
                        while(c != ' ' && c != '\n'){ // there is no space
                               if(c == '.'){ // if decimal point
                                       isFloat = true; // then it is a fnum
                               }
                               c = fgetc(file);
                        }
                       if(isFloat){
                               printf("fnum "); // float number
                       } else {
                               printf("inum "); // integer number
                       }

                       if(c == '\n'){ // if EOF then go to next line
                               printf("\n");
                       }
                       continue;
               }

               // check for "keywords" (f, i, p) and identifiers (=, +, -, *, /, digit)
               switch(c){
                       case 'f':
                               printf("floatdcl ");
                               break;
                       case 'i':
                               printf("intdcl ");
                               break;
                       case 'p':
                               printf("print ");
                               break;
                       case '=':
                               printf("assign ");
                               break;
                       case '+':
                               printf("plus ");
                               break;
                       case '-':
                               printf("minus ");
                               break;
                       case '*':
                               printf("multiplication ");
                               break;
                       case '/':
                               if((c = fgetc(file)) == '/'){
                                        char n = fgetc(file);
                                        while(n != '\n'){
                                                n = fgetc(file);
                                        }
                                        break;
                                } else {
                                       ungetc(c, file);
                                       printf("division ");
                                       break;
                               }
                       default: // ints and floats
                               printf("id ");
                               break;
               }
       }

       fclose(file);
       return 0;
}
