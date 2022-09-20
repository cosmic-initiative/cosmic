# GET, SET & DELETE

## GET
To get a property value:

```
get my-domain.com:users:uberscott{ email }
```

### ENV
And if you want to grab an environment variable: 

```
get my-domain.com:app:mechtrons:my-mechtron[ app ]
```

### ARG
And for args:

```
get my-domain.com:app:mechtrons:my-mechtron( company-name )
```

## SET
To set a property value:
```
set my-domain.com{ +bind=my-domain.com:repo:my-site:2.7.3:bind/routes.bind }
```

The Same goes for environment variables: 

```
set my-domain.com[ slogan="We can do it!" ]
```

### REMOVE
You can remove a Property if it is allowed:
```
set my-domain.com{ !bind }
```

## ARGS NOT ACCESSIBLE
Args which are used in the process of creation of a particle cannot be modified by Set 


## DELETE
When you grow tired of your Particle you can delete it:

```
delete my-domain.com:app
```
The above will delete recursively, but you can also delete selectively:

```
delete my-domain.com:app:**<Mechtron>
```