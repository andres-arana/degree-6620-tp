DEPS = \
       source/buffer.h \
       source/clargs.h \
       source/cltext.h \
       source/data.h \
       source/stooge.h \
       source/config.h

OBJ = build/obj/buffer.o \
      build/obj/stoogeasm.o \
      build/obj/data.o \
      build/obj/clargs.o \
      build/obj/cltext.o \
      build/obj/tp1.o \
      build/obj/stoogec.o

VIRTUAL = gxemul-6620-20070927

CC=gcc
CP=cp
CFLAGS=-I./source -Wall $(ACFLAGS)

build: prepare tp1

tp1: $(OBJ)
	gcc -o build/$@ $(OBJ) $(CFLAGS)

build/obj/buffer.o: source/buffer.c $(DEPS)
	$(CC) -c -o $@ source/buffer.c $(CFLAGS)

build/obj/data.o: source/data.c $(DEPS)
	$(CC) -c -o $@ source/data.c $(CFLAGS)

build/obj/clargs.o: source/clargs.c $(DEPS)
	$(CC) -c -o $@ source/clargs.c $(CFLAGS)

build/obj/cltext.o: source/cltext.c $(DEPS)
	$(CC) -c -o $@ source/cltext.c $(CFLAGS)

build/obj/tp1.o: source/tp1.c $(DEPS)
	$(CC) -c -o $@ source/tp1.c $(CFLAGS)

build/obj/stoogec.o: source/stooge.c $(DEPS)
	$(CC) -c -o $@ source/stooge.c $(CFLAGS)

build/obj/stoogeasm.o: source/stooge.S $(DEPS)
	$(CC) -c -o $@ source/stooge.S $(CFLAGS)

prepare:
	-mkdir -p build
	-mkdir -p build/doc
	-mkdir -p build/obj

clean:
	rm -rf build tags

virtual-start:
	sudo ifconfig lo:0 172.20.0.1
	if [ ! -d ./gxemul/$(VIRTUAL) ]; then bzip2 -dc ./gxemul/$(VIRTUAL).tar.bz2 | cpio --sparse -i -v; mv $(VIRTUAL) ./gxemul/ ; fi
	echo "ssh -f -N -R 2222:127.0.0.1:22 $(USER)@172.20.0.1" | xclip -sel clip
	./gxemul/$(VIRTUAL)/gxemul -e 3max -d ./gxemul/$(VIRTUAL)/netbsd-pmax.img

virtual-reset:
	rm -rf ./gxemul/$(VIRTUAL)

virtual-authkey:
	cat ~/.ssh/id_rsa.pub | ssh -p 2222 root@127.0.0.1 "rm -rf .ssh/authorized_keys; mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys"

virtual-deploy:
	ssh -p 2222 root@127.0.0.1 "rm -rf ~/deploy; mkdir -p ~/deploy;"
	scp -P 2222 -r makefile source data root@127.0.0.1:/root/deploy

doc: prepare
	pandoc README.md -o build/doc/README.pdf
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex
	pdflatex --output-directory build/doc docs/informe.tex

doc-preview: doc
	evince build/doc/informe.pdf

doc-spell:
	aspell -t check docs/informe.tex -d es

test-run: tp1
	SUCCESS=1; for x in $$(ls test/case_* | sort -k2 -t_ -n); do ./$$x; RESULT=$$?; if [ $$RESULT -ne 0 ]; then SUCCESS=0; echo; echo; echo "***********************************"; echo "[TEST $$x] -----> BUILD NOT SUCCESSFULL "; echo "***********************************"; break; fi; done; if [ $$SUCCESS -eq 1 ]; then echo; echo; echo "*******************************"; echo "[TEST] -----> BUILD SUCCESSFULL "; echo "*******************************"; fi
