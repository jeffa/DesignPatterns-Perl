package Test::Proxy::Graphic;
use Moose::Role;
use MooseX::FollowPBP;

requires qw( draw load );

has filename    => ( is => 'rw' );
has width       => ( is => 'rw', isa => 'Int' );
has height      => ( is => 'rw', isa => 'Int' );

sub get_extent  { [ $_[0]->get_width, $_[0]->get_height ] }

1;
