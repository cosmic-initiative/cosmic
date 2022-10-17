# INSTALL

Config has a special document scope `Install` which allows for custom installation scripts:

```
App(version=1.0.0) {

  # Let's set some Env vars first
  Env {
    # so all child mechrons can reference this App
    app<App> = .;
  
    # let's ensure there is a UserBase for us (create one if not)
    users<UserBase> ?= create .:users<UserBase<OAuth<mechtronhub.io:keycloak.com:keycloak:community:(^10.0.0)>>>;
  }

  Install { 
    # set the bind property 
    set .{ bind=${bundle}/bind/my-app.bind };
  
    # let's create a place to hold our Mechtrons
    create .:mechs<Base>;
    
    # and a place for holding user profiles
    create .:profiles<Base>;
    
    # Create a specific mechtron, notice we can reference
    # The bundle that THIS document came from using ${bundle} variable
    create .:mechs:my-mechtron<Mechtron>{ config=${bundle}:/config/my-mechtron.config +bind=${bundle}/my-mechtron.bind };
     
    # create the emailer
    create .:mechs:emailer<Mechtron>{ config=${bundle}:/config/emailer.config +bind=${bundle}/emailer.bind };
    
    # you can see we are now referencing env.users variable:
    grant perm +cSd-RwX on ${env.users}:**<User> to .:mechs:**;
     
    # the emailer needs to have Read permission on users' email addresses
    grant priv +prop:email<Read> on ${env.users}:*<User> to .:mechs:emailer;
    
    # users should have complete access to their profiles
    # notice we capture `username` from porfiles so it will match the username in user account
    grant +CSD-RWX on .:profiles:$(username) to ${env.users}:${username};
  }
}

```

There's a lot going on there, but you can see that some important mechtrons are being created which are part of composing this application at install time.

## NEXT
[Mechtrons & Apps]({{< ref "/docs/mechtrons-and-apps" >}} "Mechtrons & Apps")