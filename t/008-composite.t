#!perl -T
#------------------------------------------------------
package MyComposite;
use Moose;
extends 'OODP::Composite';
sub render {
    my ($self) = @_;
    my %children = %{ $self->get_children };
    return join '/', $self->get_name, map $children{$_}->render, sort keys %children;
}

#------------------------------------------------------
package MyLeaf;
use Moose;
extends 'OODP::Leaf';
sub render { $_[0]->get_name }

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 16;

use_ok 'OODP::Component';
use_ok 'OODP::Composite';
use_ok 'OODP::Leaf';

my $comp = MyComposite->new( name => 'Foo' );
isa_ok $comp, 'MyComposite';
is $comp->render, $comp->get_name, "render Foo success";

my $leaf = MyLeaf->new( name => 'Foo/Bar' );
isa_ok $leaf, 'MyLeaf';
is $comp->render, $comp->get_name, "render Foo/Bar success";

$comp->add( $leaf );
is_deeply [ sort map $_->get_name, values %{ $comp->get_children } ], [qw( Foo/Bar )], "add one leaf";
is $comp->render, 'Foo/Foo/Bar', "render Foo success";

$comp->add( MyComposite->new( name => 'Foo/Baz' ) );
is_deeply [ sort map $_->get_name, values %{ $comp->get_children } ], [qw( Foo/Bar Foo/Baz )], "add one composite";
is $comp->render, 'Foo/Foo/Bar/Foo/Baz', "render Foo success";

my $child = $comp->get_child( 'Foo/Baz' );
isa_ok $child, 'MyComposite';
is $child->get_name, 'Foo/Baz', "retrieved correct child";
is $child->render, 'Foo/Baz', "render Foo/Baz success";

$child->add( $_ ) for map MyLeaf->new( name => $_ ), qw( Foo/Baz/foo Foo/Baz/bar Foo/Baz/baz );
is $child->render, 'Foo/Baz/Foo/Baz/bar/Foo/Baz/baz/Foo/Baz/foo', "render Foo/Baz success";
is $comp->render, 'Foo/Foo/Bar/Foo/Baz/Foo/Baz/bar/Foo/Baz/baz/Foo/Baz/foo', "render Foo success";
