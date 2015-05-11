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
* [OODP::Proxy](/lib/OODP/Proxy.pm)
* Your::Subjects
* Your::ConcreteProxies

Tests
-----
* [/t/012-proxy.t](/t/012-proxy.t)
* [/t/112-proxy.t](/t/112-proxy.t)
  * [Test::Proxy::Graphic](/t/lib/Test/Proxy/Cabinet.pm)
  * [Test::Proxy::Proxy](/t/lib/Test/Proxy/Proxy.pm)
  * [Test::Proxy::Image](/t/lib/Test/Proxy/Image.pm)
