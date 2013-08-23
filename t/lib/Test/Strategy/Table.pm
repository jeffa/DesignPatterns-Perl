package Test::Strategy::Table;
use Moose;
our $VERSION = '0.01';

with 'Test::Strategy::List';

sub render {
    my ($self, $list) = @_;

    return '<table>'
        . '<tr>'
        . join( '', map "<td>$_</td>", @$list )
        . '</tr>'
        . '</table>'
    ;
}

1;
