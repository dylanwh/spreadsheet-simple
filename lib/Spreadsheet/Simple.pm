package Spreadsheet::Simple;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use namespace::clean -except => 'meta';

has 'reader' => (
    is         => 'ro',
    does       => 'Spreadsheet::Simple::Role::Reader',
    lazy_build => 1,
    handles    => ['read_file'],
);

has 'writer' => (
    is         => 'ro',
    does       => 'Spreadsheet::Simple::Role::Writer',
    lazy_build => 1,
    handles    => ['write_file'],
);

1;

=head1 NAME

Spreadsheet::Simple- Simple spreadsheet API.

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

    use Spreadsheet::Simple;

    my $s = Spreadsheet::Simple->new;


=head1 BUGS

Please report any bugs or feature requests to C<bug-spreadsheet-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Spreadsheet-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 AUTHOR

Dylan William Hardison, C<< <dylan at hardison.net> >>

=head1 COPYRIGHT

Copyright 2009 Dylan William Hardison, Infinity Interactive. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
