package Siebel::COM::Business::Object;

use 5.010;
use strict;
use warnings;
use Moose;
use Siebel::COM::Business::Component;
use Sub::Talisman qw(SiebelAPICheck);

extends 'Siebel::COM::Business';

sub get_bus_comp : SiebelAPICheck {

    my $self      = shift;
    my $comp_name = shift;

    return Siebel::COM::Business::Component->new(
        {
            '_ole' => $self->get_ole()
              ->GetBusComp( $comp_name, $self->get_return_code() )
        }
    );

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
