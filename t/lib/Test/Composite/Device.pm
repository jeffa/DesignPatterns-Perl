package Test::Composite::Device;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

extends 'OODP::Leaf';

has power           => ( is => 'ro', isa => 'Int' );
has net_price       => ( is => 'ro', isa => 'Int' );
has discount_price  => ( is => 'ro', isa => 'Int' );


1;
