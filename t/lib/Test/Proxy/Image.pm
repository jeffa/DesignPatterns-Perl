package Test::Proxy::Image;
use Moose;
use MooseX::FollowPBP;

with 'Test::Proxy::Graphic';

sub BUILD { shift->load }
sub draw  { print join('x', @{ shift->get_extent }),"\n" }
sub load  { printf "loading '%s'\n", shift->get_filename }

1;
