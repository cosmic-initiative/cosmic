# BIND ROUTES & PIPELINES
One of the most important interfaces that the Bind provides are the Routes & Pipelines.

## ROUTE
Routes are selectors which take a Directed Wave's Method & Path and if matched forward that Wave through the selected Pipeline.

## PIPELINE
The pipeline describes the series of filters, steps and stops to process the Directed Wave.  

## GET EXAMPLE
Here is a simple Route & Pipeline definition in arrow notation:

```
Bind(version=1.0.0) {
  Route<Http<Get>>> -> my-domain:app => &;
}
```

Let's break this down: 
### THE ROUTE SELECTOR
* **Route** - This tells the Bind config that we are dealing with a Route
* **Http** - this selects the Kind of wave we want to intercept... in this case an Http Wave  
* **Get** - this is a standard Http Get Method

### THE PIPELINE
If the incoming Directed Wave matches the Route Selector then it enters the pipeline:
* **->** - This is a **Pipeline Step** segment. It will take any Directed Wave and pass it forward
* **my-domain:app** - This is a **Pipeline Stop** segment.  The Wave will be routed to the `my-domain:app` Particle
* **=>** - This Pipeline Step filters for a Reflected Wave (denoted by => intead of -> )
* **&** - The final Pipeline Stop segment indicates that the Pipeline is complete and the result should be returned

## EXPANDABLE OR COLLAPSABLE
To Make things as easy to read as needed, the Route declarations can be expanded or collapsed in these varieties:
```
  Route<Http<Get>>> -> my-domain:app => &;
  
  # is the same as:
  
  Route {
    Http<Get> -> my-domain:app => &;
  }  
  
  # which is also the same as: 
  
  Route {
    Http {
      Get -> my-domain:app => &;
    }  
  }  
 
```

## WILDCARDS
You can apply Wildcards for the Method:
```
Route<Http<*>> -> my-domain.com:deal-with-all-traffic => &;
```

## AUTH FILTERS
Filters can be applied for Authorization:
```
Route {
  Http(auth) {
    Get -> my-domain:members-only => &;
    Post -> my-domain:members-only => &;
  }
  
  Http {
    Get -> my-domain:anonymous => &;
    Post -> my-domain:anonymous => &;
  }
}

```

## PATH FILTERS
Path Filters can also be applied:
```
Route<Http<Get>>/some-path -> my-domain.com:app:process-some-path => &;
```



## CORE STOP
Use the `(())` operator to denote that the directed  should now go into the core of the Mechtron for processing

```

Route {
   Http<Post> -> (()) => &;
}

```

## CHAINING PIPELINES
You can chain your pipeline however you like to transform the incomming request or filter input:

```
Route<Http<Post>>/set-password -> my-domain:password-validator -> (()) => &;
```

Above the password validator will throw an error if it isn't valid.  Also note that `my-domain:password-validator` returns a new Directed Wave in the body of its Reflected Wave which is grabbed when the `->` Pipeline step is encoutered.

## FILTERING BODY
The Body of a Directed and Reflected Wave can be filtered by Type: 

```
Route<Http<Post>>/set-password -[ Text ]-> my-domain:password-validator -[ Text ]-> (()) =[ Json ]=> &;
```

If the submitter tries to send an image it will be rejected. And this bind enforces that the underlying Mechtron return Json.

## VAR SUBSTITUTION
Some examples of Var substitution have already been shown, but it's good to know you can use Vars throughout the pipeline:

```
# redirect to app
<Http<Get>> -> ${env.app} => &; 
```

## PATH CAPTURING
And Path fragments can be captured using Regex and captured variables can be used later in the pipeline:
```
Route {
  Http(auth) {
     Post/users/(?P<user>.*)/profile-pic -> my-domain:app:profiles:${user} => &;
  }
}
```

