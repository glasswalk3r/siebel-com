package Siebel::AssertOS;

use 5.010;
use Devel::AssertOS qw(MSWin32 aix solaris hpux linux);

our $VERSION = 0.01;

1;

__END__

=head1 NAME

Siebel::AssertOS - verifies if the OS is supported by Siebel applications

=head1 SYNOPSIS

    package Your::Package;
	use Siebel::AssertOS;

=head1 DESCRIPTION

This modules will help identifying if the current OS that is running is supported by Siebel applications. If not, the module will C<die>, 
forcing the code to stop being executed.

This is particulary useful for automated tests.

The list of supported OS is as defined by Oracle documentation regarding Siebel 8.2 and the list of OS from L<Devel::CheckOS> distribution.

=head2 EXPORT

None by default.

=head1 CAVEATS

Beware that Siebel is supported by specific versions of OS. This module does not check versions or distributions (in the case of Linux).

=head1 SEE ALSO

=over

=item *

Oracle documentation about supported OS: L<http://docs.oracle.com/cd/E11886_01/V8/CORE/SRSP_81/SRSP_81_ServerEnv4.html#wp1009117>

=item *

L<Devel::CheckOS>

=item *

Project website: L<https://code.google.com/p/siebel-com/>

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
