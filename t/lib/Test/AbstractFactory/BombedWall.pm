package Test::AbstractFactory::BombedWall;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

extends 'Test::AbstractFactory::Wall';

sub enter { }


1;
