package Test::Decorator::UpperCasingFilter;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

use Compress::Zlib;

extends 'Test::Decorator::StreamDecorator';

sub output { uc( $_[0]->get_component->output ) }

1;
