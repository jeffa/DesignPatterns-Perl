package Test::Composite::Cabinet;
use Moose;
extends 'Test::Composite::Chassis';

has '+power'          => ( default => 1 );
has '+net_price'      => ( default => 50 );
has '+discount_price' => ( default => 40 );

1;
