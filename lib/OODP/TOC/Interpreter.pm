package OODP::TOC::Interpreter;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Interpreter - defines a representation for a given language's grammar along
with an interpreter that uses this representation to interpret sentences in
the language.

=head1 SYNOPSIS

Interpreter is a design pattern that is useful for interpreting languages
whose statements can be represented as abstract syntax trees. This pattern
works best with simple grammars is not known for its efficiency, unless
something such as a state machine is utilizied.

=head1 PARTICIPANTS

=over 4

=item L<OODP::AbstractExpression>

=item L<OODP::TerminalExpression>

=item L<OODP::NonterminalExpression>

=item L<OODP::Expression>

=item L<OODP::Context>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
