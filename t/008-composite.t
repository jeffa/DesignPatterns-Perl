#!perl -T
#------------------------------------------------------
package MyComposite;
use Moose;
with 'OODP::Composite';
has buffer => ( is => 'rw', isa => 'ArrayRef', default => sub { [] } );
sub log {
    my ($self) = @_;
    my $buffer = $self->buffer;
    my %children = %{ $self->get_children };
    push @{$buffer}, map $children{$_}->log, sort keys %children;
    $self->buffer( $buffer );
    return $self->get_name;
}

#------------------------------------------------------
package MyLeaf;
use Moose;
with 'OODP::Leaf';
sub log { $_[0]->get_name }

#======================================================
package main;
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 23;

use_ok( 'OODP::Component' )     || print "Bail out!\n";
use_ok( 'OODP::Composite' )     || print "Bail out!\n";
use_ok( 'OODP::Leaf' )          || print "Bail out!\n";

my $comp = MyComposite->new( name => 'Foo' );
isa_ok $comp, 'MyComposite';
is $comp->log, $comp->get_name, "log Foo success";
is_deeply $comp->buffer, [], "Foo buffer empty";

my $leaf = MyLeaf->new( name => 'Foo/Bar' );
isa_ok $leaf, 'MyLeaf';
is $comp->log, $comp->get_name, "log Foo/Bar success";

$comp->add( $leaf );
is_deeply [ sort map $_->get_name, values %{ $comp->get_children } ], [qw( Foo/Bar )], "add one leaf";
is $comp->log, $comp->get_name, "log Foo success";
is_deeply $comp->buffer, [qw( Foo/Bar )], "Foo buffer contains 1 entry";

$comp->add( MyComposite->new( name => 'Foo/Baz' ) );
is_deeply [ sort map $_->get_name, values %{ $comp->get_children } ], [qw( Foo/Bar Foo/Baz )], "add one composite";
is $comp->log, $comp->get_name, "log Foo success";
is_deeply $comp->buffer, [qw( Foo/Bar Foo/Bar Foo/Baz )], "Foo buffer contains 3 entries";

my $child = $comp->get_child( 'Foo/Baz' );
isa_ok $child, 'MyComposite';
is $child->get_name, 'Foo/Baz', "retrieved correct child";
is $child->log, $child->get_name, "log Foo/Baz success";

$child->add( $_ ) for map MyLeaf->new( name => $_ ), qw( Foo/Baz/foo Foo/Baz/bar Foo/Baz/baz );
is_deeply [ sort map $_->get_name, values %{ $child->get_children } ], [qw( Foo/Baz/bar Foo/Baz/baz Foo/Baz/foo )], "add many leaves";
is_deeply $child->buffer, [], "Foo buffer is still empty";
is $child->log, $child->get_name, "log Foo/Baz success";
is_deeply $child->buffer, [qw( Foo/Baz/bar Foo/Baz/baz Foo/Baz/foo )], "Foo/Baz buffer contains 3 entries";

is $comp->log, $comp->get_name, "log Foo success";
is_deeply $comp->buffer, [qw( Foo/Bar Foo/Bar Foo/Baz Foo/Bar Foo/Baz )], "Foo buffer contains 3 entries";
