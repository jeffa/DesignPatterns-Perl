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
* [OODP::AbstractFactory](/lib/OODP/AbstractFactory.pm)
* [OODP::AbstractWidget](/lib/OODP/AbstractWidget.pm)
* Your::ConcreteFactories
* Your::ConcreteWidgets
