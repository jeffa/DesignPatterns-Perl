#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 27;

BEGIN {
    use_ok( 'OODP::TOC' )    || print "Bail out!\n";

    use_ok( 'OODP::Creational::TOC' )                || print "Bail out!\n";
    use_ok( 'OODP::Creational::AbstractFactory' )    || print "Bail out!\n";
    use_ok( 'OODP::Creational::Builder' )            || print "Bail out!\n";
    use_ok( 'OODP::Creational::FactoryMethod' )      || print "Bail out!\n";
    use_ok( 'OODP::Creational::Prototype' )          || print "Bail out!\n";
    use_ok( 'OODP::Creational::Singleton' )          || print "Bail out!\n";

    use_ok( 'OODP::Structural::TOC' )                || print "Bail out!\n";
    use_ok( 'OODP::Structural::Adapter' )            || print "Bail out!\n";
    use_ok( 'OODP::Structural::Bridge' )             || print "Bail out!\n";
    use_ok( 'OODP::Structural::Composite' )          || print "Bail out!\n";
    use_ok( 'OODP::Structural::Decorator' )          || print "Bail out!\n";
    use_ok( 'OODP::Structural::Facade' )             || print "Bail out!\n";
    use_ok( 'OODP::Structural::Flyweight' )          || print "Bail out!\n";
    use_ok( 'OODP::Structural::Proxy' )              || print "Bail out!\n";

    use_ok( 'OODP::Behavioral::TOC' )                    || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::ChainOfResponsibility' )  || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Command' )                || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Interpreter' )            || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Iterator' )               || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Mediator' )               || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Memento' )                || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Observer' )               || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::State' )                  || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Strategy' )               || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::TemplateMethod' )         || print "Bail out!\n";
    use_ok( 'OODP::Behavioral::Visitor' )                || print "Bail out!\n";
}
