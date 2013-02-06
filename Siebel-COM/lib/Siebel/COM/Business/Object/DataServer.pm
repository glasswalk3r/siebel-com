package Siebel::COM::Business::Object::DataServer;

use 5.010;
use strict;
use warnings;
use Moose;
use Siebel::COM::Business::Component::DataServer;

extends 'Siebel::COM::Business::Object';
with 'Siebel::COM::Exception::DataServer';

 # :TODO      :06/02/2013 12:31:48:: maybe a new parameter named classname would do in the parent class? with that, a proper around could be used
sub get_bus_comp {

    my $self      = shift;
    my $comp_name = shift;

    my $bc = Siebel::COM::Business::Component::DataServer->new(
        {
            '_ole' => $self->get_ole()
              ->GetBusComp( $comp_name, $self->get_return_code() )
        }
    );

    $self->check_error();

    return $bc;

}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Siebel::COM - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Siebel::COM;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Siebel::COM, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

A. U. Thor, E<lt>a.u.thor@a.galaxy.far.far.awayE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by A. U. Thor

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.16.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
