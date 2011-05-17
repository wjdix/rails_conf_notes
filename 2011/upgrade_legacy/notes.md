# Migrating Legacy Rails Apps to Rails 3 #


## Links ##

[Rails 3 Upgrade Links](http://bit.ly/rails3up)    

[Presentation Slides](http://www.slideshare.net/crnixon/rails-3-7983843)

## Reasons To upgrade ##

10. Arel syntax is cool, delays query. 
9. jQuery is easier (default in 3.1)
8. Bundler
7. Easier to hire new developers?
6. Ready for Rails 4?
5. Way faster than Rails 2??
4. ActiveModel lets you treate everything like ActiveRecord (Lets you do things like Table-Less model more easily)
3. Don't have to use ActiveRecord
2. Cut your controllers down to size with respond_to 

## Getting Ready with Rails 2.3 ##

Upgrading gives you a chance to start refactoring stuff you don't like
Improve them before the upgrade, not after.

### Get on 2.3.11 and .... ###

1. Get rid of all deprecations.
2. install rails_xss plugin and fix views.
3. rename any rhtml rjs or rxml

### Rails XSS ###
safe strings copied directly into output; unsafe strings are always escaped

strings are unsafe by default

string interpolation is unsafe

built-in helpers are safe

.html_safe marks strings as safe

<%=raw %> copies strings verbatim

internationalized app, with yaml locales; all keys which point to html end in '_html' or else will be escaped

### fake_arel ###

uses named scopes and a few patches to provide new ARel syntax

actually lazily loaded

### RESTful Controllers ###
much simpler to upgrade if restful

now is a good time to do refactoring

routes syntax works better in rails 3

### Other Improvements ###
uses YAJL for JSON, which is faster

Object#presence 

Object#returning removed in Rails 3. Replaced with Object#tap

Putting non AR fixtures in test/fixtures will break in Rails 3.

## Working with Bundler ##

rails_upgrade plugin will generate a gem file

replace plugins with gems

you can use your own edited plugins; make your own fork

## Using rails_upgrade ##

should be installed as a plugin

rake rails:upgrade:check
  generates a report on what needs to be updated
  make sure to save it(b/c it will not generate the same stuff once you upgrade)
  
rake rails:upgrade:backup
  copies all files likely to be overwritten and adds rails2 extension
  
rake rails:upgrade:gems
  spits out a gemfile
  but not perfect
  wont look through config/environments/*.rb
  
rake rails:upgrade:routes
  converts old style routes to Rails 3-style routes
  old syntax deprecated, but works
  
rake rails:upgrade:configuration
  generates new application.rb
  
## Taking the Rails 3 Plunge ##

### Generate a new Rails app ###
  `rails new . -d <database>`
  
  will prompt you about overwriting files
  alot of stuff
  git will hold your hand
  git add --patch
  can choose just what you want changed
  git add --edit
  
  remove preninitializer.rb 
  
  lib/ directory not autoloaded
  
  config.load_paths += %W(#{config.root}/lib)

### JavaScript Fixes ###

  Rails 3 unobtrusive JS
  javascript\_include\_tag :defaults in view
  Add csrf\_meta\_tag inside <head>
  
#### Removed in Rails 3 ####
button\_to\_remote
submit\_to\_remote
observe\_field
observe_form

look in links to see how to handle with JS

#### Replaced ####
link\_to\_remote
form\_remote\_tag
form\_remote\_for
remote\_form\_for

  just :remote => true to form_for
  
### Other form Errors ###

error\_messages\_for :model
form.error_message
input('model', 'field')
form('model')

simple_form gem

### Fixing & Replacing Dependencies ###

#### RSpec ####

    require 'spec' => require 'rspec'
    require 'rspec/rails' => rquire 'rspec/rails'
    
make sure rspec-rails is in the dev and test groups in the Gemfile

Cucumber now uses test environment by default

RSpec view matchers need to install rspec2-rails-views-matchers

#### FactoryGirl ####

 gem name is factory\_girl\_rails_gem
 
#### WillPaginate ####
 
beta Rails 3 version branch

can use Kaminari as replacement

#### SearchLogic ####
broke as a joke folk

ARel and MetaSearch to replace

#### AttachmentFu  ####
it does not work

use paperclip or CarrierWave

#### acts\_as\_solr ####

this does not work

