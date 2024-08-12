build: obj/main.o obj/hex.o
	gcc obj/hex.o obj/main.o -lgmp -o bin/hex

obj/main.o: src/main.c
	gcc -c src/main.c -o obj/main.o

obj/hex.o: src/hex.c
	gcc -c src/hex.c -o obj/hex.o

check: build
	bin/hex 1
	bin/hex 2
	bin/hex 3
	bin/hex 4
	bin/hex 5
	bin/hex 6
	bin/hex 7
	bin/hex 8
	bin/hex 9
	bin/hex 10
	bin/hex 11
	bin/hex 12
	bin/hex 20
	bin/hex 200

run: build
	bin/hex 100
	
clean:
	rm -rf obj/*.o
	rm bin/hex

