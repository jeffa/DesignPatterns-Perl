package Test::Composite::Cabinet;
use Moose;
with 'Test::Composite::Chassis';

has '+power'          => ( default => 1 );
has '+net_price'      => ( default => 50 );
has '+discount_price' => ( default => 40 );

# TODO: replace children with OODP::Iterator
#has children => ( is => 'rw', isa => 'HashRef', default => sub { {} } );

1;
