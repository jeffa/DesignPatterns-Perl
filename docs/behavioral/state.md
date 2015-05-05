State
=====
The State pattern allows objects to alter their behavior when their internal
state changes.  This is useful for operations that have large,
multpart conditional statements that depend on that state, which
is usually represented by one or more enumarated constants. The State
pattern puts each branch of a conditional into a separate class, allowing
you to treat the state as an object itself.

Participants
------------
* OODP::Context
* OODP::State
* OODP::ConcreteState
