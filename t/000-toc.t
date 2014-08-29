#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 27;

BEGIN {
    use_ok( $_ ) or die "Bail out!\n" for (qw(
        OODP::TOC
            OODP::TOC::Creational
                OODP::TOC::AbstractFactory
                OODP::TOC::Builder
                OODP::TOC::FactoryMethod
                OODP::TOC::Prototype
                OODP::TOC::Singleton

            OODP::TOC::Structural
                OODP::TOC::Adapter
                OODP::TOC::Bridge
                OODP::TOC::Composite
                OODP::TOC::Decorator
                OODP::TOC::Facade
                OODP::TOC::Flyweight
                OODP::TOC::Proxy

            OODP::TOC::Behavioral
                OODP::TOC::ChainOfResponsibility
                OODP::TOC::Command
                OODP::TOC::Interpreter
                OODP::TOC::Iterator
                OODP::TOC::Mediator
                OODP::TOC::Memento
                OODP::TOC::Observer
                OODP::TOC::State
                OODP::TOC::Strategy
                OODP::TOC::TemplateMethod
                OODP::TOC::Visitor
    ));
}
