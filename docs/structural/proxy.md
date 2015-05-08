Proxy
=====
The Proxy pattern provides a surrogate or placeholder for another
object to control access to it. This is useful when there is a
need for a more versatile or sophisticated reference to an object
than a simple pointer.

Structure
---------
```
   +--------+         +----------+
   | Client |-------->| Subject  |
   +--------+         +----------+
                      |Request() |
                      +----------+
                           ^
                           |
        +------------------^-----. . . . . . .
        |                  |
+-------+-------+     +----+-------+
|ConcreteSubject|     |  Proxy     |
+---------------+     +------------+    +--------------------------+
|Request()      |     |Request() *------|concretesubject->Request()|
+---------------+     +------------+    +--------------------------+
```

Participants
------------
* OODP::Proxy
* Your::Subjects
* Your::ConcreteProxies
