package Test::AbstractFactory::Room;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

extends 'Test::AbstractFactory::MapSite';

has sides  => ( is => 'ro', isa => 'ArrayRef' );
has number => ( is => 'ro', isa => 'Str', required => 1 );

has '+factory' => ( required => 1 );

my %SIDE; @SIDE{qw(north south east west )} = 0 .. 3;

sub BUILD {
    my $self = shift;
    $self->{sides} = [ map $self->get_factory->make_wall, 0..3 ];
}

sub enter {
    my ($self,$side) = @_;
    $self->get_side( $side )->enter;
}

sub set_side {
    my ($self,$side,$obj) = @_;
    $self->{sides}->[ $SIDE{$side} ] = $obj;
}

sub get_side {
    my ($self,$side) = @_;
    return $self->get_sides->[ $SIDE{$side} ];
}


1;
