# Introduction #

Siebel-COM is an Perl API to add "syntax sugar" to connect to a Siebel application. By using classes created with [Moose](http://search.cpan.org/perldoc?Moose) (and internally [Win32::OLE](http://search.cpan.org/perldoc?Win32::OLE)) you can access Siebel without having to go down the details of using Siebel COM (Data Server and/or Data Control) and COM concepts.

Siebel-COM is also available at [CPAN](http://search.cpan.org). You can get the latest [documentation](http://search.cpan.org/perldoc?Siebel::COM) of with from the Perldoc generated from the packages.

# Details #

Here is an example of updating accounts in Siebel with Siebel::App::DataControl:

```
  use feature 'say';
  use Siebel::COM::App::DataControl;
  use TryCatch;

  my $input_file = shift;
  chomp($input_file);

  open( my $input, '<', $input_file ) or die "Cannot read $input_file: $!\n";
  my @lines = <$input>;
  close($input);

  my $app = Siebel::COM::App::DataControl->new(
      {
          user       => 'sadmin',
          password   => 'sadmin',
          host       => 'foobar',
          enterprise => 'SIEBEL',
          lang       => 'ENU',
          aom        => 'eFoobarObjMgr_enu'
      }
  );

  try {

      $app->login();

      my $bo = $app->get_bus_object('Account');
      my $bc = $bo->get_bus_comp('Account');

      $bc->activate_field('Location');
      $bc->activate_field('Extension Phone Number');

      foreach my $loc (@lines) {

          chomp($loc);

          $bc->clear_query();
          $bc->set_view_mode();

          $bc->set_search_spec( 'Location', "='$loc'" );
          $bc->query();

          if ( $bc->first_record() ) {

              do {

                  my $val = $bc->get_field_value('Location');
  
                  if ( defined($val) ) {

                      $bc->set_field_value( 'Extension Phone Number', '' );
                      $bc->write_record();

                  }

                  say 'updated';

              } while ( $bc->next_record() )

          }
          else {

              say 'Could not find the account';

          }

      }

  }
  catch {

      die 'Exception: ' . $app->get_last_error();

  }
```

Do you want to change that to Siebel COM Data Server? No problem. Just replace the object with Siebel::COM::DataServer:

```
  use feature 'say';
  use Siebel::COM::App::DataControl;
  use TryCatch;

  my $input_file = shift;
  chomp($input_file);

  open( my $input, '<', $input_file ) or die "Cannot read $input_file: $!\n";
  my @lines = <$input>;
  close($input);

  my $app = Siebel::COM::App::DataServer->new(
      {
          user       => 'sadmin',
          password   => 'sadmin',
          cfg         => 'C:\Siebel\8.1\Client\BIN\ptb\scomm.cfg',
          data_source => 'ServerDataSrc'
      }
  );

  try {

      $app->login();

      my $bo = $app->get_bus_object('Account');
      my $bc = $bo->get_bus_comp('Account');

      $bc->activate_field('Location');
      $bc->activate_field('Extension Phone Number');

      foreach my $loc (@lines) {

          chomp($loc);

          $bc->clear_query();
          $bc->set_view_mode();

          $bc->set_search_spec( 'Location', "='$loc'" );
          $bc->query();

          if ( $bc->first_record() ) {

              do {

                  my $val = $bc->get_field_value('Location');
  
                  if ( defined($val) ) {

                      $bc->set_field_value( 'Extension Phone Number', '' );
                      $bc->write_record();

                  }

                  say 'updated';

              } while ( $bc->next_record() )

          }
          else {

              say 'Could not find the account';

          }

      }

  }
  catch {

      die 'Exception: ' . $app->get_last_error();

  }
```

[TryCatch](http://search.cpan.org/perldoc?TryCatch) module is not part of Siebel-COM distribution, but it is a nice thing to use with it. Grab it from [CPAN](http://search.cpan.org).