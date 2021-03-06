package Test::Strategy::Table;
use Moose;
our $VERSION = '0.01';

extends 'Test::Strategy::List';

sub algorithm {
    my ($self, $list) = @_;

    return '<table>'
        . '<tr>'
        . join( '', map "<td>$_</td>", @$list )
        . '</tr>'
        . '</table>'
    ;
}

1;
