# Building Bulletproof Views #

## Views Are Complex ##

lack of familiarity & rules
  know how to refactor Ruby but not CSS, ERB, etc
  
no logic in views, use helper

fat models, thin controllers, stupid views

use semantic markup

## Style ##

id uses underscore

classes use hyphens

don't use browser hacks

ie-conditional-tag-plugin

html 5 shiv in IE

modernizer

reset.css to zero everything

don't do `<%= stylesheet_link_tag :all `

## Writing Good Templates ##

verbose templates

display logic can be complex

more people handle views

they tend to change more frequently

## HAML ##

* haml may not be solving the right problem
* working with designers vs. working with developers

## Refactoring Tools ##
* partials
* helpers
* block helpers
* view classes
* content_for

## No Nos ##
* no queries in templates
* shouldn't need to query what the models name is within the views
* tip: avoid capital letters in template code
   no configuration constants or model classes
* no local assignment
   easy to break; hard to test/document
* conditional content
  split with helper and separate partials
* manual loops
   use collection partial type stuff
   
## Rendering ##

setting the page title through layout and instance variable

    <% content_for :page_header do %>
        <h1><%= @pet.name %></h1>
    <% end %>

    <section id='content'>
      <% if content_for?(:page_header) %>
         <%= yield %>
       <% end %>
    </section>
    
    <% page_title @pet.name 5>
    
    def page_title(title)
      content_for(:page_header, content_tag(:h1, title))
    end
    
content_for: conceptually related to action templates but structurally
located elsewhere in layout

## Block Helpers ##

    <section class='fancy-pants'>
    
    </section>
 we're using this all the time but would rather use
 
     <%= fancy_pants do %>
       Content
     <% end  %>

we would do this:

    def fancy_pants(&block)
      content_tag(:section, 
      capture(&block),
      class => 'fancy-pants')
    end
    
## Navigation ##

* Tells Users where they can go
* Reminds users where they are

don't do it with instance variables

the manual method; link\_to\_unless\_current

the css method
  this will take you all day

the action template needs to tell you where it is

can use goose gem to handle this

## form\_for vs form\_tag

form_tag if you are doing something very simple

    <style>
    label {display: block;}
    </style>
    <% form_for @pets do |f| %>
    <fieldset>
      <legend>Pet</legend>
      <ul>
        <li>
	  <%= f.label :name, "Name:" %>
	  <%= f.text_field :name %>
	</li>
      </ul>
    </fieldset>
    <% end %>

cool html5 form elements iOS keypads and such

search, email, phone, date, etc.

[HTML 5 Forms](http://www.diveintohtml5.org/forms.html)

formtastic and simple_form

## don't fear the object ##

why are there no classes in the view layer??

it would give us encapsulation

helper class: encapsulates state, accesses templates

the class just needs to be able to turn itself into a string

also could have a hybrid of view and controller stuf fin class

view classes let you test view logic better


## mobile stuff ##

challenges:
 
* fat fingers
* low bandwidth

responsive design
  client-side smart rendering via conditional CSS
  this shit is long you, and it downloads the entire page irregardless

  [A Link](http://www.mediaqueri.es)
  
can filter and use different partials and layouts for mobile

mobile fu and jQuery mobile

## packaging ##

yslow, deadweight, pagespeed, etc

jammit

sprockets build in rails 3.1

[Link To Slides](http://www.therailsview.com/railsconf2011)
