use 5.010;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Siebel::COM',
    VERSION_FROM => 'lib/Siebel/COM.pm',
    PREREQ_PM    => {
        Moose                        => 2.0603,
        'Win32::OLE'                 => 0.1709,
        'MooseX::FollowPBP'          => 0.05,
        'namespace::autoclean'       => 0.13,
        'MooseX::ModifyTaggedMethods' => 0.001
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
);
