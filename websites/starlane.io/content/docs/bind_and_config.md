# BIND & CONFIG

Docs Bind & Config have very similar content and are therefore documented together: 

## BIND
**Bind** describes a contract between the particle and the Fabric... it enumerates the required args and environment variables that must be passed or set and requires other particles it should have access to.  The Route shows the legal waves that other Particles can send to it but also describes the required pipeline those waves must travel.  The Bind Cannot set Arg or Env Vars or Particles.  Bind also restricts the permissions of the particle... A bind is sometimes set FOR a particle not BY the particle (and in some cases the bind is locked so the particle cannot change it.). this is for security and conformity ... it is saying "you can install any particle that is satisfied by and follows the rules of this bind"

## CONFIG
**Config** is always under the control of the Particle.  It has some overlap with Bind but is usually more powerful... for instance it can set/override Env vars whereas Bind can only set default values.  Config also has the **Install* selector which can create other particles and/or set permission ... basically it can access the Cli.   Finally, a Config for a Mechtron or App will point to the actual Wasm guest binary.

### CONTEXT
Points within the Bind & Config can be contextual, meaning they can be referenced relative to the Particle Point that the Bind or Config is describing.

For example within a Bind for `my-domain:app` instead of referencing a child Point like this:

```
my-domain:app:mechtron
```

It can instead be referenced using the working Point:

```
.:mechtron
```

Parent points can also be referenced using `..`:

```
..:another-app
```

### DOCUMENT DECL
The first part of a Doc is that it's Kind and Version must be declared:

```
Bind(version=1.0.0) { }
```

This tells the Doc parser what is being parsed and what version it must be translated from

### Arg\<Var>
The `Arg<Var>` Selector tells the Bind & Config which Arguments are expected to be passed to the Particle at creation time:

```
Bind(version=1.0.0) {
  Arg<Var> {
    # ensure company-name is set and is a <Text>
    company-name<Text>; 
    
    # if num-employees is not set then throw the error message "Please set num-employees!"
    num-employees<Int> !! "Please set num-employees!";
    
    # if not set default to 'LCC'
    company-type<Text> ?= "LCC";
  }
}
```

And an example of a Config which can actually set vars:

```
App(version=1.0.0) {
  Arg<Var> {
    num-employees<Int> = 100;
  }
}
```

### Env\<Var>
Like Arg we can also ensure that environment variables are set.  Environment variables are inherited from the parent.

```
Bind(version=1.0.0) {
  Env<Var> {
    slogan<Text> !! "everyone needs a slogan!"
  }
}
```

### Env\<Particle>
Environment Particles can also be required and set if needed:

```
Bind(version=1.0.0) {
  Env<Particle> {
    # require that App has been set by a parent
    app<App>; 
    
    users<UserBase> !! "must have a UserBase!";
  }
}
```

And the config for App:

```
App(version=1.0.0) {
  Env<Particle> {
    # here the App is setting the environment variable app to itself so that the children of the app will have a reference to it
    app<App> = .;
    
    # if userbase does not exist, then create it
    users<UserBase> ?= create .:users<UserBase<OAuth<mechtronhub.io:keycloak.com:keycloak:community:(^10.0.0)>>>;
  }
}
```

The above example is interesting because the App can be provided with a UserBase (in the case where you may want to share the UserBase with several apps) but if not present it will create its own UserBase.











