# CREATE

You can also create Particles from the Cli. To do so you must specify a Point and a Kind:

```
create my-domain.com<Space>
```

If you are creating a Particle with a Specific you can use Selection rules so that the Hyperverse will provision the best match for your needs.  For example:

```
create my-domain:users<UserBase<OAuth<mechtronhub.io:keycloak.com:keycloak:*:(^10.0.0)>>>;
```

Above we are asking to create an instance of Keycloak, any variant version 10.0.0 or above.  The Hyperverse should select the highest version that it has available that matches the given criteria.


### PROPERTIES

Sometimes passing configuration properties is required when creating a Particle.  For example an App MUST have a config:

```
create my-domain.com:app<App>{ +config=my-domain.com:repo:company-app:1.0.0:/config/my-app.config };
```

Above the realm of properties is entered using the curly brackets and adding new property definitions by using the + operator with assigned value.

### ARGS 

A particular Bind/Config may also require `Args` to be passed to it.
>***IMPORTANT***: ***Properties*** *are part of the Kind and* ***Args*** *are expected by the Bind and/or the Config.* Try not to get them mixed up!
 
Pass args by using Parenthesis:  
 
```
create my-domain.com:app<App>( company-name="ACME" ) 
```

### ENVS

Finally, you can set Environment variables when creating a Particle by using square brackets:

```
create my-domain.com:app<App>[ users=my-domain.com:users ] 
```

Environment variables Are also part of the Bind & Config however their values cascade down to all child references meaning that a Particle at point `domain.com:users:my-user` would have all the environment variables that were set from `domain.com` & `domain.com:users`

### ALL TOGETHER NOW
And of course you can chain them together into one monster create statement:

```
create my-domain.com:app<App>{ +config=my-domain.com:repo:company-app:1.0.0:/config/my-app.config }( company-name="ACME" )[ users=my-domain.com:users ] 
```

## NEXT
[Get, Set & Delete]({{< ref "/docs/get-set-delete" >}} "Get, Set & Delete")






 
 