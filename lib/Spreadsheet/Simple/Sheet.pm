package Spreadsheet::Simple::Sheet;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use MooseX::Types::Moose 'Str';
use MooseX::AttributeHelpers;

use Spreadsheet::Simple::Types 'Rows';
use Spreadsheet::Simple::Row;

use namespace::clean -except => 'meta';

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has 'rows' => (
	metaclass => 'Collection::Array',
    is         => 'ro',
    isa        => Rows,
    coerce     => 1,
    auto_deref => 1,
    required   => 1,
    provides   => {
    	'push' => 'add_row',
    	'get'  => 'get_row',
    	'set'  => 'set_row',
    },
);

sub new_row {
	my ($self, @args) = @_;
	my $row = Spreadsheet::Simple::Row->new(@args);

	return $row;
}

1;
