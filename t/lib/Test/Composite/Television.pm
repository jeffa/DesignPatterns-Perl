package Test::Composite::Television;
use Moose;
with 'Test::Composite::Device';

has '+power'          => ( default => 80 );
has '+net_price'      => ( default => 1600 );
has '+discount_price' => ( default => 1300 );

1;
