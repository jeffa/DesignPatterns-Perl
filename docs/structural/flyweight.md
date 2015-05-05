Flyweight
=========

The Flyweight pattern supports large numbers of fine-grained objects efficiently
via sharing.  This is useful when you:

* have an application that uses a large number of objects
* have high storage costs due to sheer quantity of objects
* have a majority of objects whose state can be made extrinsic
* have many groups of objects that may be replaced by few shared objects
* have an application that does not depend on object identity

Participants
------------
* OODP::ConcreteFlyweight
* OODP::UnsharedConcreteFlyweight
* OODP::FlyweightFactory
