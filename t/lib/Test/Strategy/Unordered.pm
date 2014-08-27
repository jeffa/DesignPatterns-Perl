package Test::Strategy::Unordered;
use Moose;
our $VERSION = '0.01';

extends 'Test::Strategy::List';

sub render {
    my ($self, $list) = @_;

    return '<ul>'
        . join( '', map "<li>$_</li>", @$list )
        . '</ul>'
    ;
}

1;
