package OODP::TOC::State;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

State - allows objects to alter their behavior when their internal
state changes.

=head1 SYNOPSIS

State is a design pattern that is useful for operations that have large,
multpart conditional statements that depend on the object's state, which
is usually represented by one or more enumarated constants. The State
pattern puts each branch of a conditional into a separate class, allowing
you to treat the object's state as an object itself.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Context>

=item L<OODP::State>

=item L<OODP::ConcreteState>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
