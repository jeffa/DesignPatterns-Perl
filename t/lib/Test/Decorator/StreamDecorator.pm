package Test::Decorator::StreamDecorator;
use Moose;
#use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

extends 'OODP::Decorator';

sub output      { croak "Subclass must implement output()" }
sub append      { shift->get_component->append( @_ ) }
sub buffer_size { shift->get_component->buffer_size( @_ ) }
sub buffer_full { shift->get_component->buffer_full( @_ ) }
sub dump_buffer { shift->get_component->dump_buffer( @_ ) }

1;
