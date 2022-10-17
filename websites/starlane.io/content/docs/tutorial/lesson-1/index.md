---
title: "Lesson 1"
date: 2022-02-12T21:29:31-06:00
draft: false
---


# LESSON 1 -- HELLO MECHTRON

>NOTE: you need to have Starlane and rust toolchain installed on your machine before you can follow this tutorial.  You can do this quickly using the [getting started guide]({{< ref "/docs/getting-started" >}} "Lesson 2").


## GENERATE MECHTRON PROJECT
It's time to say `Hello, World!"  let's start by auto generating a mechtron project. From the comman line run:

```bash
cargo generate --git https://github.com/mechtronium/mechtron-skel.git --name hello
```

## ANATOMY OF A MECHTRON PROJECT
If you look around the project you will notice two important directories: `bundle` & `src`.

### BUNDLE
the bundle directory contains important configuraiton files needed to deploy our Mechtron.  It also
will contain the `wasm` executable binary after we have built it.

### SRC
The `src` dir is a common to a Rust project and it contains the code that drives the Mechtron

### lib.rs
Let's take a look at `src/lib.rs`

First, let's look at the part we are most interested in the `handler` impl:

```rust
#[handler_sync]
impl<P> MyMechtron<P>
where
    P: Platform + 'static,
{
    #[route("Http<Get>")]
    pub fn hello(&self, _: InCtx<'_, ()>) -> Result<Substance, P::Err> {
        Ok(Substance::Text("Hello, World!".to_string()))
    }
}
```

As you can see the default generated code accepts any `Http` wave with a `Get` method and returns the plain text `Hello, World!"

Here's a more details breakdown of what you are looking at:

```rust
/// This attribute will generate a Handler router which will select and forward a matching
/// wave to the appropriate method
#[handler_sync]
impl<P> MyMechtron<P>
where
    P: Platform + 'static, /// don't be intimidated by this Platform generic... we will dive deeper into that later
{
    /// the `route` attribute will be selected if the incomming directed wave is of kind `Http`
    /// AND if the http method is `Get` ... path in this case is not specified so it will match
    /// with ANY path
    #[route("Http<Get>")]  
    pub fn hello(&self, _: InCtx<'_, ()>) -> Result<Substance, P::Err> {
        /// notice the InCtx... this is the InputContext which is implemented using generics InCtx<'_,()>
        /// the second generic def `()` is indicating to the handler that it excepts an empty body

        /// To respond we simply return a result like its a regular method call... The DirectedHandlerShell
        /// will take care of creating a Reflected Wave and sending it back to the Direct origin.
        Ok(Substance::Text("Hello, World!".to_string()))
    }
}
```

## DEPLOYING
Lucky for us we don't need to modify the code in order to deploy it since it already does exactly what we want it to do.

### MAKE
Run `make all` from the root of the project to compile the code and bundle it into a zip file for publication.

```bash
make all
```

### CREATE REPO & BUNDLE SERIES
In order to publish your bundle you will need a Repo and a BundleSeries.

```bash

# create a Particle at point `repo` with kind `Repo`
cosmic "create repo<Repo>"

# create a Particle under repo `hello` with kind `BundleSeries`
cosmic "create repo:hello<BundleSeries>"
```

### PUBLISH BUNDLE

```bash
        # this means we are uploading the file `bundle.zip` to publish to point `rep:hello:1.0.0`
cosmic "publish ^[ bundle.zip ]-> repo:hello:1.0.0"
```

### CREATE MECHTRON
Finally we can create our mechtron:

```bash
                            # pass in a reference to the mechtron config
create localhost<Mechtron>{ +config=repo:hello:1.0.0:/config/my-mechtron.mechtron };
```

## TEST
open your browser to [http://localhost:8080](http://localhost:8080) and you should see a very simple `Hello World"


