Decorator
=========
The Decorator pattern attaches additional responsibilites to an
object dynamically. Provides a flexible alternative to subclassing.
This is useful for adding responsibilities to individual objects
dynamically and transparently. Assigned responsibilities can also
be withdrawn dynamically. Also useful when extension by subclassing
is impractical or even impossible.

Structure
---------
```
                +-------------+
                | Component   |
                +-------------+<-------------+
                | operation() |              |
                +------+------+              |
                       |                     |
                      / \                    |
           +--------------------+            |
           |                    |            |
  +------------------+    +--------------+   |
  | ConcreteCompoment|    | Decorator    |   |
  +------------------+    +--------------<>--+
  | opertation()     |    | opertation() |   component
  +------------------+    +-------+------+
                                  |
                                 / \
                        +------------------+
                        |                  |
            +-----------+--------+  +------+-------------+
            | ConcreteDecoratorA |  | ConcreteDecoratorB |
            +--------------------+  +--------------------+
            | opertation()       |  | operation()        |
            +--------------------+  | added_behavior()   |
            | addedState         |  +--------------------+
            +--------------------+
```

Participants
------------
* [OODP::Component](/lib/OODP/Component.pm)
* [OODP::Decorator](/lib/OODP/Decorator.pm)
