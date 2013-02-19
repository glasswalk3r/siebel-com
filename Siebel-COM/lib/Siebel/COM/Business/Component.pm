package Siebel::COM::Business::Component;

use 5.010;
use Moose;
use Siebel::COM::Constants;

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

    return $self->get_ole()->FirstRecord(@_);

}

sub next_record {

    my $self = shift;

    return $self->get_ole()->NextRecord(@_);

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

	push(@_, ALL_VIEW) unless(@_);

	$self->get_ole()->SetViewMode(@_);

}

__PACKAGE__->meta->make_immutable;

1;
__END__

=head1 NAME

Siebel::COM::Business:Component - Perl class to represent a Siebel COM Business Component

=head1 SYNOPSIS

  sub get_bus_comp {

      my $self    = shift;
      my $bc_name = shift;

      my $bc = Siebel::COM::Business::Component->new(
          { '_ole' => $self->get_ole()->GetBusComp($bc_name) } );

      return $bc;

  }

=head1 DESCRIPTION

Siebel::COM::Business::Component is the related class to Siebel Business Component classes.

Commom usage of this class is indirect since the object is recovered from a L<Siebel::COM::Business::Object> instance (see C<get_bus_comp> method
from it).

=head2 ATTRIBUTES

None besides the defined by the role L<Siebel::COM>.

=head2 METHODS

The methods listed below have exactly the same interface than those of Siebel COM API for Business Components:

=over

=item * 

activate_field = ActivateField

=item *

get_field_value = GetFieldValue

=item *

clear_query = ClearToQuery

=item *

set_search_exp = SetSearchExpr

=item *

set_search_spec = SetSearchSpec

=item *

get_search_spec = GetSearchSpec

=item *

first_record = FirstRecord

=item *

next_record = NextRecord

=item *

set_field_value = SetFieldValue

=item *

write_record = WriteRecord

=back

The following methods have some interface differences from their Siebel COM counterparts:

=head3 query

Same thing as ExecuteQuery from Siebel COM API but it defined as default FORWARD_ONLY constant for cursor mode. It accepts a different value
for cursor mode although (must probably FORWARD_BACKWARD would be the choice for it).

=head3 set_view_mode

Same thing as SetViewMode from Siebel COM API but it defined as default ALL_VIEW constant for view mode. It accepts a different value
for it as defined by L<Siebel::COM::Constants>.

=head2 EXPORT

None by default.

=head1 SEE ALSO

=over

=item *

L<Siebel::COM>

=item *

L<Siebel::COM::Constants>

=item *

L<Siebel::COM::Business>

=back

=head1 AUTHOR

Alceu Rodrigues de Freitas Junior, E<lt>arfreitas@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 of Alceu Rodrigues de Freitas Junior, E<lt>arfreitas@cpan.org<E<gt>

This file is part of Siebel COM project.

Siebel COM is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Siebel COM is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Siebel COM.  If not, see <http://www.gnu.org/licenses/>.

=cut
