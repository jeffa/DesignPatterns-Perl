Abstract Factory
================
The AbstractFactory pattern provides interface for creating objects
without specifying their concrete classes. This can be used for
systems that should be independent of how their products are created,
composed and represented. 

Structure
---------
Client only accesses AbstractFactory and resulting class: AbstractWidgetA
and/or AbstractWidgetB, etc.
```
                                                    +------------------+
            +-----------------+                     | AbstractWidgetA  |
            | AbstractFactory |                     +------------------+
            +-----------------+                               |         
            |create_productA()|                       ----------------  
            |create_productB()|                       |              |  
            +-----------------+                  +---------+   +---------+
                      |                          |WidgetA1 |   |WidgetA2 |
                      |                          +---------+   +---------+
           +----------------------+            
           |                      |            
  +-----------------+    +-----------------+        +------------------+
  |ConcreteFactory1 |    |ConcreteFactory2 |        | AbstractWidgetB  |
  +-----------------+    +-----------------+        +------------------+
  |create_productA()|    |create_productA()|                  |
  |create_productB()|    |create_productB()|          +--------------+
  +-----------------+    +-----------------+          |              |
                                                 +---------+   +---------+
                                                 |WidgetB1 |   |WidgetB2 |
                                                 +---------+   +---------+
```

Participants
------------
* [OODP::AbstractFactory](/lib/OODP/AbstractFactory.pm)
* [OODP::AbstractWidget](/lib/OODP/AbstractWidget.pm)
* Your::ConcreteFactories
* Your::ConcreteWidgets

Tests
-----
* [/t/001-abstract-factory.t](/t/001-abstract-factory.t)
* [/t/101-abstract-factory.t](/t/101-abstract-factory.t)
  * [Test::AbstractFactory::BombedMazeFactory](/t/lib/Test/AbstractFactory/BombedMazeFactory.pm)
  * [Test::AbstractFactory::BombedRoom](/t/lib/Test/AbstractFactory/BombedRoom.pm)
  * [Test::AbstractFactory::BombedWall](/t/lib/Test/AbstractFactory/BombedWall.pm)
  * [Test::AbstractFactory::Door](/t/lib/Test/AbstractFactory/Door.pm)
  * [Test::AbstractFactory::EnchantedDoor](/t/lib/Test/AbstractFactory/EnchantedDoor.pm)
  * [Test::AbstractFactory::EnchantedMazeFactory](/t/lib/Test/AbstractFactory/EnchantedMazeFactory.pm)
  * [Test::AbstractFactory::EnchantedRoom](/t/lib/Test/AbstractFactory/EnchantedRoom.pm)
  * [Test::AbstractFactory::MapSite](/t/lib/Test/AbstractFactory/MapSite.pm)
  * [Test::AbstractFactory::Maze](/t/lib/Test/AbstractFactory/Maze.pm)
  * [Test::AbstractFactory::MazeFactory](/t/lib/Test/AbstractFactory/MazeFactory.pm)
  * [Test::AbstractFactory::Room](/t/lib/Test/AbstractFactory/Room.pm)
  * [Test::AbstractFactory::Wall](/t/lib/Test/AbstractFactory/Wall.pm)
