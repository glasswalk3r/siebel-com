package Siebel::COM::Business::Component;

use 5.010;
use strict;
use warnings;
use Moose;
use Siebel::COM::Constants;
use TryCatch;

extends 'Siebel::COM::Business';

sub activate_field {

    my $self = shift;

    $self->get_ole()->ActivateField(@_);

}

sub get_field_value {

    my $self = shift;

    return $self->get_ole()->GetFieldValue(@_);

}

sub clear_query {

    my $self = shift;

    $self->get_ole()->ClearToQuery(@_);

}

sub set_search_expr {

    my $self = shift;

    $self->get_ole()->SetSearchExpr(@_);

}

sub set_search_spec {

	my $self = shift;

	$self->get_ole()->SetSearchSpec(@_);

}

sub get_search_spec {

	my $self = shift;

	$self->get_ole()->GetSearchSpec(@_);

}

sub query {

    my $self = shift;

    push( @_, FORWARD_ONLY )
      unless (@_);    # default cursor type

    $self->get_ole()->ExecuteQuery(@_);

}

sub first_record {

    my $self = shift;

    my $boolean = $self->get_ole()->FirstRecord(@_);
    return $boolean;

}

sub next_record {

    my $self = shift;

    my $boolean = $self->get_ole()->NextRecord(@_);
    return $boolean;

}

sub set_field_value {

    my $self = shift;

    $self->get_ole()->SetFieldValue(@_);

}

sub write_record {

    my $self = shift;

    $self->get_ole()->WriteRecord(@_);

}

sub set_view_mode {

	my $self = shift;

	push(@_, 3) unless(@_);

	$self->get_ole()->SetViewMode(@_);

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
