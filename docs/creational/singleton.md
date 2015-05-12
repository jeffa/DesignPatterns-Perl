Singleton
=========
The Singleton pattern ensures one and only one instance with global access.
This is useful when there must be exactly one instance of a class and it must
be accessible to clients from a well-known point of access. Additionally,
clients can use an extended instance (subclass) without modifying their code.

Structure
---------
```
      +------------+
      | Singleton  |
      +------------+
      | instance() |
      |            |
      +------------+
```

Participants
------------
* [OODP::Singleton](/lib/OODP/Singleton.pm)

Tests
-----
* [/t/005-singleton.t](/t/005-singleton.t)
