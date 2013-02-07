package Siebel::COM::App::DataServer;

use 5.010;
use strict;
use warnings;
use Moose;
use namespace::autoclean;

extends 'Siebel::COM::App';
with 'Siebel::COM::Exception::DataServer';

has cfg         => ( is => 'rw', isa => 'Str', required => 1 );
has data_source => ( is => 'rw', isa => 'Str', required => 1 );
has ole_class =>
  ( is => 'ro', isa => 'Str', default => 'SiebelDataServer.ApplicationObject' );

sub _error {

    my $self = shift;

    return ('('
          . $self->get_return_code() . '): '
          . $self->get_ole()->GetLastErrText() );

}

sub BUILD {

    my $self = shift;
    $self->load_objects();

}

sub get_app_def {

    my $self = shift;

    my $cfg = $self->get_cfg();

    open( my $read, '<', $cfg )
      or die "could not read cfg file $cfg: $!";
    close($read);

    return $cfg . ',' . $self->get_data_source();

}

sub load_objects {

    my $self = shift;

    my $object =
      $self->get_ole()
      ->LoadObjects( $self->get_app_def(), $self->get_return_code() );
    $self->check_error();
    return $object;

}

override 'login' => sub {

    my $self = shift;

    $self->get_ole()
      ->Login( $self->get_user(), $self->get_password(),
        $self->get_return_code() );

    $self->check_error();

};

sub get_bus_object {

    my $self    = shift;
    my $bo_name = shift;

    my $bo = Siebel::COM::Business::Object::DataServer->new(
        {
            '_ole' => $self->get_ole()
              ->GetBusObject( $bo_name, $self->get_return_code() )
        }
    );

    $self->check_error();

    return $bo;

}

__PACKAGE__->meta->make_immutable;
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