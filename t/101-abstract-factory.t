#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
plan tests => 24;

use lib 't/lib';
use_ok $_ for qw(
    Test::AbstractFactory::Maze
    Test::AbstractFactory::MapSite

    Test::AbstractFactory::MazeFactory
    Test::AbstractFactory::Door
    Test::AbstractFactory::Room
    Test::AbstractFactory::Wall

    Test::AbstractFactory::EnchantedMazeFactory
    Test::AbstractFactory::EnchantedDoor
    Test::AbstractFactory::EnchantedRoom

    Test::AbstractFactory::BombedMazeFactory
    Test::AbstractFactory::BombedRoom
    Test::AbstractFactory::BombedWall
);

my $factory  = new_ok 'Test::AbstractFactory::MazeFactory';
my $efactory = new_ok 'Test::AbstractFactory::EnchantedMazeFactory';
my $bfactory = new_ok 'Test::AbstractFactory::BombedMazeFactory';

new_ok 'Test::AbstractFactory::Wall';
new_ok 'Test::AbstractFactory::Room' => [ number => 'A1', factory => $factory ];
new_ok 'Test::AbstractFactory::Door' => [
    room1 => Test::AbstractFactory::Room->new( number => 1, factory => $factory ),
    room2 => Test::AbstractFactory::Room->new( number => 2, factory => $factory ),
];

my $maze = $factory->make_maze( width => 5 );
is $maze->get_width, 5,     "correct width (custom)";
is $maze->get_height, 3,    "correct height (default)";
is $maze->grid_size, 0,     "correct grid size before adding rooms";

$maze->add_room( $factory )  for 1 .. 5;
$maze->add_room( $efactory ) for 1 .. 5;
$maze->add_room( $bfactory ) for 1 .. 5;
is $maze->grid_size, 5*3,   "correct grid size after adding rooms";

is_deeply 
    [ map $_->get_number, @{ $maze->get_grid } ],
    [qw(
        A0 A1 A2 A3 A4
        B0 B1 B2 B3 B4
        C0 C1 C2 C3 C4
    )],
    "correct room ordering"
;

#A0 <=> A1 <=> A2 <=> B2 <=> B3 <=> C3 <=> C4
add_door( $factory, $maze->get_room( 'A0' ), 'east',  $maze->get_room( 'A1' ) );
add_door( $factory, $maze->get_room( 'A1' ), 'east',  $maze->get_room( 'A2' ) );
add_door( $factory, $maze->get_room( 'A2' ), 'south', $maze->get_room( 'B2' ) );
add_door( $factory, $maze->get_room( 'B2' ), 'east',  $maze->get_room( 'B3' ) );
add_door( $factory, $maze->get_room( 'B3' ), 'south', $maze->get_room( 'C3' ) );
add_door( $factory, $maze->get_room( 'C3' ), 'east',  $maze->get_room( 'C4' ) );

# east = 2, south = 1
is $maze->get_room( 'A0' )
    ->get_sides->[ 2 ]{room2}
    ->get_sides->[ 2 ]{room2}
    ->get_sides->[ 1 ]{room2}
    ->get_sides->[ 2 ]{room2}
    ->get_sides->[ 1 ]{room2}
    ->get_sides->[ 2 ]{room2}->get_number, 'C4', "walked maze to end successfully"
;

sub add_door {
    my ($factory, $r1, $side, $r2) = @_;
    my $door = $factory->make_door( room1 => $r1, room2 => $r2 );
    $r1->set_side( $side => $door );
    $door->connect_2to1( $side );
}
