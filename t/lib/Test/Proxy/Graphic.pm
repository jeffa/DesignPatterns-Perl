package Test::Proxy::Graphic;
use Moose::Role;
use MooseX::FollowPBP;

requires qw( draw load get_extent );

has filename    => ( is => 'rw' );
has width       => ( is => 'rw', isa => 'Int' );
has height      => ( is => 'rw', isa => 'Int' );

1;
