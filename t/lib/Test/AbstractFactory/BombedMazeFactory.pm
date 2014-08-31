package Test::AbstractFactory::BombedMazeFactory;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

extends 'Test::AbstractFactory::MazeFactory';

sub make_room { my $self = shift; Test::AbstractFactory::BombedRoom->new( @_, factory => $self ) }
sub make_wall { my $self = shift; Test::AbstractFactory::BombedWall->new( @_, factory => $self ) }

1;
