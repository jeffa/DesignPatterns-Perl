package Test::Composite::Chassis;
use Moose::Role;
use MooseX::FollowPBP;
our $VERSION = '0.01';

with 'OODP::Composite';

has power          => ( is => 'ro', isa => 'Int' );
has net_price      => ( is => 'ro', isa => 'Int' );
has discount_price => ( is => 'ro', isa => 'Int' );


1;
