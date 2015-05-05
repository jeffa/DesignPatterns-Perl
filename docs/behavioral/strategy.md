Strategy
========
The Strategy pattern defines a family of algorithms, encapsulates
each one and makes them interchangeable.  This is useful when you
need an algorithm that varies independently from clients that use it.

STRUCTURE
---------
```
    +------------+             +-------------+
    | Context    |             | Strategy    |
    +------------+<>---------->+-------------+
    | context()  |             | algorithm() |
    +------------+             +------+------+
                                      |
                                     / \
              +------------------------------------+
              |                 |                  |
              |                 |                  |
       +------+------+   +------+------+   +-------+-----+
       | ConcreteS.  |   | ConcreteS.  |   | ConcreteS.  |
       +-------------+   +-------------+   +-------------+
       | algorithm() |   | algorithm() |   | algorithm() |
       +-------------+   +-------------+   +-------------+
```

Participants
------------
* OODP::Strategy
* OODP::ConcreteStrategy
* OODP::Context
