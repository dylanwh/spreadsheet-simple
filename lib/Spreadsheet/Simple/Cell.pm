package Spreadsheet::Simple::Cell;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use MooseX::Types::Moose 'Maybe', 'Str';

use namespace::clean -except => 'meta';

has 'data' => (
    is       => 'rw',
    isa      => Maybe[Str],
    required => 1,
);

1;
