package Test::AbstractFactory::Door;
use Moose;
use MooseX::FollowPBP;
use Moose::Util::TypeConstraints;
use Carp;
our $VERSION = '0.01';

extends 'Test::AbstractFactory::MapSite';

has room1 => ( is => 'rw', isa => 'Test::AbstractFactory::MapSite', required => 1 );
has room2 => ( is => 'rw', isa => 'Test::AbstractFactory::MapSite', required => 1 );
has state => ( is => 'rw', isa => enum([qw( closed open )]), default => 'closed' );

sub open    { shift->set_state( 'open' ) }
sub close   { shift->set_state( 'closed' ) }
sub is_open { shift->get_state eq 'open' }
sub enter   { shift->is_open }

my %FLIP = ( north => 'south', south => 'north', east => 'west', west => 'east' );

sub connect_2to1 {
    my ($self,$side) = @_;
    $self->get_room2->set_side( $FLIP{$side}, $self );
}


1;
