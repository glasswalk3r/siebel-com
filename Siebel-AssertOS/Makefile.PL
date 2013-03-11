use 5.010;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'Siebel::AssertOS',
    VERSION_FROM   => 'lib/Siebel/AssertOS.pm',       # finds $VERSION
    PREREQ_PM      => { 'Devel::CheckOS' => 1.21 },
    BUILD_REQUIRES => {
        'Test::Most'          => 0.25,
        'Test::Pod'           => 1.22,
        'Test::Pod::Coverage' => 1.08
    },
    (
        $] >= 5.005
        ?    ## Add these new keywords supported since 5.005
          (
            ABSTRACT_FROM =>
              'lib/Siebel/AssertOS.pm',    # retrieve abstract from module
            AUTHOR => 'Alceu Rodrigues de Freitas Junior <arfreitas@cpan.org>'
          )
        : ()
    ),
);
