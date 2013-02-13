use Win32::OLE;
use Test::Most tests => 5;
use Test::Moose;
use lib 't';
use Test::COM;

BEGIN { use_ok('Siebel::COM') }

my $siebel_app = 'SiebelDataControl.SiebelDataControl.1';

bail_on_fail();

my $return = Win32::OLE->new($siebel_app);
ok( $return, "it is possible to instantiate a $siebel_app object" );

SKIP: {

    skip "$siebel_app seems not be registered", 1, unless ($return);

    my $foo = Test::COM->new( Win32::OLE->new($siebel_app) );

    has_attribute_ok( $foo, '_ole' );

}

$siebel_app = 'SiebelDataServer.ApplicationObject';
$return = Win32::OLE->new($siebel_app);
ok( $return, "it is possible to instantiate a $siebel_app object" );

SKIP: {

    skip "$siebel_app seems not be registered", 1, unless ($return);

    my $foo = Test::COM->new( Win32::OLE->new($siebel_app) );

    has_attribute_ok( $foo, '_ole' );

}

