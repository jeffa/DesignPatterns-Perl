package OODP::TOC::Command;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Command - encapsulates reuqests as objects.

=head1 SYNOPSIS

Command is a design pattern that allows you to parameterize clients with
different requests and support undoable opertations.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Command>

=item L<OODP::ConcreteCommand>

=item L<OODP::Invoker>

=item L<OODP::Receiver>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
