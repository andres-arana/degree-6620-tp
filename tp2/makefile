OBJ = build/obj/wator.o

CC=gcc
CP=cp
CFLAGS=-I./source -Wall $(ACFLAGS)
CACHE_SIZE=256
CACHE_LINE=64
CACHE_WSA=2

build: prepare build/wator

build/wator: $(OBJ)
	$(CC) -o $@ $(OBJ) $(CFLAGS)

build/obj/wator.o: source/wator.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

prepare:
	-mkdir -p build
	-mkdir -p build/doc
	-mkdir -p build/obj
	-mkdir -p build/prof
	-mkdir -p build/perf
	-mkdir -p build/cachegrind

clean:
	rm -rf build

prof: clean
	ACFLAGS="-O3 -pg" make
	./build/wator > /dev/null
	mv gmon.out build/prof/profile.raw
	gprof build/wator build/prof/profile.raw

time: clean
	ACFLAGS="-O3" make
	bash -c "for x in {1..500}; do time ./build/wator > /dev/null; done" 2> build/perf/time
	ruby perf/analyze.rb

cache: clean
	ACFLAGS="-O3" make
	valgrind --tool=cachegrind --D1=$(CACHE_SIZE),$(CACHE_WSA),$(CACHE_LINE) ./build/wator > /dev/null
	rm cachegrind.out.*

diff:
	git diff source/wator.c > opt/current

doc: prepare
	pandoc README.md -o build/doc/README.pdf
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex

doc-preview: doc
	evince build/doc/informe.pdf &

doc-spell:
	aspell -t check docs/informe.tex -d es
