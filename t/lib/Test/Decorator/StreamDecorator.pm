package Test::Decorator::StreamDecorator;
use Moose;
#use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

extends 'OODP::Decorator';

has stream => ( is => 'rw', isa => 'OODP::Component' );

sub output      { croak "Subclass must implement output()" }
sub append      { shift->get_stream->append( @_ ) }
sub buffer_size { shift->get_stream->buffer_size( @_ ) }
sub buffer_full { shift->get_stream->buffer_full( @_ ) }
sub dump_buffer { shift->get_stream->dump_buffer( @_ ) }

1;
