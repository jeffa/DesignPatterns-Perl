#!perl -T
#------------------------------------------------------
package MyObject;
use Moose;
use MooseX::FollowPBP;
extends 'OODP::Singleton';

has foo => ( is => 'rw' );
has bar => ( is => 'rw' );

#------------------------------------------------------
package MyOtherObject;
use Moose;
use MooseX::FollowPBP;
extends 'OODP::Singleton';

has baz => ( is => 'rw' );
has qux => ( is => 'rw' );

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 12;

use_ok 'OODP::Singleton';

my $obj1 = MyObject->get_instance( foo => 1, bar => 2 );
isa_ok $obj1, 'OODP::Singleton';
is $obj1->get_foo, 1,       "correct foo attr";
is $obj1->get_bar, 2,       "correct bar attr";

my $obj2 = MyObject->get_instance( foo => 3, bar => 4 );
isa_ok $obj2, 'OODP::Singleton';
is $obj1, $obj2, "objects are the same";
is $obj1->get_foo, 1,       "same foo attr";
is $obj1->get_bar, 2,       "same bar attr";

my $obj3 = MyOtherObject->get_instance( baz => 5, qux => 6 );
isa_ok $obj3, 'MyOtherObject';
is $obj3->get_baz, 5,       "correct baz attr";
is $obj3->get_qux, 6,       "correct qux attr";
isnt $obj1, $obj3, "objects are not the same";
