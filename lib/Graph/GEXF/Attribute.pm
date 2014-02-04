package Graph::GEXF::Attribute;

use Moose;
use namespace::autoclean;

=head1 ATTRIBUTES

=head2 id (B<Int>)


=cut

has id => (is => 'ro', isa => 'Int', required => 1,);

=head2 title (B<Str>)


=cut

has title => (is => 'rw', isa => 'Str');

=head2 value (B<Str>)


=cut

has value => (is => 'rw', isa => 'Str');

=head2 type


=cut

has type  => (
    is  => 'ro',
    isa => enum([qw/string integer float double boolean date anyURI/])
);

=head1 SYNOPSIS

 use Graph::GEXF::Attribute;

=head1 DESCRIPTION

A class providing attributes for graph properties
     
=head1 LICENSE
 
The MIT License should included with the project. If not, it can be found at: http://opensource.org/licenses/mit-license.php

=head1 TESTED WITH:

=over

=item *
Perl 5.14.2 (Red Hat Enterprise Linux Desktop release 6.2 (Santiago); Fedora 17)

=back

=head1 AUTHORS

Franck Cuny (http://lumberjaph.net/), S. Evan Staton                                                

=head1 MAINTAINED BY

S. Evan Staton

=head1 CONTACT
 
statonse at gmail dot com

=cut

__PACKAGE__->meta->make_immutable;

1;

