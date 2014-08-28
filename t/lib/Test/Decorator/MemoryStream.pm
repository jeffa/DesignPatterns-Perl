package Test::Decorator::MemoryStream;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

extends 'Test::Decorator::Stream';

sub dump_buffer {
    my ($self) = @_;

    warn "Dumping buffer\n";
    my $buffer = $self->{buffer};
    $self->{buffer} = '';

    return $buffer;
}


1;
