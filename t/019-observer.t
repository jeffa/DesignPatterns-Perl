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

plan tests => 6;

use_ok( 'OODP::Observer' )          || print "Bail out!\n";
use_ok( 'OODP::Subject' )           || print "Bail out!\n";
use_ok( 'OODP::ConcreteObserver' )  || print "Bail out!\n";
use_ok( 'OODP::ConcreteSubject' )   || print "Bail out!\n";

my $observer = MyObserver->new();
isa_ok $observer, 'MyObserver';

my $subject = MySubject->new();
isa_ok $subject, 'MySubject';
