Perl Design Patterns
====================

This is my personal study of the Object Oriented patterns described
in "Design Patterns," by Gamma, Helm, Johnson and Vlissides.

These are not (necessarily) ready for public consumption. A handful of
these classes are merely package placeholders.

Documentation
-------------
See [docs/readme.md](/docs/readme.md)

Installation
------------
Installation is not recommended, but the classic
[CPAN process](http://perldoc.perl.org/ExtUtils/MakeMaker.html#Default-Makefile-Behaviour) works:
* perl Makefile.PL
* make
* make test
* ~~make install~~ :skull:

Instead of installing this package, downloading or cloning the repository
is recommended and then alert perl to the location of the modules:

```perl
use lib '/PATH/TO/DesignPatterns-Perl/lib';
use OODP::Composite;
# etc.
```

:warning: Just in case we did not mention this, do not install this package. :warning:

License and Copyright
---------------------
See [License.md](/License.md)
