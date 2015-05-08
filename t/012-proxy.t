#!perl -T
#------------------------------------------------------
package Subject;
use Moose::Role;
requires qw( fast_action );
has attr => ( is => 'rw', isa => 'Any' );

#------------------------------------------------------
package RealSubject;
use Moose;
use Data::Dumper;
with 'Subject';
sub BUILD { shift->slow_action }
sub fast_action { printf "%s fast action\n", shift->attr }
sub slow_action { printf "%s slow action\n", shift->attr }

#------------------------------------------------------
package Proxy;
use Moose;
use MooseX::FollowPBP;
with 'Subject';
has real_subject => ( is => 'rw', isa => 'RealSubject' );
sub fast_action {
    my $self = shift;
    unless ($self->get_real_subject) {
        $self->set_real_subject(
            RealSubject->new( attr => $self->attr )
        );
    }
    $self->get_real_subject->fast_action;
}

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Capture::Tiny 'capture';
use Test::More;
use Test::Exception;

plan tests => 4;

use_ok 'OODP::Proxy';

my $foo = new_ok Proxy => [ attr => 'foo' ];
my $bar = new_ok Proxy => [ attr => 'bar' ];

my ($stdout) = capture {
    $foo->fast_action;
    $foo->fast_action;
    $foo->fast_action;
    $bar->fast_action;
    $bar->fast_action;
    $bar->fast_action;
};

is $stdout, 
    "foo slow action\n" . "foo fast action\n" x 3
  . "bar slow action\n" . "bar fast action\n" x 3
, 'correct STDOUT';
