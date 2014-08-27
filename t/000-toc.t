#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 37;

BEGIN {
    use_ok( $_ ) or die "Bail out!\n" for (qw(

        OODP::TOC

        OODP::Creational::TOC
        OODP::Creational::AbstractFactory
        OODP::Creational::Builder
        OODP::Creational::FactoryMethod
        OODP::Creational::Prototype
        OODP::Creational::Singleton

        OODP::Structural::TOC
        OODP::Structural::Adapter
        OODP::Structural::Bridge
        OODP::Structural::Composite
        OODP::Structural::Decorator
        OODP::Structural::Facade
        OODP::Structural::Flyweight
        OODP::Structural::Proxy

        OODP::Behavioral::TOC
        OODP::Behavioral::ChainOfResponsibility
        OODP::Behavioral::Command
        OODP::Behavioral::Interpreter
        OODP::Behavioral::Iterator
        OODP::Behavioral::Mediator
        OODP::Behavioral::Memento
        OODP::Behavioral::Observer
        OODP::Behavioral::State
        OODP::Behavioral::Strategy
        OODP::Behavioral::TemplateMethod
        OODP::Behavioral::Visitor

        OODP::Component
        OODP::Composite
        OODP::ConcreteObserver
        OODP::ConcreteStrategy
        OODP::ConcreteSubject
        OODP::Context
        OODP::Leaf
        OODP::Observer
        OODP::Strategy
        OODP::Subject

    ));
}
