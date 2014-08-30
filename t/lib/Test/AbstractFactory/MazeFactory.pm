package Test::AbstractFactory::MazeFactory;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

sub make_maze { my $self = shift; Test::AbstractFactory::Maze->new( @_, factory => $self ) }
sub make_door { my $self = shift; Test::AbstractFactory::Door->new( @_, factory => $self ) }
sub make_room { my $self = shift; Test::AbstractFactory::Room->new( @_, factory => $self ) }
sub make_wall { my $self = shift; Test::AbstractFactory::Wall->new( @_, factory => $self ) }

1;
