use 5.010;
use ExtUtils::MakeMaker;

eval {

    require Win32::OLE;

};

unless ($@) {

    my $siebel_app  = 'SiebelDataControl.SiebelDataControl.1';
    my $siebel_app2 = 'SiebelDataServer.ApplicationObject';

    my $return  = Win32::OLE->new($siebel_app);
    my $return2 = Win32::OLE->new($siebel_app2);

    unless ( $return and $return2 ) {

        warn
"Could not load $siebel_app and/or $siebel_app2, Siebel::COM will not work with these conditions and thus cannot be tested";
        exit(0);

    }

}

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Siebel::COM',
    VERSION_FROM => 'lib/Siebel/COM.pm',
    PREREQ_PM    => {
        Moose                  => 2.0603,
        'Win32::OLE'           => 0.1709,
        'MooseX::FollowPBP'    => 0.05,
        'namespace::autoclean' => 0.13,
        'Devel::CheckOS'       => 1.17
    },
    BUILD_REQUIRES => {
        'Test::Most'          => 0.25,
        'Test::Pod'           => 1.22,
        'Test::Pod::Coverage' => 1.08,
        'Test::Class'         => 0.36
    },
    (
        $] >= 5.005
        ?    ## Add these new keywords supported since 5.005
          (
            ABSTRACT_FROM =>
              'lib/Siebel/COM.pm',    # retrieve abstract from module
            AUTHOR => 'Alceu Rodrigues de Freitas Junior <arfreitas@cpan.org>'
          )
        : ()
    ),
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002 ? ( 'LICENSE' => 'gpl', ) : () )
);
