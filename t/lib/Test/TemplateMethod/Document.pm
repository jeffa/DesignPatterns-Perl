package Test::TemplateMethod::Document;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

use IO::File;

has fh => ( is => 'rw', isa => 'IO::File' );
has content => ( is => 'rw', isa => 'Any' );

sub open    { $_[0]->set_fh( IO::File->new( $_[1], 'r' ) ) }
sub do_read { croak }
sub close   { shift->get_fh->close }


1;
