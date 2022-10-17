
# GETTING STARTED 

## RUST
Starlane is written in Rust.  Follow these instructions to [install Rust](https://www.rust-lang.org/tools/install)


## NIGHTLY
In order to compile Wasm you may need the nightly toolchain:

From a terminal run:

```bash
rustup toolchain install nightly
```

## WASM TARGET
To compile WebAssembly(Wasm)  mechtrons you will need to have the target `wasm32-unknown-unknown` installed:

```bash
rustup target add wasm32-unknown-unknown --toolchain nightly
```

## INSTALL STARLANE 
Install starlane:
```bash
cargo install starlane
```

## INSTALL cosmic-cli
Starlane has a command line interface called `cosmic-cli`   You can install it:
```bash
cargo install cosmic-cli
```

>NOTE: Although we are installing `cosmic-cli` it will create an executable binary simply called `cosmic`

## RUN STARLANE
To run an instance of Starlane:

```bash
starlane
```

## TEST INSTANCE
Finally lets see if the Starlane instance is useable.  From the command line execute the following:

```bash
cosmic "create my-base<Base>"
```

You should see an `Ok` which means you are ready!

>NOTE: This version of Starlane you have installed runs an in-memory instance with no persistence--therefore every time you restart this server ALL data will be lost.  This is actually quite useful when you are just learning how to use starlane.  A tutorial describing how to create Starlane using persistent storage will be posted some time in the very near future.


## CARGO GENERATE

The tutorial let's you generate new Mechtron projects from a template.  You will need to have `cargo-generate` installed to do so:

```bash
cargo install cargo-generate
```


## NEXT

You are now ready to [Start the Tutorial]({{< ref "/docs/tutorial" >}} "Tutorial").
