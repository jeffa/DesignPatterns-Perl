Template Method
===============
The Template Method pattern allows subclasses to redefine certain steps of an
algorithm without changing the structure of that algorithm. This is useful for
implementing the invariant parts of an algorithm once and letting subclasses
implement variant behavior.

Structure
---------
```
     +------------------------+
     |     AbstractClass      |
     +------------------------+      +-------------------------+
     |                        |      |  primitive_operation1() |
     | template_method()  o----------+  ...                    |
     |                        |      |  primitive_operation2() |
     | primitive_operation1() |      |  ...                    |
     | primitive_operation2() |      +-------------------------+
     +------------------------+
                  ^                  
                  |
     +------------------------+
     |     ConcreteClass      |
     +------------------------+
     |                        |
     | primitive_operation1() | 
     | primitive_operation2() | 
     +------------------------+
```

Participants
------------
* [OODP::AbstractClass](/lib/OODP/AbstractClass.pm)
* Your::ConcreteClasses
