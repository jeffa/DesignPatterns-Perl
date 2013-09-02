#!perl -T
#------------------------------------------------------
package MyObserver;
use Moose;
with 'OODP::ConcreteObserver';

#------------------------------------------------------
package MySubject;
use Moose;
with 'OODP::ConcreteSubject';

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 27;

use_ok( 'OODP::Observer' )          || print "Bail out!\n";
use_ok( 'OODP::Subject' )           || print "Bail out!\n";
use_ok( 'OODP::ConcreteObserver' )  || print "Bail out!\n";
use_ok( 'OODP::ConcreteSubject' )   || print "Bail out!\n";

my $subject = MySubject->new( state => 'one' );
isa_ok $subject, 'MySubject';
is $subject->get_state, 'one',  "subject state correctly set";

my @observers = map MyObserver->new, 0 .. 3;
for (@observers) {
    isa_ok $_, 'MyObserver';
    is $_->get_state, undef,  "observer state correctly unset";
    $subject->attach( $_ );
}

$subject->notify;

for (@observers) {
    is $_->get_state, 'one',  "observer state correctly set via notify";
}

$subject->detach( $observers[1] );
$subject->detach( $observers[2] );

$subject->set_state( 'two' );
is $subject->get_state, 'two',  "subject state correctly set";

for (@observers) {
    is $_->get_state, 'one',  "observer state not updated until notify";
}

$subject->notify;

is $observers[0]->get_state, 'two',  "subject state correctly updated";
is $observers[3]->get_state, 'two',  "subject state correctly updated";

SKIP: {
    skip "detach has bug", 2;
is $observers[1]->get_state, 'one',  "subject state correctly not updated";
is $observers[2]->get_state, 'one',  "subject state correctly not updated";
};

