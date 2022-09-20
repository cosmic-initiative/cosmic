# SECURITY

## AGENT
Every Wave that is sent from one Particle to another references an Agent which is just a Point that access rules can be applied to. Usually a Particle sends itself as the Agent, but there are cases where It can use other Agents if the Hyperverse allows it.

## HYPERUSER
The HyperUser is the only user that access is not checked on.  It can do anything (just like the Root user in unix OS.)

## GRANT PERMISSION

to grant permission on a particle to a particle:

```
grant perm +csd-Rwx on my-domain.com:** to my-domain.com:**<User>
```

Above we are granting READ access to all users under `my-domain.com` on every particle under `my-domain.com`.

Let's examine this part: `+csd-Rwx`  The letters stand for Create, Select, Delete, Read, Write and Execute.  if the letter is capitalized then the permission is flagged as on, if lowercase it is off.

Also note the leading `+` operator.  That is saying to OR these permissions with existing permissions.  You can also choose to AND the permissions via the `&` operator which would have looked like this:

```
grant perm &csd-Rwx on my-domain.com:** to my-domain.com:**<User>
```

>NOTE: The rules of how the Ands and the Ors are combined are consistent but a bit tricky and I will expand on it in a later iteration of this document -- uberscott
 
### CSD 
First let's break down CSD:
* **CREATE** - Permission to create children under the Particle
* **SELECT** - Permission to select this Particle and children
* **DELETE** - Permission to delete this Particle and children

### RWX
Let's break down the RWX:

* **READ** - Permission to read the state of the Particle (not all particles have state)
* **WRITE** - Permission to write the state of the Particle (not all particles have state)
* **EXECUTE** - Permission to send Waves to the Particle

## PRIVILEGES
Sometimes security has to be a little more fine-grained that broad permissions.  For this we have Privileges.

One built in Privilege in the system is the User email property.  Even if a Particle has full CSD-RWX access to a User Particle it cannot get the value of the email property unless it has been granted privilege to do so.

To grant a privilege:

```
grant priv prop:email<Read> on my-domain.com:users:**<User> to my-domain.com:my-app:mechtrons:emailer
```

As you can see above we are giving only one mechtron in our application, the emailer mecthtron the privilege to see the email addresses, all other mechtrons are untrusted.

## LISTING GRANTS
You can list the grants on a particular Pattern:
```
grant list on my-domain.com:my-app+:**;
```

And that will result in a list with a numbered id with every grant.  You can then revoke the grant using the number:

```
grant revoke 1
```

## OWNERSHIP & CHOWN
When a Particle creates another Particle that Particle owns it and perform any action upon it full permissions and full privileges.  To change ownership:

```
chown localhost:users:uberscott localhost:something;
```

## CAPTURE MAPPING
There are times when you may want to capture and reuse a segment to make more complicated permission rules

```
grant perm +CSR-RWX on my-domain.com:profiles:$(user) to my-domain.com:users:${user}
```

Above the variable `user` is captured in profiles and filled in the UserBase giving each user complete access to his or her own profile.

## SUPER
The HyperUser has complete access to the entire Cosmos, however it is also desirable to have SuperUsers which have complete access to only a portion of the overall cosmos.  To accomplish this we can grant another user SuperUser access:

```
grant super on my-domain.com:** to my-domain.com:users:what-a-great-guy<User>
```

Above you can see that `what-a-great-guy` has been granted superuser access to everything under the my-domain, and he will have full access to anything that matches that pattern,

The use of SuperUser can be particularly useful for Apps which may need to control every aspect of their children:

```
grant super on my-domain.com:app:+** to my-domain.com:app<App>
```

above the App can now administer itself and its children with full access.



















