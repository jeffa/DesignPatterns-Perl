package OODP::TOC::Builder;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Builder - Separate the construction of a complex object from its
representation so that the same construction process can create
different representations.

=head1 SYNOPSIS

Builder is a design pattern useful keeping the creation of the
object independent from the parts that make up the object. It
also allows different representations for the constructed objects.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Builder>

=item L<OODP::ConcreteBuilder>

=item L<OODP::Director>

=item L<OODP::Product>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Creational>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
