package Test::Proxy::Proxy;
use Moose;
use MooseX::FollowPBP;

with 'Test::Proxy::Graphic';

has image => ( is => 'rw', isa => 'Test::Proxy::Image' );

sub draw {
    my $self = shift;
    $self->load unless $self->get_image;
    $self->get_image->draw;
}

sub load {
    my $self = shift;
    unless ($self->get_image) {
        if ($self->get_filename =~ /^http/) {
            $self->set_image( Test::Proxy::WebImage->new( %$self ) )
        } else {
            $self->set_image( Test::Proxy::Image->new( %$self ) )
        }
    }
}

1;
