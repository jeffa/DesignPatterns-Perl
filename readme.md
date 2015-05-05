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

```
use lib '/PATH/TO/DesignPatterns-Perl/lib';
use OODP::Composite;
# etc.
```

Documentation
-------------

See [OODP::TOC](/lib/OODP/TOC.pm)

License and Copyright
---------------------

See [license.md](/license.md)
