package Test::Strategy::Document;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

extends 'OODP::Context';

has data => ( is => 'ro', isa => 'ArrayRef', required => 1 );

sub context {
    my ($self) = @_;
    return $self->get_strategy->algorithm( $self->get_data );
}

1;
