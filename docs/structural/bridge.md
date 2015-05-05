Bridge
======
The Bridge pattern decouples an abstraction from its implementation so
that the two can vary independently. This is useful when an abstraction
needs to be unbounded by its implementation. This is useful for hiding
the implementation of an abstraction completely from clients and changes
in that implementation should have no impact on clients (i.e. no need to
recompile their code).

Participants
------------
* OODP::Abstraction
* OODP::RefinedAbstraction
* OODP::Implementor
* OODP::ConcreteImplementor
