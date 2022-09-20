#  PARTICLES POINTERS & KINDS

## PARTICLES
A Particle is a resource which can send and receive Waves (messages).

## KIND
Particles differ in functionality by their Kind. For example a User Particle will accept different types of Waves than a FileSystem Particle.  They do different things.

### DENOTATION
Kinds are denoted in angle brackets:
```
<Space>
```

Space is a single Base Kind without any Sub Kinds.

### SUBS
Kinds can be hierarchical and are notated using delimited angle brackets like so:
```
<Base<Sub>>
```

Above you can see that a Base Kind and a Sub Kind are denoted.

For example to reference a Relational database you would denote it like this:
```
<Database<Rel>>
```

And You would reference a Graph database like this:
```
<Database<Graph>>
```

The more specific the Sub Kind the more custom functionality you can access in the Particle's API.

### SPECIFIC
There is one more rung in the Kind hierarchy which is a `Specific`.

Here is an example of a Specific:
```
mechtronhub.io:postgres.org:postgres:gis:12.0.0
```

And it would go with the rest of our Kind definition like this:

```
<Database<Rel<mechtronhub.io:postgres.org:postgres:gis:12.0.0>>>
```

A Specific identifies an EXACT implementation of a Particle.

The various parts of the specific can be broken down as follows:

```
provider-domain:vendor-domain:product:variant:version
```

Provider Domain is the provider of the one supplying the Driver for the given Kind... which may not be the same as the vendor that actually supplies the product.

## POINT
Every particle has a Point which acts as an address and unique identifier. The Particles Point is used in security, searching, message routing, logging and more. 

Points are hierarchical and are usually delimited by a ':'.  Here is an example of a Point:

```
my-domain.com:users:my-user
```

Notice above the first Point Segment `my-domain.com` is a domain name and in fact the first segment MUST be a lowercase valid hostname or domain name.  The first segment is also required to be a `Space` Kind. 

Also note that only the Space segment is allowed to have dots in it, the rest of the Base segments are lowercase kebab. 

## POINT + KIND
Point & Kind can be put together when referencing a Particle like this:

```
my-domain.com:users:my-user<User>
```

As you can see the Particle is identified by Point and Kind by immediately appending the Kind denotation after the Point.

## FILESYSTEM POINTS
When referencing the children of a FileSystem Particle the Point Rules change a little.

```
my-domain.com:my-files:/some-file.txt
```

Notice that there is now a leading slash (which identifies the root of the FileSystem).  Once the point segments pass a slash the rules change so that segments are delimited by slashes, and they can have any valid file characters.

Here is Another example showing directory structure:
```
my-domain.com:my-files:/some-dir/My-file.txt
```

Again, notice that My-file.txt has a capital letter in it, not allowed in the regular Base segments, but perfectly allowed once the transition is made to FileSystem segments.

## ARTIFACT BUNDLES
Artifact Bundles are zip files that can be downloaded and cached by other services.  They exist in a repo and are versioned.   A Bundle must live underneath an ArtifactBundleSeries which in turn must be under a Repo.

Since a Bundle is versioned its Point Segment is a version number:
```
my-domain:repo:my-bundle-series:1.0.0
```

It is required that after a version is declared remaining segments will use FileSystem style which makes sense because an Artifact Bundle is really just a zip file.  In order to reference an artifact:

```
my-domain:repo:my-bundle-series:1.0.0:/bind/my-particle.bind
```













