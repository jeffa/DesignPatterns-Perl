package Test::Composite::PS3;
use Moose;
with 'Test::Composite::Device';

has '+power'          => ( default => 40 );
has '+net_price'      => ( default => 600 );
has '+discount_price' => ( default => 300 );

1;
