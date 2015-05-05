package OODP::TOC::Bridge;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Bridge - decouples an abstraction from its implementation so that the two
can vary independently.

=head1 SYNOPSIS

Bridge is a design pattern that is useful when an abstraction needs to be
unbounded by its implementation. This is useful for hiding the implementation
of an abstraction completely from clients and changes in that implementation
should have no impact on clients (i.e. no need to recompile their code).

=head1 PARTICIPANTS

=over 4

=item L<OODP::Abstraction>

=item L<OODP::RefinedAbstraction>

=item L<OODP::Implementor>

=item L<OODP::ConcreteImplementor>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Structural>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
