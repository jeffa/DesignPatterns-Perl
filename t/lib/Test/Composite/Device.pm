package Test::Composite::Device;
use Moose::Role;
use MooseX::FollowPBP;
with 'OODP::Leaf';

has power           => ( is => 'ro', isa => 'Int' );
has net_price       => ( is => 'ro', isa => 'Int' );
has discount_price  => ( is => 'ro', isa => 'Int' );


1;
