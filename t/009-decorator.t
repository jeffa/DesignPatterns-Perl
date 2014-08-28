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
sub draw { sprintf '<scroll position="%d">%s</scroll>', $_[0]->position, $_[0]->get_component->draw }

#------------------------------------------------------
# add responsibilities to the component
package BorderDecorator;
use Moose;
extends 'ConcreteDecorator';
has width => ( is => 'rw', isa => 'Int', default => 1 );
sub draw { sprintf '<border width="%d">%s</border>', $_[0]->get_width, $_[0]->get_component->draw }


#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 10;

use_ok( 'OODP::Component' );
use_ok( 'OODP::Decorator' );

my $text_view = TextView->new( name => 'TV1', text => 'Hello World' );
is $text_view->draw, 'Hello World', "correct text";
$text_view->resize( 5 );
is $text_view->size, 5, "correct resize";

my $scroll_view = ScrollDecorator->new( name => 'SD1', component => $text_view, position => 5 );
is $scroll_view->draw, '<scroll position="5">Hello World</scroll>', "correct text";
$scroll_view->resize( 7 );
is $text_view->size, 7, "correct resize";

my $border_view = BorderDecorator->new( name => 'BD1', component => $text_view, width => 10 );
is $border_view->draw, '<border width="10">Hello World</border>', "correct text";
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
is $combo_view->draw, '<border width="1"><scroll position="1">DECORATOR</scroll></border>', "correct text";
$border_view->resize( 6 );
is $text_view->size, 6, "correct resize";
