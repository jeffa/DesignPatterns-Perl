package Test::Decorator::Stream;
use Moose;
use Carp;
our $VERSION = '0.01';

extends 'OODP::Component';

has buffer => ( is => 'ro', isa => 'Str', default => '', reader => 'output' );
has limit  => ( is => 'rw', isa => 'Int', default => 256 );

sub append      { $_[0]->{buffer} .= $_[1]; $_[0]->dump_buffer if $_[0]->buffer_full }
sub buffer_size { length( $_[0]->output ) }
sub buffer_full { $_[0]->buffer_size > $_[0]->get_limit }
sub dump_buffer { croak "Subclass must implement dump_buffer()" }

1;
