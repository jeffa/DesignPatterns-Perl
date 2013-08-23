#!perl -T
#------------------------------------------------------
package MyContext;
use Moose;
with 'OODP::Context';
sub algorithm {
    my ($self) = @_;
    return $self->get_strategy->get_data;
}

#------------------------------------------------------
package MyStrategy;
use Moose;
use MooseX::FollowPBP;
with 'OODP::ConcreteStrategy';
has data => ( is => 'ro', isa => 'Str' );

#------------------------------------------------------
package MyStrategy1;
use Moose;
extends 'MyStrategy';
has '+data' => ( default => 'One' );

#------------------------------------------------------
package MyStrategy2;
use Moose;
extends 'MyStrategy';
has '+data' => ( default => 'Two' );

#------------------------------------------------------
package MyStrategy3;
use Moose;
extends 'MyStrategy';
has '+data' => ( default => 'Three' );

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 15;

use_ok( 'OODP::Context' )           || print "Bail out!\n";
use_ok( 'OODP::Strategy' )          || print "Bail out!\n";
use_ok( 'OODP::ConcreteStrategy' )  || print "Bail out!\n";

my @strategies = (
    MyStrategy1->new,
    MyStrategy2->new,
    MyStrategy3->new,
);
isa_ok $_, 'MyStrategy' for @strategies;

my @contexts = map MyContext->new( strategy => $_ ), @strategies;
isa_ok $_, 'MyContext' for @contexts;

isa_ok $contexts[0]->get_strategy, 'MyStrategy1';
isa_ok $contexts[1]->get_strategy, 'MyStrategy2';
isa_ok $contexts[2]->get_strategy, 'MyStrategy3';

is $contexts[0]->algorithm, 'One';
is $contexts[1]->algorithm, 'Two';
is $contexts[2]->algorithm, 'Three';
