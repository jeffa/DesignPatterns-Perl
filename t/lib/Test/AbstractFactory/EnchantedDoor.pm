package Test::AbstractFactory::EnchantedDoor;
use Moose;
use MooseX::FollowPBP;
use Moose::Util::TypeConstraints;
use Carp;
our $VERSION = '0.01';

extends 'Test::AbstractFactory::Door';

1;
