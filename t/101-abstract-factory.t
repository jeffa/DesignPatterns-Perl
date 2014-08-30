#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
plan tests => 14;

use lib 't/lib';
use_ok $_ for qw(
    Test::AbstractFactory::Maze
    Test::AbstractFactory::MapSite
    Test::AbstractFactory::Door
    Test::AbstractFactory::Room
    Test::AbstractFactory::Wall
);

new_ok 'Test::AbstractFactory::Wall';
new_ok 'Test::AbstractFactory::Room' => [qw( number A1 )];
new_ok 'Test::AbstractFactory::Door' => [
    room1 => Test::AbstractFactory::Room->new( number => 1 ),
    room2 => Test::AbstractFactory::Room->new( number => 2 ),
];

#my $room1 = Test::AbstractFactory::Room->new( number => 1 );
#my $room2 = Test::AbstractFactory::Room->new( number => 2 );
#my $door1 = Test::AbstractFactory::Door->new(
#    room1 => $room1,
#    room2 => $room2,
#);
#$room1->set_side( east => $door1 );
#$door1->connect_2to1( 'east' );

my $maze = new_ok 'Test::AbstractFactory::Maze' => [qw( width 5 )];
is $maze->get_width, 5,     "correct width (custom)";
is $maze->get_height, 3,    "correct height (default)";
is $maze->grid_size, 0,     "correct grid size before adding rooms";

$maze->add_room for 1 .. 5*3;
is $maze->grid_size, 5*3,   "correct grid size after adding rooms";

is_deeply 
    [ map $_->get_number, @{ $maze->get_grid } ],
    [qw( A0 A1 A2 A3 A4 B0 B1 B2 B3 B4 C0 C1 C2 C3 C4 )],
    "correct room ordering"
;
