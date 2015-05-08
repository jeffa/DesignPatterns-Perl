#!perl -T
#------------------------------------------------------
package MyProxy;
use Moose;
extends 'OODP::Proxy';

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 2;

use_ok 'OODP::Proxy';

my $proxy = new_ok 'MyProxy';
