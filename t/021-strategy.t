#!perl -T
#------------------------------------------------------
package MyContext;
use Moose;
with 'OODP::Context';

#------------------------------------------------------
package MyStrategy;
use Moose;
with 'OODP::ConcreteStrategy';

#------------------------------------------------------
package MyStrategy1;
use Moose;
extends 'MyStrategy';

#------------------------------------------------------
package MyStrategy2;
use Moose;
extends 'MyStrategy';

#------------------------------------------------------
package MyStrategy3;
use Moose;
extends 'MyStrategy';

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 7;

use_ok( 'OODP::Context' )           || print "Bail out!\n";
use_ok( 'OODP::Strategy' )          || print "Bail out!\n";
use_ok( 'OODP::ConcreteStrategy' )  || print "Bail out!\n";

my @strategies = (
    MyStrategy1->new,
    MyStrategy2->new,
    MyStrategy3->new,
);

isa_ok $_, 'MyStrategy' for @strategies;

my $context = MyContext->new( strategy => $strategies[0] );
isa_ok $context, 'MyContext';



