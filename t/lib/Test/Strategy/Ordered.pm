package Test::Strategy::Ordered;
use Moose;
our $VERSION = '0.01';

with 'Test::Strategy::List';

sub render {
    my ($self, $list) = @_;

    return '<ol>'
        . join( '', map "<li>$_</li>", @$list )
        . '</ol>'
    ;
}

1;
