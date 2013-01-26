use strict;
use warnings;
use Siebel::COM::App::DataServer;
use feature 'say';
use Getopt::Long;
use Pod::Usage;

my $help = 0;

my ( $user, $password, $cfg, $datasource );

GetOptions(
    'user=s'       => \$user,
    'password=s'   => \$password,
    'help|?'       => \$help,
    'cfg=s'        => \$cfg,
    'datasource=s' => \$datasource
) or pod2usage(2);
pod2usage(1) if $help;

pod2usage(2)
  unless ( ( defined($user) )
    and ( defined($password) )
    and ( defined($cfg) )
    and ( defined($datasource) ) );

my $schema = {
    'Contact' => [
        'Birth Date',
        'Created',
        'Created By Name',
        'Email Address',
        'Fax Phone #',
        'First Name',
        'Id',
        'Job Title',
        'Last Name',
        'Updated',
        'Updated By Name',
        'Work Phone #'
    ]
};

my $sa;

eval {

    $sa = Siebel::COM::App::DataServer->new(
        {
            cfg         => 'C:\Siebel\8.1\Client\bin\ptb\scomm.cfg',
            data_source => 'ServerDataSrcDEV',
            user        => $user password => $password
        }
    );

    my ( $bo, $bc, $key, $field, $moreResults );

    $sa->login();

    foreach $key ( keys(%$schema) ) {

        $bo = $sa->get_bus_object($key);
        $bc = $bo->get_bus_comp($key);

        foreach $field ( @{ $schema->{$key} } ) {

            $bc->activate_field($field);

        }

        $bc->clear_query();
        $bc->query();
        $moreResults = $bc->first_record();

        while ($moreResults) {

            printf("-----\n");

            foreach $field ( @{ $schema->{$key} } ) {

                printf( "%40s: %s\n", $field, $bc->get_field_value($field) );

            }

            $moreResults = $bc->next_record();
        }
    }

};

if ($@) {

    warn $@;
    die $sa->get_last_error() if ( defined($sa) );

}

__END__

=pod

=head1 NAME

get contact data from a Siebel database by using COM

=head1 SYNOPSIS

get_contacts.pl --user=foobar --password=foobar [--help]

Options:
    --help          this brief help message
    --user          user for connection authentication
    --password      password for to authentication
    --cfg           Siebel client configuration file
    --datasource    the datasource inside the configuration file to be used

=head1 DESCRIPTION

This is a simple example of usage of L<Siebel::COM>.

This script will connect to a Siebel database by using COM (more specifically Siebel COM data server) and loop over all contacts in the database, printing to the
STDOUT the following information:

=over 12

=item Birth Date

=item Created

=item Created By Name

=item Email Address

=item Fax Phone

=item First Name

=item Id

=item Job Title

=item Last Name

=item Updated

=item Updated By Name

=item Work Phone

=back

=cut
