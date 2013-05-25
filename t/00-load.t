#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 27;

BEGIN {
    use_ok( 'Pattern::TOC' )    || print "Bail out!\n";

    use_ok( 'Pattern::Creational::TOC' )                || print "Bail out!\n";
    use_ok( 'Pattern::Creational::AbstractFactory' )    || print "Bail out!\n";
    use_ok( 'Pattern::Creational::Builder' )            || print "Bail out!\n";
    use_ok( 'Pattern::Creational::FactoryMethod' )      || print "Bail out!\n";
    use_ok( 'Pattern::Creational::Prototype' )          || print "Bail out!\n";
    use_ok( 'Pattern::Creational::Singleton' )          || print "Bail out!\n";

    use_ok( 'Pattern::Structural::TOC' )                || print "Bail out!\n";
    use_ok( 'Pattern::Structural::Adapter' )            || print "Bail out!\n";
    use_ok( 'Pattern::Structural::Bridge' )             || print "Bail out!\n";
    use_ok( 'Pattern::Structural::Composite' )          || print "Bail out!\n";
    use_ok( 'Pattern::Structural::Decorator' )          || print "Bail out!\n";
    use_ok( 'Pattern::Structural::Facade' )             || print "Bail out!\n";
    use_ok( 'Pattern::Structural::Flyweight' )          || print "Bail out!\n";
    use_ok( 'Pattern::Structural::Proxy' )              || print "Bail out!\n";

    use_ok( 'Pattern::Behavioral::TOC' )                    || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::ChainOfResponsibility' )  || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Command' )                || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Interpreter' )            || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Iterator' )               || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Mediator' )               || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Memento' )                || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Observer' )               || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::State' )                  || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Strategy' )               || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::TemplateMethod' )         || print "Bail out!\n";
    use_ok( 'Pattern::Behavioral::Visitor' )                || print "Bail out!\n";
}
