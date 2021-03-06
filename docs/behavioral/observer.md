Observer
========
The Observer pattern defines a one-to-many dependency between objects so that
when one object changes state, all its dependents are notified and
updated automatically. This is useful when a change to one object
requires changing others without knowing how many objects need to be
changed and no assumptions about who the objects are needs to be made.
Promotes loose coupling.

Structure
---------
```
   +-----------+  observers              +-----------+
   |  Subject  |------------------------>* Observer  |
   +-----------+                         +-----------+
   |  attach() |                         | update()  |
   |  detach() |                         +-----+-----+
   |  notify() |                               ^
   +------+----+                               |
          ^                            +-------+----------+
          |                            | ConcreteObserver |
          |                            +------------------+
   +------+-----------+        subject | update()         |
   |  ConcreteSubject |<---------------| observer_state() |
   +------------------+                +------------------+
   |  get_state()     |
   |  set_state()     |
   +------------------+
```

Participants
------------
* [OODP::Observer](/lib/OODP/Observer.pm)
* [OODP::Subject](/lib/OODP/Subject.pm)
* Your::ConcreteObservers
* Your::ConcreteSubjects

Tests
-----
* [/t/019-observer.t](/t/019-observer.t)
* [/t/119-observer.t](/t/119-observer.t)
  * [Test::Observer::Clock](/t/lib/Test/Observer/Clock.pm)
    * [Test::Observer::Clock::Analog](/t/lib/Test/Observer/Clock/Analog.pm)
    * [Test::Observer::Clock::Digital](/t/lib/Test/Observer/Clock/Digital.pm)
  * [Test::Observer::Time](/t/lib/Test/Observer/Time.pm)
