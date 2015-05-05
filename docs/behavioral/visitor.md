package OODP::TOC::Visitor;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Visitor - represents an operation to be performed on the elements of an
object structure.

=head1 SYNOPSIS

Visitor is a design pattern that is useful when you have an object structure
that contains many objects with differing interfaces and operations need to
be performed on these objects that depend on their concrete classes.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Visitor>

=item L<OODP::ConcreteVisitor>

=item L<OODP::Element>

=item L<OODP::ConcreteElement>

=item L<OODP::Structure>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
