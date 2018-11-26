# Skippy
A sample program that simulates Markov's Chain, using a multi-dimensional grid

# Development Environment
- Macbook Pro 
- OSX - Mojave 10.14.1
- ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]
- IDE: RubyMine 2017.2.2

# Classes
- Main.rb: Instantiates the various classes and apply their dependencies
- Kangaroo.rb - contains a ``hop`` function and a ``check_is_home?`` function
- Factory.rb - creates new instances of objects when needed
- Die.rb - Tells Skippy which direction to hop and calculates the statistics
- Grid.rb - contains a ``hit_boundary?`` function to check grid boundaries for hops

# Design considerations
- The user enters input X and input Y for represent the grid
- Main.rb contains a single area where we apply all the dependencies of each object
- I've created a ``Factory.rb`` to house all object creation in one place
- The program runs recursively until the ``check_is_home?`` function returns true
- Each class only contains functionality that are related to that object

# Running the program
- Using the terminal, ``ls`` into the DesignPatternsAssignment folder
- Run ``ruby main.rb``
- Enter integer values for X and Y, e.g:
```sh
"Please enter size of X of grid >= 1"
4
"Please enter size of Y of grid >= 1"
4
```

# Sample output

```angular2html
"Hopped to: (3, 1)"
"Hopped to: (2, 1)"
"Hopped to: (2, 0)"
"Oops, hit the boundary: (2, -1)"
"Hopped to: (3, 0)"
"Oops, hit the boundary: (4, 0)"
"Oops, hit the boundary: (3, -1)"
"Hopped to: (3, 1)"
"Hopped to: (3, 2)"
"Oops, hit the boundary: (4, 2)"
"Hopped to: (3, 1)"
"Hopped to: (3, 2)"
"Hopped to: (3, 3)"
"Hopped to: (2, 3)"
"Hopped to: (2, 2)"
" - Finished in 24 hops!"
" - Total throws:: 31"
" -   North: 25.81%"
" -   South: 35.48%"
" -   West: 25.81%"
" -   East: 12.9%"

```
