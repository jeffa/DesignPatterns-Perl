#!perl -T
#------------------------------------------------------
# defines abstract primitive operations and implements template method
package MyAbstractClass;
use Moose;
extends 'OODP::AbstractClass';
has result => ( is => 'rw', isa => 'Any', default => '' );
sub operation1 { $_[0]->{result} .= 'one-' }
sub operation2 { die }
sub operation3 { $_[0]->{result} .= 'three-' }
sub operation4 { die }
sub operation5 { chop $_[0]->{result} }
sub template_method {
    my $self = shift;
    $self->operation3;
    $self->operation1;
    $self->operation4;
    $self->operation2;
    $self->operation5;
}

#------------------------------------------------------
# implements primitive operations
package MyConcreteClass1;
use Moose;
extends 'MyAbstractClass';
sub operation2 { $_[0]->{result} .= 'two-' }
sub operation4 { $_[0]->{result} .= 'four-' }

#------------------------------------------------------
# implements primitive operations
package MyConcreteClass2;
use Moose;
extends 'MyAbstractClass';
sub operation1 { $_[0]->{result} .= 'foo-' }
sub operation2 { $_[0]->{result} .= 'bar-' }
sub operation3 { $_[0]->{result} .= 'baz-' }
sub operation4 { $_[0]->{result} .= 'qux-' }

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 7;

use_ok( 'OODP::AbstractClass' );

my $class1 = new_ok 'MyConcreteClass1';
is $class1->get_result, '',                     "no results for class 1";
$class1->template_method;
is $class1->get_result, 'three-one-four-two',   "correct results for class 1";

my $class2 = new_ok 'MyConcreteClass2';
is $class2->get_result, '',                     "no results for class 2";
$class2->template_method;
is $class2->get_result, 'baz-foo-qux-bar',      "correct results for class 2";
