#!perl -T
#------------------------------------------------------
# defines object to which additional responsibilities can be attached
package TextView;
use Moose;
extends 'OODP::Component';
has text => ( is => 'rw', isa => 'Str', reader => 'draw' );
has size => ( is => 'rw', isa => 'Int', default => 1, writer => 'resize' );

#------------------------------------------------------
# add responsibilities to the component
package ConcreteDecorator;
use Moose;
extends 'OODP::Decorator';
sub draw    { $_[0]->get_component->draw }
sub resize  { $_[0]->get_component->resize( $_[1] ) }

#------------------------------------------------------
# add responsibilities to the component
package ScrollDecorator;
use Moose;
extends 'ConcreteDecorator';
has position => ( is => 'rw', isa => 'Int', default => 1, writer => 'scroll_to' );
sub draw    { '<scroll>' . $_[0]->get_component->draw . '</scroll>' }

#------------------------------------------------------
# add responsibilities to the component
package BorderDecorator;
use Moose;
extends 'ConcreteDecorator';
has width => ( is => 'rw', isa => 'Int', default => 1 );
sub draw    { '<border>' . $_[0]->get_component->draw . '</border>' }


#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 9;

use_ok( 'OODP::Component' );
use_ok( 'OODP::Decorator' );

my $text_view = TextView->new( name => 'TV1', text => 'Hello World' );
is $text_view->draw, 'Hello World', "correct text";
$text_view->resize( 5 );
is $text_view->size, 5, "correct resize";

my $scroll_view = ScrollDecorator->new( name => 'SD1', component => $text_view );
is $scroll_view->draw, '<scroll>Hello World</scroll>', "correct text";
$scroll_view->resize( 7 );
is $text_view->size, 7, "correct resize";

my $border_view = BorderDecorator->new( name => 'BD1', component => $text_view );
is $border_view->draw, '<border>Hello World</border>', "correct text";
$border_view->resize( 42 );
is $text_view->size, 42, "correct resize";

my $combo_view = BorderDecorator->new(
    name => 'BD2',
    component => ScrollDecorator->new(
        name => 'SD2',
        component => TextView->new(
            name => 'BD2',
            text => 'DECORATOR',
        ),
    ),
);
is $combo_view->draw, '<border><scroll>DECORATOR</scroll></border>', "correct text";



__DATA__
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

use_ok( 'OODP::Component' )     || print "Bail out!\n";
use_ok( 'OODP::Composite' )     || print "Bail out!\n";
use_ok( 'OODP::Leaf' )          || print "Bail out!\n";

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
