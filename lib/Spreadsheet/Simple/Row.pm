package Spreadsheet::Simple::Row;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use Spreadsheet::Simple::Cell;

use namespace::clean -except => 'meta';

has 'cells' => (
    is         => 'ro',
    isa        => 'ArrayRef[Spreadsheet::Simple::Cell]',
    lazy_build => 1,
    auto_deref => 1,
);

1;
