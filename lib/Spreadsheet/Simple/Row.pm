package Spreadsheet::Simple::Row;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use Spreadsheet::Simple::Types 'Cells';

use namespace::clean -except => 'meta';

has 'cells' => (
    is         => 'ro',
    isa        => Cells,
    auto_deref => 1,
    required   => 1,
    coerce     => 1,
);

1;
