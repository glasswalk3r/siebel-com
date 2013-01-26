package Siebel::COM::App;

use 5.010;
use strict;
use warnings;
use Win32::OLE;
use Moose;
use MooseX::FollowPBP;
use Siebel::COM::Business::Object;
use namespace::autoclean;
use Carp;

with 'Siebel::COM';

has 'user'     => ( is => 'ro', isa => 'Str', required => 1 );
has 'password' => ( is => 'ro', isa => 'Str', required => 1 );
has 'ole_class' => ( is => 'ro', isa => 'Str' );

sub BUILD {

    my $self = shift;

    my $app = Win32::OLE->new( $self->get_ole_class() )
      or confess( 'failed to load ' . $self->get_ole_class() . ': ' . $! );

    $self->_set_ole($app);

    my $object_ref =
      $self->get_ole()
      ->LoadObjects( $self->get_app_def(), $self->get_return_code() );

    $self->check_error();

    return $object_ref;

}

sub login {

    my $self = shift;

    $self->get_ole()
      ->Login( $self->get_user(), $self->get_password(),
        $self->get_return_code() );

    $self->check_error();

}

sub get_bus_object {

    my $self    = shift;
    my $bo_name = shift;

    my $bo = Siebel::COM::Business::Object->new(
        {
            '_ole' => $self->get_ole()
              ->GetBusObject( $bo_name, $self->get_return_code() )
        }
    );

    $self->check_error();

    return $bo;

}

sub get_last_error {

    my $self = shift;

    return $self->get_ole()->GetLastErrText()
      ; # this is a Win32::OLE method, not from Siebel API, so return_code is not necessary here

}

sub DEMOLISH {

    my $self = shift;

    if ( defined( $self->get_ole() ) ) {

        $self->get_ole()->Logoff( $self->get_return_code() );

        $self->check_error();

    }

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
