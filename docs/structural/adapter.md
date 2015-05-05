package OODP::TOC::Adapter;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Adapter - converts the interface of a class into another interface clients
expect. Overcomes incompatible interfaces to allow classes to work together
that otherwise could not.

=head1 SYNOPSIS

Adapter is a design pattern that is useful when you want to use an existing
class but its interface does not match the one you need or you want to
create a class that will cooperate with unrelated or unforeseen classes.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Target>

=item L<OODP::Adaptee>

=item L<OODP::Adapter>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Structural>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
