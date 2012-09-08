tp0: source/tp0.c
	@echo ' '
	@echo ' '
	@echo '**************************************************'
	@echo 'Building executable file'
	@echo '**************************************************'
	gcc source/tp0.c -o build/tp0
	@echo ' '
	@echo ' '

prepare:
	@echo ' '
	@echo ' '
	@echo '**************************************************'
	@echo 'Preparing directory structure'
	@echo '**************************************************'
	-mkdir -p build
	@echo ' '
	@echo ' '

build: prepare tp0

clean:
	@echo ' '
	@echo ' '
	@echo '**************************************************'
	@echo 'Cleaning up build'
	@echo '**************************************************'
	rm -rf build
	@echo ' '
	@echo ' '

virtual:
	@echo ' '
	@echo ' '
	@echo '**************************************************'
	@echo 'Starting up virtual machine'
	@echo '**************************************************'
	./gxemul/gxemul-6620-20070927/gxemul -e 3max -d ./gxemul/gxemul-6620-20070927/netbsd-pmax.img
	@echo ' '
	@echo ' '
