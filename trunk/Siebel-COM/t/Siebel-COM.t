use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Siebel::COM') }

can_ok( 'Siebel::COM',
    qw(check_error _build_variant) );

