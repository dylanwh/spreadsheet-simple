package Spreadsheet::Simple::Cell;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use MooseX::Types -declare => [qw( RGB )];
use MooseX::Types::Moose qw( Maybe Str Int );
use MooseX::Types::Structured 'Tuple';

subtype RGB, as Tuple[Int, Int, Int];

use namespace::clean -except => 'meta';

has 'value' => (
    is       => 'rw',
    isa      => Maybe[Str],
    required => 1,
);

has 'color' => (
    is  => 'ro',
    isa => Maybe [RGB],
);

1;
