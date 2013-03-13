use feature 'say';
use Siebel::COM::App::DataServer;
use TryCatch;
use Cwd;
use File::Spec;

my $app = Siebel::COM::App::DataServer->new(
    {
        user        => 'sadmin',
        password    => 'sadmin',
        cfg         => ( File::Spec->catfile( getcwd(), 'developer.cfg' ) ),
        data_source => 'Local'
    }
);

try {

    $app->login();

  #    my $bo = $app->get_bus_object('Account');
  #    my $bc = $bo->get_bus_comp('Account');
  #
  #    $bc->activate_field('Location');
  #    $bc->activate_field('Extension Phone Number');
  #
  #    foreach my $loc (@lines) {
  #
  #        chomp($loc);
  #
  #        $bc->clear_query();
  #        $bc->set_view_mode();
  #
  #        $bc->set_search_spec( 'Location', "='$loc'" );
  #        $bc->query();
  #
  #        if ( $bc->first_record() ) {
  #
  #            do {
  #
  #                my $val = $bc->get_field_value('Location');
  #
  #                if ( defined($val) ) {
  #
  #                    $bc->set_field_value( 'Extension Phone Number', '' );
  #                    $bc->write_record();
  #
  #                }
  #
  #                say 'updated';
  #
  #              } while ( $bc->next_record() )
  #
  #        }
  #        else {
  #
  #            say 'Could not find the account';
  #
  #        }
  #
  #    }

}
catch {

    die 'Exception: ' . $app->get_last_error();

}

