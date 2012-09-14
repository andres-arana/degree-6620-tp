RAW_DEPS = buffer.h clargs.h cltext.h data.h stooge.h quicksort.h config.h
RAW_OBJ = buffer.o data.o clargs.o cltext.o tp0.o stooge.o quicksort.o tp0.o

CC=gcc
CFLAGS=-I./source -Wall
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

virtual:
	./gxemul/gxemul-6620-20070927/gxemul -e 3max -d ./gxemul/gxemul-6620-20070927/netbsd-pmax.img
