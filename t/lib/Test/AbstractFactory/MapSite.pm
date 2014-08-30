package Test::AbstractFactory::MapSite;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

sub enter { croak "Subclass must implement enter()" }

has factory => ( is => 'ro', isa => 'Test::AbstractFactory::MazeFactory' );

1;
