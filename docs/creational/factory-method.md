package OODP::TOC::FactoryMethod;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

FactoryMethod - allows classes to defer their instantiation to subclasses.

=head1 SYNOPSIS

FactoryMethod is a design pattern that is useful when a class cannot
anticipate the class of objects it must create.

=head1 PARTICIPANTS

=over 4

=item L<OODP::Product>

=item L<OODP::ConcreteProduct>

=item L<OODP::Creator>

=item L<OODP::ConcreteCreator>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Creational>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
