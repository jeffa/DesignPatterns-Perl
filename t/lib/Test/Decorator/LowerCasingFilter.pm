package Test::Decorator::LowerCasingFilter;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

use Compress::Zlib;

extends 'Test::Decorator::StreamDecorator';

sub output { lc( $_[0]->get_component->output ) }

1;
