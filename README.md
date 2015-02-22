# date-logic-for-jekyll
Creates liquid elements that allow comparison of date/time variables in front matter to site time.

Using `{% before item.date %}` works like an if statement to show elements if `item.date` or any variable passed to it occurs before the site's current build time. 

Using `{% after item.date %}` will work the same way, but it shows content if the site build time is after the date passed. 
