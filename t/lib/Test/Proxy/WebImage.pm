package Test::Proxy::WebImage;
use Moose;
use LWP::Simple;

extends 'Test::Proxy::Image';

sub load {
    my $self = shift;
    my $image = LWP::Simple::get( $self->get_filename );
    $self->set_data( $image );
}

1;
