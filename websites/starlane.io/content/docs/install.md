# INSTALL

Config has a special document scope `Install` which allows for custom installation scripts:

```
App(1.0.0) {

  # Let's set some Env vars first
  Env {
    # so all child mechrons can reference this App
    app<App> = .;
  
    # let's ensure there is a UserBase for us (create one if not)
    users<UserBase> ?= create .:users<UserBase<OAuth<mechtronhub.io:keycloak.com:keycloak:community:(^10.0.0)>>>;
  }

  Install { 
    # set the bind property (if this is allowed)
    set .{ +bind=${bundle}/bind/my-app.bind };
  
  
    # let's create a place to hold our Mechtrons
    create .:mechtrons<Base>;
    
    # and a place for holding user profiles
    create .:profiles<Base>;
    
    # Create a specific mechtron, notice we can reference
    # The bundle that THIS document came from using ${bundle} variable
    create .:mechtrons:my-mechtron<Mechtron>{ config=${bundle}:/config/my-mechtron.config +bind=${bundle}/my-mechtron.bind };
     
    # create the emailer
    create .:mechtrons:emailer<Mechtron>{ config=${bundle}:/config/emailer.config +bind=${bundle}/emailer.bind };
    
    # you can see we are now referencing env.users variable:
    grant perm +cSd-RwX on ${env.users}:**<User> to .:mechtrons:**;
     
    # the emailer needs to have Read permission on users' email addresses
    grant priv +prop:email<Read> on ${env.users}:*<User> to .:mechtrons:emailer;
    
    # users should have complete access to their profiles
    grant +CSD-RWX on .:profiles:$(user) to ${users}:${user};
  }
}

```

There's a lot going on there, but you can see that some important mechtrons are being created which are part of composing this application at install time.

## NEXT
[Mechtrons & Apps]({{< ref "/docs/mechtrons-and-apps" >}} "Mechtrons & Apps")