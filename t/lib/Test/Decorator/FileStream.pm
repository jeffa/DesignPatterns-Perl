package Test::Decorator::FileStream;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

use File::Temp qw( tempfile );

extends 'Test::Decorator::Stream';

sub dump_buffer {
    my ($self) = @_;

    my ($fh,$fname) = File::Temp->new( UNLINK => 0, SUFFIX => '.test' );
    warn "buffer dumper to $fname\n";
    print $fh $self->get_buffer or croak "Cannot write to $fname";
    close $fh;

    $self->set_buffer( '' );
}


1;
