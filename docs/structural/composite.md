Composite
=========
The Composite pattern represents part-whole hierarchies of
objects without regard to distinction between the compositions
of those objects. This is useful when you want clients to be able
to ignore the difference between compositions of objects and
individual objects. Clients will treat all objects in the composite
structure uniformly.

STRUCTURE
---------
```
       +------+     +----------------+
       |client|---->|   Component    |
       +------+     +----------------*<---------+
                    | add()          |          |
                    | remove()       |          |
                    | get_child()    |          |
                    | is_composite() |          |
                    +-----+----------+          |
                          |                     |
                         / \                    |
           +-------------------+                |
           |                   |                |
       +--------+      +-------------+          |
       |  Leaf  |      |  Composite  | children |
       +--------+      +-------------<>---------+
       | draw() |      | draw()      |
       +------+-+      +-------------+
```

Participants
------------
* [OODP::Component](/lib/OODP/Component.pm)
* [OODP::Leaf](/lib/OODP/Leaf.pm)
* [OODP::Composite](/lib/OODP/Composite.pm)
