package Siebel::COM::Business::Component::DataServer;

use 5.010;
use Moose;
use Siebel::COM::Constants;

extends 'Siebel::COM::Business::Component';
with 'Siebel::COM::Exception::DataServer';

around 'activate_field' => sub {

    my $orig       = shift;
    my $self       = shift;
    my $field_name = shift;

    $self->$orig( $field_name, $self->get_return_code() );

    $self->check_error();

};

around 'get_field_value' => sub {

    my $orig       = shift;
    my $self       = shift;
    my $field_name = shift;

    my $value = $self->$orig( $field_name, $self->get_return_code() );

    $self->check_error();

    return $value;

};

around 'clear_query' => sub {

    my $orig = shift;
    my $self = shift;

    $self->$orig( $self->get_return_code() );
    $self->check_error();

};

around 'set_search_expr' => sub {

    my $orig        = shift;
    my $self        = shift;
    my $search_expr = shift;

    $self->$orig( $search_expr, $self->get_return_code() );
    $self->check_error();

};

around 'set_search_spec' => sub {

    my $orig = shift;
    my $self = shift;

    $self->$orig( @_, $self->get_return_code() );
    $self->check_error();

};

around 'get_search_spec' => sub {

    my $orig = shift;
    my $self = shift;

    $self->$orig( @_, $self->get_return_code() );
    $self->check_error();

};

around 'query' => sub {

    my $orig        = shift;
    my $self        = shift;
    my $cursor_type = shift;    # optional parameter

    $cursor_type = FORWARD_ONLY
      unless ( defined($cursor_type) );    # default cursor type

    $self->$orig( $cursor_type, $self->get_return_code() );
    $self->check_error();

};

around 'first_record' => sub {

    my $orig = shift;
    my $self = shift;

    my $boolean = $self->$orig( $self->get_return_code() );

    $self->check_error();
    return $boolean;

};

around 'next_record' => sub {

    my $orig = shift;
    my $self = shift;

    my $boolean = $self->$orig( $self->get_return_code() );
    $self->check_error();
    return $boolean;

};

around 'set_field_value' => sub {

    my $orig = shift;
    my $self = shift;

    $self->$orig( @_, $self->get_return_code() );
    $self->check_error();

};

around 'write_record' => sub {

    my $orig = shift;
    my $self = shift;

    $self->$orig( $self->get_return_code() );
    $self->check_error();

};

around 'set_view_mode' => sub {

    my $orig = shift;
    my $self = shift;
    my $mode = shift;

    if ( defined($mode) ) {

        $self->$orig( $mode, $self->get_return_code() );

    }
    else {

        $self->$orig( 3, $self->get_return_code() );

    }

};

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
