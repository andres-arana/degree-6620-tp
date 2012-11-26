OBJ = build/obj/wator.o

CC=gcc
CP=cp
CFLAGS=-I./source -Wall $(ACFLAGS)

build: prepare build/wator

build/wator: $(OBJ)
	gcc -o $@ $(OBJ) $(CFLAGS)

build/obj/wator.o: source/wator.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

prepare:
	-mkdir -p build
	-mkdir -p build/doc
	-mkdir -p build/obj
	-mkdir -p build/prof

clean:
	rm -rf build tags

prof: clean
	ACFLAGS="-O3 -pg" make
	./build/wator > /dev/null
	mv gmon.out build/prof/profile.raw
	gprof build/wator build/prof/profile.raw > build/prof/profile

doc: prepare
	pandoc README.md -o build/doc/README.pdf
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex

doc-preview: doc
	evince build/doc/informe.pdf

doc-spell:
	aspell -t check docs/informe.tex -d es

