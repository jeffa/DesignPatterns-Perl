Iterator
========
The Iterator pattern provides a way to access elements of an
aggregate object sequentially without exposing its underlying
representation.  This is useful for supporting multiple traversals
of aggregate objects and provides a uniform interface that supports
polymorphic iteration.

Structure
---------
```
   +----------------+    +------+    +--------------+
   +   Aggregate    |<-->|client|<-->|   Iterator   |
   +----------------+    +------+    +--------------+
   |CreateIterator()|                | First()      |
   +----------------+                | Next()       |
                                     | IsDone()     |
                                     | CurrentItem()|
                                     +--------------

+---------------------+          +------------------+
|  ConcreteAggregate  |--------->| ConcreteIterator |
+---------------------+          +------------------+
|  CreateIterator() * |                        
+-------------------|-+
                    |
   +----------------v----------------
   |                                 \
   |return new ConcreteIterator(this)|
   +---------------------------------+
```

Participants
------------
* [OODP::Aggregate](/lib/OODP/Aggregate.pm)
* [OODP::Iterator](/lib/OODP/Iterator.pm)
* Your::ConcreteAggrates
* Your::ConcreteIterators

Tests
-----
* [/t/016-iterator.t](/t/016-iterator.t)
