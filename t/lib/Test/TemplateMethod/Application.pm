package Test::TemplateMethod::Application;
use Moose;
use Carp;
our $VERSION = '0.01';

use File::Basename;

extends 'OODP::AbstractClass';

has documents => ( is => 'rw', isa => 'ArrayRef', default => sub { [] } );

has extensions => (
    is      => 'ro',
    isa     => 'HashRef',
    default => sub {{
        '.json' => 'Test::TemplateMethod::JSONDocument', 
        '.txt'  => 'Test::TemplateMethod::TextDocument', 
        '.xml'  => 'Test::TemplateMethod::XMLDocument',
    }}
);

# quick-n-easy factory
sub do_create_document { shift->can_open_document( @_ )->new }

sub can_open_document { 
    my ($self, $fname) = @_;
    my %ext = %{ $self->get_extensions };
    my (undef, undef, $ext) = fileparse( $fname, keys %ext );
    return $ext{$ext};
}

sub open_document {
    my ($self, $fname) = @_;

    unless ( $self->can_open_document( $fname ) ) {
        carp "Cannot handle $fname";
        return;
    }

    my $doc = $self->do_create_document( $fname );
    if ($doc) {
        $doc->open( $fname );
        $doc->do_read;
        $doc->close;
    }

    push @{ $self->{documents} }, { $fname => $doc->get_content };
}

1;
