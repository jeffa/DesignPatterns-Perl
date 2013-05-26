package Test::Composite::Chassis;
use Moose::Role;
use MooseX::FollowPBP;
our $VERSION = '0.01';

with 'OODP::Composite';
use List::Util;

has power          => ( is => 'ro', isa => 'Int' );
has net_price      => ( is => 'ro', isa => 'Int' );
has discount_price => ( is => 'ro', isa => 'Int' );

sub get_total_net_price {
    my ($self) = @_;
    return List::Util::sum( map $_->get_net_price, values %{ $self->get_children } );
}


1;
