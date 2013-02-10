package Siebel::COM::Foobar;
use Moose;
with 'Siebel::COM';

1;

package main;

use Test::More tests => 2;
use Test::Moose;
use Siebel::COM::Foobar;
use Test::Mock::Class;
require Win32::OLE;

BEGIN { use_ok('Siebel::COM') }

mock_class 'Win32::OLE' => 'Win32::OLE::Mock';
my $foo = Foo::Bar->new( Win32::OLE::Mock->new('foobar') );

has_attribute_ok( $foo, '_ole' );

1;
