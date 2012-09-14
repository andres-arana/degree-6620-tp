RAW_DEPS = buffer.h clargs.h cltext.h data.h stooge.h config.h
RAW_OBJ = buffer.o data.o clargs.o cltext.o tp0.o stooge.o tp0.o

CC=gcc
CFLAGS=-I./source
OBJ = $(patsubst %,build/%,$(RAW_OBJ))
DEPS = $(patsubst %,source/%,$(RAW_DEPS))

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
