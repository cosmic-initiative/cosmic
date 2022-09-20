# SELECTING

The following describes how to select using the Command Line Interface.  Cli can also be used within Mechtrons and Controls

To start with you can select a Particle by its exact name but that isn't very useful other than to test if it exists or not:

```
select localhost
```

And you can select a list of Particles you can use a very familiar wildcard:

```
select my-domain.com:*
```

If you want to get a recursive result use `**`:

```
select my-domain.com:**
```

What if you want to get a recursive result but you also want to include `my-domain.com` ?  You can use the `inclusive` operator:

```
select my-domain.com:+**
```

If you want to select by Kind you can do that too:
```
select **<User>
```

The above will return ALL users in the Cosmos.

You can combine Point & Kind selects:

```
select my-domain.com:**<User>
```

Also you can wildcard a Sub Kind:

```
select my-domain.com:**<Database<*>>
```

For Artifact Bundles you can use SemVer matching rules:

```
select my-domain.com:repo:my-app:(^3.0.0);
```

The above will return all Bundles with a version 3.0.0 and greater

AND you can select for a Specific Version:

```
select my-domain.com:**<Database<Rel<mechtronhub.io:postgres.org:postgres:*:(^9.0.0)>>>
```

The above will return all Postgres databases above version 9.0.0 any variant.












