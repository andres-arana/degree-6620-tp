RAW_DEPS = buffer.h clargs.h cltext.h data.h stooge.h quicksort.h config.h
RAW_OBJ = buffer.o data.o clargs.o cltext.o tp0.o stooge.o quicksort.o tp0.o

VIRTUAL = gxemul-6620-20070927

CC=gcc
CFLAGS=-I./source -Wall -O0
OBJ = $(patsubst %,build/%,$(RAW_OBJ))
DEPS = $(patsubst %,source/%,$(RAW_DEPS))

ifdef LOG_DEBUG_SORT
  CFLAGS+= -DLOG_LEVEL_DEBUG_SORT
endif

ifdef LOG_DEBUG_DATA
  CFLAGS+= -DLOG_LEVEL_DEBUG_DATA
endif

ifdef LOG_WARNING
  CFLAGS+= -DLOG_LEVEL_WARNING
endif

build: prepare tp0

tp0: $(OBJ)
	gcc -o build/$@ $^ $(CFLAGS)

build/%.o: source/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

prepare:
	-mkdir -p build

clean:
	rm -rf build

virtual-start:
	sudo ifconfig lo:0 172.20.0.1
	if [ ! -d ./gxemul/$(VIRTUAL) ]; then bzip2 -dc ./gxemul/$(VIRTUAL).tar.bz2 | cpio --sparse -i -v; mv $(VIRTUAL) ./gxemul/ ; fi
	echo "ssh -R 2222:127.0.0.1:22 $(USER)@172.20.0.1" | xclip -sel clip
	./gxemul/$(VIRTUAL)/gxemul -e 3max -d ./gxemul/$(VIRTUAL)/netbsd-pmax.img

virtual-reset:
	rm -rf ./gxemul/$(VIRTUAL)
