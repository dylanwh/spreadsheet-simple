package Spreadsheet::Simple::Cell;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use MooseX::Types::Moose 'Maybe', 'Str', 'Int';
use MooseX::Types::Structured 'Tuple';

use namespace::clean -except => 'meta';

has 'value' => (
    is       => 'rw',
    isa      => Maybe[Str],
    required => 1,
);

has 'color' => (
    is         => 'ro',
    isa        => Maybe [ Tuple [ Int, Int, Int ] ],
    auto_deref => 1,
);

1;
