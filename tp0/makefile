DEPS = \
       source/buffer.h \
       source/clargs.h \
       source/cltext.h \
       source/data.h \
       source/stooge.h \
       source/quicksort.h \
       source/config.h

OBJ = build/obj/buffer.o \
      build/obj/data.o \
      build/obj/clargs.o \
      build/obj/cltext.o \
      build/obj/tp0.o \
      build/obj/stooge.o \
      build/obj/quicksort.o


ASM = build/asm/buffer.s \
      build/asm/data.s \
      build/asm/clargs.s \
      build/asm/cltext.s \
      build/asm/tp0.s \
      build/asm/stooge.s \
      build/asm/quicksort.s

VIRTUAL = gxemul-6620-20070927

CC=gcc
CFLAGS=-I./source -Wall $(ACFLAGS)

build: prepare tp0

tp0: $(OBJ)
	gcc -o build/$@ $(OBJ) $(CFLAGS)

build/obj/buffer.o: source/buffer.c $(DEPS)
	$(CC) -c -o $@ source/buffer.c $(CFLAGS)

build/asm/buffer.s: source/buffer.c $(DEPS)
	$(CC) -S -o $@ source/buffer.c $(CFLAG)

build/obj/data.o: source/data.c $(DEPS)
	$(CC) -c -o $@ source/data.c $(CFLAGS)

build/asm/data.s: source/data.c $(DEPS)
	$(CC) -S -o $@ source/data.c $(CFLAG)

build/obj/clargs.o: source/clargs.c $(DEPS)
	$(CC) -c -o $@ source/clargs.c $(CFLAGS)

build/asm/clargs.s: source/clargs.c $(DEPS)
	$(CC) -S -o $@ source/clargs.c $(CFLAG)

build/obj/cltext.o: source/cltext.c $(DEPS)
	$(CC) -c -o $@ source/cltext.c $(CFLAGS)

build/asm/cltext.s: source/cltext.c $(DEPS)
	$(CC) -S -o $@ source/cltext.c $(CFLAG)

build/obj/tp0.o: source/tp0.c $(DEPS)
	$(CC) -c -o $@ source/tp0.c $(CFLAGS)

build/asm/tp0.s: source/tp0.c $(DEPS)
	$(CC) -S -o $@ source/tp0.c $(CFLAG)

build/obj/stooge.o: source/stooge.c $(DEPS)
	$(CC) -c -o $@ source/stooge.c $(CFLAGS)

build/asm/stooge.s: source/stooge.c $(DEPS)
	$(CC) -S -o $@ source/stooge.c $(CFLAG)

build/obj/quicksort.o: source/quicksort.c $(DEPS)
	$(CC) -c -o $@ source/quicksort.c $(CFLAGS)

build/asm/quicksort.s: source/quicksort.c $(DEPS)
	$(CC) -S -o $@ source/quicksort.c $(CFLAG)

prepare:
	-mkdir -p build
	-mkdir -p build/asm
	-mkdir -p build/doc
	-mkdir -p build/obj
	-mkdir -p build/perf
	-mkdir -p build/perf/raw
	-mkdir -p build/perf/analyzed
	-mkdir -p build/prof/raw
	-mkdir -p build/prof/analyzed

clean:
	rm -rf build tags

virtual-start:
	sudo ifconfig lo:0 172.20.0.1
	if [ ! -d ./gxemul/$(VIRTUAL) ]; then bzip2 -dc ./gxemul/$(VIRTUAL).tar.bz2 | cpio --sparse -i -v; mv $(VIRTUAL) ./gxemul/ ; fi
	echo "mkdir -p tp && ssh -R 2222:127.0.0.1:22 $(USER)@172.20.0.1" | xclip -sel clip
	./gxemul/$(VIRTUAL)/gxemul -e 3max -d ./gxemul/$(VIRTUAL)/netbsd-pmax.img

virtual-reset:
	rm -rf ./gxemul/$(VIRTUAL)

virtual-deploy-all:
	scp -P 2222 -r makefile source test perf prof root@127.0.0.1:/root/tp

virtual-deploy-source:
	scp -P 2222 -r makefile source root@127.0.0.1:/root/tp

virtual-connect:
	ssh -p 2222 root@127.0.0.1

perf-data: build
	bash -c 'echo ""; for x in perf/data/*; do echo "****************************"; echo "On $$x"; time ./build/tp0 -s $$x > /dev/null; done' > build/perf/raw/stooge 2>&1
	bash -c 'echo ""; for x in perf/data/*; do echo "****************************"; echo "On $$x"; time ./build/tp0 -q $$x > /dev/null; done' > build/perf/raw/quicks 2>&1

perf-analyze:
	ruby perf/analyze.rb

prof: clean
	ACFLAGS="-O0 -pg" make
	./build/tp0 -q prof/data/input > /dev/null
	mv gmon.out build/prof/raw/quicks.out
	gprof build/tp0 build/prof/raw/quicks.out > build/prof/analyzed/quicks

asm: prepare $(ASM)

doc: prepare
	pandoc README.md -o build/doc/README.pdf
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex

doc-preview: doc
	evince build/doc/informe.pdf

testdata:
	for x in test/case_*; do ./$$x; RESULT=$$?; if [ $$RESULT -ne 0 ]; then echo; echo; echo "***********************************"; echo "[TEST] -----> BUILD NOT SUCCESSFULL "; echo "***********************************"; break; fi; done
