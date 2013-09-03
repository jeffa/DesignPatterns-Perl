package Test::Observer::Clock::Digital;
use Moose;
our $VERSION = '0.01';

extends 'Test::Observer::Clock';

sub draw {
    my $self = shift;
    my $time = sprintf '%02d:%02d:%02d', $self->get_hour, $self->get_min, $self->get_sec;

    my %lookup = _lookup();
    my @time = map [ split "\n", $lookup{$_} ], $time =~ /(.)/g;

    $time = '';
    for my $i (0 .. 4) {
        $time .= $_->[$i] for @time;
        $time .= "\n";
    }

    return $time;
}

sub _lookup {
return (
1 =>
' 11  
111  
 11  
 11  
1111 ',
2 =>
' 22  
2  2 
  2  
 2   
2222 ',
3 =>
'333  
   3 
 33  
   3 
333  ',
4 =>
'4  4 
4  4 
4444 
   4 
   4 ',
5 =>
'5555 
5    
555  
   5 
555  ',
6 =>
'  6   
 6    
6666  
6   6 
 666  ',
7 =>
'77777 
   7  
  7   
  7   
  7   ',
8 =>
' 888  
8   8 
 888  
8   8 
 888  ',
9 =>
' 9999 
9   9 
 9999 
   9  
  9   ',
0 =>
' 000  
0  00 
0 0 0 
00  0 
 000  ',
':' =>      
'   
:: 
   
:: 
   ',
); 
}

1;
