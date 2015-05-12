package Test::Proxy::RandImage;
use Moose;
use Image::PNG::Libpng ':all';
use Image::PNG::Const ':all';

extends 'Test::Proxy::Image';

sub load {
    my $self = shift;
    my $image = $self->_create_image;
    $self->set_data( $image );
}

sub _create_image {
    my $self = shift;
    my $png = create_write_struct();
    $png->set_IHDR ({
        height      => $self->get_height,
        width       => $self->get_width,
        bit_depth   => 8,
        color_type  => PNG_COLOR_TYPE_RGB,
    });
    my $rand = sub { int( rand() * 0x100 ) };
    my $raw  = pack 'CCC', map $rand->(), 1 .. 3;
    my @rows = ($raw x $self->get_width) x $self->get_height;
    $png->set_rows( \@rows );
    return $png->write_to_scalar;
}


1;
