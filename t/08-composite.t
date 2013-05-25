#!perl -T
package MyComposite;
use Moose;
with 'OODP::Composite';

package MyLeaf;
use Moose;
with 'OODP::Leaf';

package main;
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 10;

use_ok( 'OODP::Component' )     || print "Bail out!\n";
use_ok( 'OODP::Composite' )     || print "Bail out!\n";
use_ok( 'OODP::Leaf' )          || print "Bail out!\n";

my $comp = MyComposite->new( name => 'Foo' );
isa_ok $comp, 'MyComposite';

my $leaf = MyLeaf->new( name => 'Foo/Bar' );
isa_ok $leaf, 'MyLeaf';

$comp->add( $leaf );
is_deeply [ sort map $_->get_name, values %{ $comp->children } ], [qw( Foo/Bar )], "add one leaf";

$comp->add( MyComposite->new( name => 'Foo/Baz' ) );
is_deeply [ sort map $_->get_name, values %{ $comp->children } ], [qw( Foo/Bar Foo/Baz )], "add one composite";

my $child = $comp->get_child( 'Foo/Baz' );
isa_ok $child, 'MyComposite';
is $child->get_name, 'Foo/Baz', "retrieved correct child";

$child->add( $_ ) for map MyLeaf->new( name => $_ ), qw( Foo/Baz/foo Foo/Baz/bar Foo/Baz/baz );
is_deeply [ sort map $_->get_name, values %{ $child->children } ], [qw( Foo/Baz/bar Foo/Baz/baz Foo/Baz/foo )], "add many leaves";

