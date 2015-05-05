package OODP::TOC::Iterator;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Iterator - provides a way to access elements of an aggregate object
sequentially without exposing its underlying representation.

=head1 SYNOPSIS

Iterator is a design pattern that is useful for supporting multiple
traversals of aggregate objects and provides a uniform interface that
supports polymorphic iteration.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Iterator>

=item L<OODP::ConcreteIterator>

=item L<OODP::Aggregate>

=item L<OODP::ConcreteAggregate>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
