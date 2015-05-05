Interpreter
===========
The Interpreter pattern defines a representation for a given grammar
along with an interpreter that uses this representation to interpret
sentences in the language.  This is useful for interpreting languages
whose statements can be represented as abstract syntax trees. This pattern
works best with simple grammars is not known for its efficiency, unless
something such as a state machine is utilizied.

Participants
------------
* OODP::AbstractExpression
* OODP::TerminalExpression
* OODP::NonterminalExpression
* OODP::Expression
* OODP::Context
