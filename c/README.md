## C

This implements the hexonacci sequence in C.

## Dependencies

The C implementation depends on [the GMP Big Number library](https://gmplib.org/).
It must be installed in your system.

```sh
sudo nala install -y libgmp10 libgmp10-dev libgmp10-doc
```

## Running

Build and run using the provided makefile:

```sh
make build     # just builds the thing
hex/bin <num>  # run the executable after building


make run       # builds and runs with a predetermined input

make check     # builds and runs with a bunch of inputs
```
