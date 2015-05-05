package OODP::TOC::ChainOfResponsibility;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

ChainOfResponsibility - chains receiving objects and passes the request along
the chain until an object handles it.

=head1 SYNOPSIS

ChainOfResponsibility is a design pattern that is useful for avoiding
coupling the sender of a request to its receiver by giving more than one
object a chance to handle the request.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Handler>

=item L<OODP::ConcreteHandler>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
