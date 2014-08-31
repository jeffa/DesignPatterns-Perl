package Test::AbstractFactory::EnchantedMazeFactory;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

extends 'Test::AbstractFactory::MazeFactory';

sub make_door { my $self = shift; Test::AbstractFactory::EnchantedDoor->new( @_, factory => $self ) }
sub make_room { my $self = shift; Test::AbstractFactory::EnchantedRoom->new( @_, factory => $self ) }

1;
