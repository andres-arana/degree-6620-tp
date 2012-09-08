RAW_DEPS = clargs.h cltext.h
RAW_OBJ = clargs.o cltext.o tp0.o

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
