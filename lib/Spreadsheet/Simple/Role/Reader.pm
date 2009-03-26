package Spreadsheet::Simple::Role::Reader;
use Moose::Role;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use namespace::clean -except => 'meta';

requires 'read_file';

1;
