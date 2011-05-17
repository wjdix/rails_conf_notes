# Fat Models Aren't Enough #

* Best practices, maybe?
   Ideas worth talking about.
* Refactoring
   \"Don't touch anything that doesn't have good test
   coverage. Otherwise, you're not refactoring; you're just changing shit.\"

## Skinny Controllers, Fat Models ##

jamis buck, 2006

* influence of PHP, logic in the view
  better to push it down
* push code into the model, slim down the controller, document the
  operation by naming the method
* closer a view is to HTML the better
  data access, looping
* beautiful actions are 8 simple lines
* beautiful models are organized
* not good enough to be fat only

## Presenter Pattern ##

* Adaptation of the decorator pattern
* Wrapper that adds non-mutator methods
* shepherd of presentation(mixes one or more objects)

### When do you need a presenter ###
1. a lot of controller instance variables, which are peers
2. in views, use is intermingled

add presenters folder to app/

should we move from child class into presenter class?
can a kid tell you his own grades, why should student class find
grades for a report

#### Canonical Data ####

a student is represented by lastname, firstname

presenter can include this well

title for report

why not use helpers; this guy doesn't like them
why not just use objects

## Better Rails through Better Ruby ## 

* A significant percentage of Rails programmers are not Ruby
  programmers
* Is it better to use Ruby when it is sufficent rather than Rails
* multiple attributes with same prefix, probably violation of SRP

## Signs of SRP Violations ##
* method longer than 8 line (extract method)
* method located in wrong object (move method)
* magic numbers(introduce constants or a config object)

## Scopes are Dead ##

ARel has takne everything good from scopes

don't need ot use lambda anymore(and it's deprecated now)

class methods > scopes

Good Books:

* Eloquent Ruby
* Refactoring
* Design Patterns in Ruby
