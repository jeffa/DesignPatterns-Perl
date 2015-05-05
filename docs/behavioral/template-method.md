package OODP::TOC::TemplateMethod;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

TemplateMethod - allows subclasses to redefine certain steps of an
algorithm without changing the algorithm's structure.

=head1 SYNOPSIS

TemplateMethod is a design pattern the is useful for implementing
the invariant parts of an algorithm once and letting subclasses
implement variant behavior.

=head1 STRUCTURE

     +------------------------+
     |     AbstractClass      |
     +------------------------+      +-------------------------+
     |                        |      |  primitive_operation1() |
     | template_method()  o----------+  ...                    |
     |                        |      |  primitive_operation2() |
     | primitive_operation1() |      |  ...                    |
     | primitive_operation2() |      +-------------------------+
     +------------------------+
                  ^                  
                  |
     +------------------------+
     |     ConcreteClass      |
     +------------------------+
     |                        |
     | primitive_operation1() | 
     | primitive_operation2() | 
     +------------------------+

=head1 PARTICIPANTS

=over 4

=item L<OODP::AbstractClass>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC>

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
