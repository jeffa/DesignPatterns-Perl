package OODP::TOC::AbstractFactory;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

AbstractFactory - provides interface for creating objects without specifying
their concrete classes.

=head1 SYNOPSIS

AbstractFactory is a design pattern that can be used for systems that should
be independent of how their products are created, composed and represented. 

=head1 STRUCTURE

 Client only accesses AbstractFactory and resulting class: AbstractProductA
 and/or AbstractProductB, etc.
                                                    +------------------+
            +-----------------+                     | AbstractProductA |
            | AbstractFactory |                     +------------------+
            +-----------------+                               |         
            |create_productA()|                       ----------------  
            |create_productB()|                       |              |  
            +-----------------+                  +---------+   +---------+
                      |                          |ProductA1|   |ProductA2|
                      |                          +---------+   +---------+
           +----------------------+            
           |                      |            
  +-----------------+    +-----------------+        +------------------+
  |ConcreteFactory1 |    |ConcreteFactory2 |        | AbstractProductB |
  +-----------------+    +-----------------+        +------------------+
  |create_productA()|    |create_productA()|                  |
  |create_productB()|    |create_productB()|          +--------------+
  +-----------------+    +-----------------+          |              |
                                                 +---------+   +---------+
                                                 |ProductB1|   |ProductB2|
                                                 +---------+   +---------+

=head1 PARTICIPANTS

=over 4

=item L<OODP::AbstractFactory>

=item L<OODP::AbstractWidget>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC>

=item L<OODP::TOC::Creational>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
