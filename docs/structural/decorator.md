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
* Your::ConcreteComponents
* Your::ConcreteDecorators

Tests
-----
* [/t/009-decorator.t](/t/009-decorator.t)
* [/t/109-decorator.t](/t/109-decorator.t)
  * [Test::Decorator::FileStream](/t/lib/Test/Decorator/FileStream.pm)
  * [Test::Decorator::LowerCasingFilter](/t/lib/Test/Decorator/LowerCasingFilter.pm)
  * [Test::Decorator::MemoryStream](/t/lib/Test/Decorator/MemoryStream.pm)
  * [Test::Decorator::Stream](/t/lib/Test/Decorator/Stream.pm)
  * [Test::Decorator::StreamDecorator](/t/lib/Test/Decorator/StreamDecorator.pm)
  * [Test::Decorator::UpperCasingFilter](/t/lib/Test/Decorator/UpperCasingFilter.pm)
