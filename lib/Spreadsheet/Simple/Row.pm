package Spreadsheet::Simple::Row;
use Moose;
use MooseX::AttributeHelpers;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use Spreadsheet::Simple::Types 'Cells';

use namespace::clean -except => 'meta';

has 'cells' => (
	metaclass  => 'Collection::Array',
    is         => 'ro',
    isa        => Cells,
    auto_deref => 1,
    required   => 1,
    coerce     => 1,
    provides   => {
    	get => 'get_cell',
    	set => 'set_cell',
    },
);

around 'get_cell' => sub {
	my ($method, $self, $idx) = @_;
	my $cell = $self->$method($idx);

	return $cell if defined $cell;

	$cell = Spreadsheet::Simple::Cell->new( value => undef );
	
	$self->set_cell($idx, $cell);

	return $cell;
};

1;
