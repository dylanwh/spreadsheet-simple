package Spreadsheet::Simple::Role::Writer;
use Moose::Role;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use namespace::clean -except => 'meta';

requires 'write_file';

1;
