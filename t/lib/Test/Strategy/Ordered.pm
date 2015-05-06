package Test::Strategy::Ordered;
use Moose;
our $VERSION = '0.01';

extends 'Test::Strategy::List';

sub algorithm {
    my ($self, $list) = @_;

    return '<ol>'
        . join( '', map "<li>$_</li>", @$list )
        . '</ol>'
    ;
}

1;
