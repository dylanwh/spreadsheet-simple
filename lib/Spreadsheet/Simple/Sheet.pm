package Spreadsheet::Simple::Sheet;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use Spreadsheet::Simple::Row;

use namespace::clean -except => 'meta';

has 'name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has 'rows' => (
    is         => 'ro',
    isa        => 'ArrayRef[Spreadsheet::Simple::Row]',
    lazy_build => 1,
    auto_deref => 1,
);

1;
