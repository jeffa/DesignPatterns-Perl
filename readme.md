Perl Design Patterns
====================


Installation
------------

Installation is not recommended, but the usual CPAN process works:

```
perl Makefile.PL
make
make test
make install
```

Instead of installing this package, downloading or cloning the repository
is recommended and then alert perl to the location of the modules:

```perl
use lib '/PATH/TO/DesignPatterns-Perl/lib';
use OODP::Composite;
# etc.
```


Site Map
========

There are a total of 23 Design Patterns grouped into 3 categories:

1. [Creational](/lib/OODP/TOC/Creational.pm)
Creational patterns abstract the instantiation process by encapsulating
which concrete classes are being created and used. The result should be
an application which has a more robust ability to work with classes
unknown at design time. 

  * [Abstract Factory](/lib/OODP/TOC/AbstractFactory.pm)
  * [Builder](/lib/OODP/TOC/Builder.pm)
  * [Factory Method](/lib/OODP/TOC/FactoryMethod.pm)
  * [Prototype](/lib/OODP/TOC/Prototype.pm)
  * [Singleton](/lib/OODP/TOC/Singleton.pm)

2. [Structural](/lib/OODP/TOC/Structural.pm)
Structural patterns abstract composition concerns by describing *how to*
compose rather than directly composing interfaces or implementations. The
result is an abilty to change composition decisions at run time as well as
being able to unify interfaces.

  * [Adapter](/lib/OODP/TOC/Adapter.pm)
  * [Bridge](/lib/OODP/TOC/Bridge.pm)
  * [Composite](/lib/OODP/TOC/Composite.pm)
  * [Decorator](/lib/OODP/TOC/Decorator.pm)
  * [Facade](/lib/OODP/TOC/Facade.pm)
  * [Flyweight](/lib/OODP/TOC/Flyweight.pm)
  * [Proxy](/lib/OODP/TOC/Proxy.pm)

3. [Behavorial](/lib/OODP/TOC/Behavorial.pm)
Behavorial patterns abstract control flow by encapsulating alogrithms and 
responsibities. The result is the ability to abstract complex and hard to
follow run time control flow away so that object interactivety takes focus.

  * [Chain of Responsibility](/lib/OODP/TOC/ChainOfResponsibility.pm)
  * [Command](/lib/OODP/TOC/Command.pm)
  * [Interpreter](/lib/OODP/TOC/Interpreter.pm)
  * [Iterator](/lib/OODP/TOC/Iterator.pm)
  * [Mediator](/lib/OODP/TOC/Mediator.pm)
  * [Memento](/lib/OODP/TOC/Memento.pm)
  * [Observer](/lib/OODP/TOC/Observer.pm)
  * [State](/lib/OODP/TOC/State.pm)
  * [Strategy](/lib/OODP/TOC/Strategy.pm)
  * [Template Method](/lib/OODP/TOC/TemplateMethod.pm)
  * [Visitor](/lib/OODP/TOC/Visitor.pm)


License and Copyright
---------------------

See [license.md](/license.md)
