all :
	lex compiler.l
	gcc lex.yy.c -ll -o compiler

clean:
	find . -name "*~" -type f -delete
