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
	my ($method, $self, $col) = @_;
	my $cell = $self->$method($col);

	return $cell if defined $cell;

	$cell = Spreadsheet::Simple::Cell->new( value => undef );
	
	$self->set_cell($col, $cell);

	return $cell;
};

sub get_cell_value {
	my ($self, $col) = @_;
	
	return $self->get_cell($col)->value;
}

sub get_cell_values {
	my ($self, @cols) = @_;
	return map { $self->get_cell_value($_) } @cols;
}

sub cell_values {
	my ($self) = @_;

	return map { $_->value } $self->cells
}

1;
