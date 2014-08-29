#!perl -T
#------------------------------------------------------
package MyAbstractFactory;
use Moose;
extends 'OODP::AbstractFactory';
sub create {
    my ($self,$class) = @_;
    my $factory = 'ConcreteFactory' . substr( $class, -1 );
    return $factory->_create_widget( substr( $class, 0, 1 ) );
}
sub _create_widget {
    my ($self,$product) = @_;
    my $method = 'create_product' . $product;
    return $self->$method;
}

package ConcreteFactory1;
use Moose;
extends 'MyAbstractFactory';
sub create_productA { ConcreteWidgetA1->new }
sub create_productB { ConcreteWidgetB1->new }

package ConcreteFactory2;
use Moose;
extends 'MyAbstractFactory';
sub create_productA { ConcreteWidgetA2->new }
sub create_productB { ConcreteWidgetB2->new }

#------------------------------------------------------
package MyAbstractWidget;
use Moose;
extends 'OODP::AbstractWidget';
package ConcreteWidgetA1;
use Moose;
extends 'MyAbstractWidget';
package ConcreteWidgetA2;
use Moose;
extends 'MyAbstractWidget';
package ConcreteWidgetB1;
use Moose;
extends 'MyAbstractWidget';
package ConcreteWidgetB2;
use Moose;
extends 'MyAbstractWidget';

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 6;

use_ok 'OODP::AbstractFactory';
use_ok 'OODP::AbstractWidget';

isa_ok( MyAbstractFactory->create( 'A1' ), 'ConcreteWidgetA1' );
isa_ok( MyAbstractFactory->create( 'A2' ), 'ConcreteWidgetA2' );
isa_ok( MyAbstractFactory->create( 'B1' ), 'ConcreteWidgetB1' );
isa_ok( MyAbstractFactory->create( 'B2' ), 'ConcreteWidgetB2' );
