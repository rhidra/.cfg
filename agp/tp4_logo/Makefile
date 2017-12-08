FLAGS = -g -Wall -DDEBUG

all: exec

# Structure de données

logo.o: logo.c logo.h
	gcc ${FLAGS} -c $< -o $@

test.o:	test.c logo.h
	gcc ${FLAGS} -c $< -o $@

# Parseur

logo_parser.tab.c: logo_parser.y logo.h
	bison -d $<

logo_parser.tab.o: logo_parser.tab.c
	gcc ${FLAGS} -c $< -o $@

logo_parser2.tab.o: logo_parser2.tab.c
	gcc ${FLAGS} -c $< -o $@

lex.yy.c: logo_parser.l logo.h
	flex $<

lex.yy.o: lex.yy.c
	gcc ${FLAGS} -c $< -o $@

# SVG

logo_svg.o: logo_svg.c logo_svg.h
	gcc ${FLAGS} -c $< -o $@

# Cibles principales

test: logo_parser.tab.o lex.yy.o test.o logo_svg.o logo.o
	gcc ${FLAGS} $^ -o $@ -lm

exec: test
	./test < example.logo > tmp.svg
	display tmp.svg
	rm tmp.svg
	make clean

clean:
	rm -rf *.o *~
	rm -rf *.tab.* lex.yy.* test test_parser test_lexer
