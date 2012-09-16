DEPS = \
       source/buffer.h \
       source/clargs.h \
       source/cltext.h \
       source/data.h \
       source/stooge.h \
       source/quicksort.h \
       source/config.h

OBJ = build/buffer.o \
      build/data.o \
      build/clargs.o \
      build/cltext.o \
      build/tp0.o \
      build/stooge.o \
      build/quicksort.o

VIRTUAL = gxemul-6620-20070927

CC=gcc
CFLAGS=-I./source -Wall -O0 $(ACFLAGS)

build: prepare tp0

tp0: $(OBJ)
	gcc -o build/$@ $(OBJ) $(CFLAGS)

build/buffer.o: source/buffer.c $(DEPS)
	$(CC) -c -o $@ source/buffer.c $(CFLAGS)

build/data.o: source/data.c $(DEPS)
	$(CC) -c -o $@ source/data.c $(CFLAGS)

build/clargs.o: source/clargs.c $(DEPS)
	$(CC) -c -o $@ source/clargs.c $(CFLAGS)

build/cltext.o: source/cltext.c $(DEPS)
	$(CC) -c -o $@ source/cltext.c $(CFLAGS)

build/tp0.o: source/tp0.c $(DEPS)
	$(CC) -c -o $@ source/tp0.c $(CFLAGS)

build/stooge.o: source/stooge.c $(DEPS)
	$(CC) -c -o $@ source/stooge.c $(CFLAGS)

build/quicksort.o: source/quicksort.c $(DEPS)
	$(CC) -c -o $@ source/quicksort.c $(CFLAGS)

prepare:
	-mkdir -p build

clean:
	rm -rf build tags

virtual-start:
	sudo ifconfig lo:0 172.20.0.1
	if [ ! -d ./gxemul/$(VIRTUAL) ]; then bzip2 -dc ./gxemul/$(VIRTUAL).tar.bz2 | cpio --sparse -i -v; mv $(VIRTUAL) ./gxemul/ ; fi
	echo "ssh -R 2222:127.0.0.1:22 $(USER)@172.20.0.1" | xclip -sel clip
	./gxemul/$(VIRTUAL)/gxemul -e 3max -d ./gxemul/$(VIRTUAL)/netbsd-pmax.img

virtual-reset:
	rm -rf ./gxemul/$(VIRTUAL)

virtual-copy:
	scp -P 2222 -r Makefile source test time root@127.0.0.1:/root

virtual-connect:
	ssh -p 2222 root@127.0.0.1
