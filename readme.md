Perl Design Patterns
====================

Installation
------------
Installation is not recommended, but the usual
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

Documentation
-------------
See [docs/readme.md](/docs/readme.md)

License and Copyright
---------------------
See [License.md](/License.md)
