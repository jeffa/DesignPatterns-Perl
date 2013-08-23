package Test::Strategy::Document;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

with 'OODP::Context';

has data => ( is => 'ro', isa => 'ArrayRef', required => 1 );

sub print {
    my ($self) = @_;
    return $self->get_strategy->render( $self->get_data );
}

1;
