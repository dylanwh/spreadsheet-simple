#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 1;
use Test::Exception;

use Spreadsheet::Simple::Row;

lives_ok {
    my $row = Spreadsheet::Simple::Row->new( cells => [ "foo", "bar", "baz" ] );
};

