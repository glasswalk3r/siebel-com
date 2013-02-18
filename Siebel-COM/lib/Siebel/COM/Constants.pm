package Siebel::COM::Constants;

use 5.010;
use strict;
use warnings;
use Exporter 'import';

our @EXPORT =
  qw(FORWARD_ONLY FORWARD_BACKWARD SALES_REP_VIEW MANAGER_VIEW PERSONAL_VIEW ALL_VIEW ORG_VIEW BGROUP_VIEW CATALOG_VIEW SUB_ORG_VIEW);

use constant FORWARD_BACKWARD => 256;
use constant FORWARD_ONLY     => 257;
use constant SALES_REP_VIEW   => 0;
use constant MANAGER_VIEW     => 1;
use constant PERSONAL_VIEW    => 2;
use constant ALL_VIEW         => 3;
use constant ORG_VIEW         => 5;
use constant GROUP_VIEW       => 7;
use constant CATALOG_VIEW     => 8;
use constant SUB_ORG_VIEW     => 9;

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Siebel::COM::Constants - export Siebel constants to use 

=head1 SYNOPSIS

  use Siebel::COM::Constants;
  sub query {

      my $self        = shift;
      my $cursor_type = shift;    # optional parameter

      $cursor_type = FORWARD_ONLY
        unless ( defined($cursor_type) );    # default cursor type

      $self->get_ole()->ExecuteQuery( $cursor_type, $self->get_return_code() );
      $self->check_error();

  }

=head1 DESCRIPTION

This module exports constants to be used by all other modules related to L<Siebel::COM>.

=head2 EXPORT

The constants below are exported by default:

=over

=item Search mode functions

=over

=item FORWARD_ONLY

=item FORWARD_BACKWARD

=back

=item View mode functions

=over

=item SALES_REP_VIEW

=item MANAGER_VIEW

=item PERSONAL_VIEW

=item ALL_VIEW

=item ORG_VIEW

=item GROUP_VIEW

=item CATALOG_VIEW

=item SUB_ORG_VIEW

=back

=back

=head1 SEE ALSO

=over

=item http://docs.oracle.com/cd/E14004_01/books/OIRef/OIRef_Using_Siebel_VB_and_Siebel_eScript4.html#wp1049587

Oficial documentation about the constants and their values

=back

=head1 AUTHOR

Alceu Rodrigues de Freitas Junior, E<lt>arfreitas@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Alceu Rodrigues de Freitas Junior

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.16.1 or,
at your option, any later version of Perl 5 you may have available.

=cut