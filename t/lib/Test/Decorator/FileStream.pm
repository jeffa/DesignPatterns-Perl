package Test::Decorator::FileStream;
use Moose;
use Carp;
our $VERSION = '0.01';

use File::Temp qw( tempfile );

extends 'Test::Decorator::Stream';

has tmp_filename => ( is => 'rw', isa => 'Any', default => '' );

sub dump_buffer {
    my ($self) = @_;

    my ( $fh, $fname ) = tempfile( UNLINK => 0 );
    print $fh $self->{buffer} or croak "Cannot write to $fname";
    close $fh;

    $self->set_tmp_filename( $fname );
    $self->{buffer} = '';
}

sub DESTROY {
    my ($self) = @_;
    my $fname = $self->get_tmp_filename || '';
    if (-f $fname) {
        unlink $fname or carp "Cannot unlink $fname";
    }
}


1;
