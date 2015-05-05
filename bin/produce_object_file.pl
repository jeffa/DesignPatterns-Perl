#!/usr/bin/perl
use strict;
use warnings;
use Text::Template;

my $object = shift || 'Foo';

my $tmpl = Text::Template->new(TYPE => 'FILEHANDLE', SOURCE => \*DATA );
my $text = $tmpl->fill_in( HASH => { object => $object } );

print $text;


__DATA__
package OODP::{$object};
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

OODP::{$object} - 

=head1 SYNOPSIS

OODP::{$object} is

=head1 SEE ALSO

=over 4

=item L<OODP::TOC>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
