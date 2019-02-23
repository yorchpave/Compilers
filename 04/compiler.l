%{
#include <stdio.h>
%}

%%
[/][/].*\n                  printf("COMMENT\n");
[a-eg-hj-oq-z]+             printf("id");
i                           printf("intdcl");
[0123456789]+               printf("inum");
f                           printf("floatdcl");
[0123456789]+"."[0-9]       printf("fnum");
p                           printf("print");
"+"                         printf("sum");
"-"                         printf("minus");
"*"                         printf("multiplication");
"/"                         printf("division");
"="                         printf("assign");


%%
int main(int argc, char **argv) {
    FILE    *f;

    if (argc == 2)
    {
        if (!(f = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyset_in(f);
        yylex();
        fclose(f);
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}
